<?php

namespace App\Models;

class User extends Record {
    const TABLENAME = 'user';

    const FILLABLE = ['id', 'full_name', 'cpf', 'email'];

}