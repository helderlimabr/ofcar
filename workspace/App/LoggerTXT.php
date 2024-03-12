<?php

namespace App;

class LoggerTXT extends Logger {

    function write($message) {
        date_default_timezone_set('America/Fortaleza');
        $time = date("Y-m-d H:i:s");
        $text = "$time :: $message\n";
        $handler = fopen($this->filename, 'a');
        fwrite($handler, $text);
        fclose($handler);
    }
}