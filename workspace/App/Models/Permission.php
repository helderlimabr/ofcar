<?php

namespace App\Models;

class Permission extends Record
{
    const TABLENAME = 'permission';
    const FILLABLE = ['id', 'description'];
}