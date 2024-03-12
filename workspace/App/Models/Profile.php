<?php

namespace App\Models;

class Profile extends Record
{
    const TABLENAME = 'profile';
    const FILLABLE = ['id', 'description'];
}