<?php

namespace App\Models;

use Exception;
use App\Transaction;

abstract class Record {
    protected $data;

    public function __construct($id = NULL) {
        if ($id) {
            $object = $this->load($id);
            if ($object) {
                $this->fromArray($object->toArray());
            }
        }
    }

    public function fromArray($data) {
        $this->data = $data;
    }

    public function toArray() {
        return $this->data;
    }

    private function __clone() {
        unset($this->data['id']);
    }

    public function __set($prop, $value) {
        if (method_exists($this, 'set_' . $prop)) {
            call_user_func(array($this, 'set_' . $prop), $value);
        } else {
            if ($value === NULL) {
                unset($this->data[$prop]);
            } else {
                $this->data[$prop] = $value;
            }
        }
    }

    public function __get($prop) {
        if (method_exists($this, 'get_' . $prop)) {
            call_user_func(array($this, 'get_' . $prop));
        } else {
            if (isset($this->data[$prop])) {
                return $this->data[$prop];
            }
        }
    }

    public function __isset($prop) {
        return isset($this->data[$prop]);
    }

    public function getEntity() {
        $class = get_class($this);
        return constant("{$class}::TABLENAME");
    }

    public function store() {
        $prepared = $this->prepare($this->data);
        if (empty($this->data['id'])) {
            $sql = "INSERT INTO {$this->getEntity()}" .
                '(' . implode(', ', array_keys($prepared)) . ' )' .
                ' values ' .
                '(' . implode(', ', array_values($prepared)) . ' )';
        } else {
            $sql = "UPDATE {$this->getEntity()}";
            if ($prepared) {
                unset($prepared['created_at']);
                unset($prepared['updated_at']);
                unset($prepared['id']);
                foreach ($prepared as $column => $value) {
                    $set[] = "{$column} = {$value}";
                }
            }
            $sql .= ' SET updated_at = NOW(), ' . implode(', ', $set);
            $sql .= ' WHERE id = ' . (int)$this->data['id'];
        }
        if ($conn = Transaction::get()) {
            Transaction::log($sql);
            $result = $conn->exec($sql);
            return $result;
        } else {
            throw new Exception('Não há transação ativa!');
        }
    }

    public function load($id) {
        $sql = "SELECT * FROM {$this->getEntity()}";
        $sql .= ' WHERE id = ' . (int)$id;
        if ($conn = Transaction::get()) {
            Transaction::log($sql);
            $result = $conn->query($sql);
            if ($result) {
                $object = $result->fetchObject(get_class($this));
            }
            return $object;

        } else {
            throw new Exception('Não há transação ativa!');
        }
    }

    public function list() {
        $sql = "SELECT * FROM {$this->getEntity()}";
        if ($conn = Transaction::get()) {
            Transaction::log($sql);
            $result = $conn->query($sql);
            if ($result) {
                $object = $result->fetchAll();
            }
            return $object;

        } else {
            throw new Exception('Não há transação ativa!');
        }
    }

    public function delete($id) {
        $id = $id ? $id : $this->id;
        $sql = "DELETE FROM {$this->getEntity()}";
        //        $sql .= " WHERE id = " . (int) $this->data['id'];
        $sql .= " WHERE id = " . (int)$id;

        if ($conn = Transaction::get()) {
            Transaction::log($sql);
            $result = $conn->exec($sql);
            return $result;
        } else {
            throw new Exception('Não há transação ativa!');
        }
    }

    public static function find($id) {
        $classname = get_called_class();
        $ar = new $classname;
        return $ar->load($id);
    }

    private function getLast() {
        if ($conn = Transaction::get()) {
            $sql = "SELECT max(id) FROM {$this->getEntity()}";
            Transaction::log($sql);
            $result = $conn->query($sql);
            $row = $result->fetch();
            return $row[0];
        } else {
            throw new Exception('Não há transação ativa!');
        }
    }

    public function prepare($data) {
        $prepared = array();
        foreach ($data as $key => $value) {
            if (is_scalar($value)) {
                $prepared[$key] = $this->escape($value);
            }
        }
        return $prepared;
    }

    public function escape($value) {
        if (is_string($value) and (!empty($value))) {
            $value = addslashes($value);
            return "'$value'";
        } else if (is_bool($value)) {
            return $value ? 'TRUE' : 'FALSE';
        } else if ($value !== '') {
            return $value;
        } else {
            return "NULL";
        }
    }
}