<?php

namespace App\Services;


abstract class BaseService {
    public function getResponse200($data = [], $message = 'Success'){
        return [
            'success' => true,
            'message' => $message,
            'data' => $data
        ];
    }

    public function getResponse500($error = 'No data found!'){
        return [
            'success' => false,
            'message' => $error
        ];
    }
}
