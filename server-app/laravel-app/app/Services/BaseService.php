<?php

namespace App\Services;

use Exception;
use Illuminate\Support\Facades\DB;

abstract class BaseService {
    protected $repository;

    abstract function getRepository();

    public function setRepository() {
        return app()->make($this->getRepository());
    }

    public function __construct()
    {
        $this->repository = $this->setRepository();
    }

    public function getResponse200($data){
        return [
            'status' => 200,
            'message' => 'Success',
            'data' => $data
        ];
    }

    public function getResponse500($error){
        return [
            'status' => 500,
            'message' => $error,
            'data' => null
        ];
    }

    public function getAll() {
        $data = $this->repository->getAll();
        return $this->getResponse200($data);
    }

    public function getData($column = '*', $relation = [])
    {
        $data = $this->repository->getData($column, $relation);
        return $this->getResponse200($data);
    }

    public function findByIds($column = '*', array $ids)
    {
        $data = $this->repository->findByIds($column, $ids);
        return $this->getResponse200($data);
    }

    public function getById($id)
    {
        $data = $this->repository->getById($id);
        return $this->getResponse200($data);
    }

    public function save(array $request)
    {
        try {
            DB::beginTransaction();
            $data = $this->repository->save($request);
            DB::commit();
            return $this->getResponse200($data);
        } catch(Exception $e) {
            DB::rollBack();
            return $this->getResponse500($e->getMessage());
        }
    }

    public function delete($id)
    {
        return $this->repository->delete($id);
    }

    public function paginate(array $data) {
        return $this->repository->paginate($data);
    }
}
