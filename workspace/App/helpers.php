<?php

function url($path = '') {
    return $_ENV['BASE_URL'] . $path;
}