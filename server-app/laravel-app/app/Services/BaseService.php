<?php

namespace App\Services;

use Exception;
use Illuminate\Http\Response;
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
            'status' => Response::HTTP_OK,
            'message' => 'Success',
            'data' => $data
        ];
    }

    public function getResponse400(){
        return [
            'status' => Response::HTTP_BAD_REQUEST,
            'message' => 'Bad request',
            'data' => null
        ];
    }


    public function getResponse404(){
        return [
            'status' => Response::HTTP_NOT_FOUND,
            'message' => 'Success',
            'data' => null
        ];
    }

    public function getResponse500($error){
        return [
            'status' => Response::HTTP_INTERNAL_SERVER_ERROR,
            'message' => $error,
            'data' => null
        ];
    }

    public function getAll() {
        $data = $this->repository->getAll();
        return $this->getResponse200($data);
    }

    public function getData(array $request)
    {
        $column = $request['column'] ?? '*';
        $relation = $request['relation'] ?? [];
        $data = $this->repository->getData($column, $relation);
        return $this->getResponse200($data);
    }

    public function getByIds(array $request)
    {
        if(isset($request['ids']) && !empty($request['ids'])) {
            $column = $request['column'] ?? '*';
            $data = $this->repository->getByIds($column, $request['ids']);
            return $this->getResponse200($data);
        }
        return $this->getResponse500('Ids can not be empty');
    }

    public function getByColumnIds(array $request)
    {
        $column = $request['column'] ?? '*';
        if(!isset($request['ids']) || empty($request['ids'])) {
            return $this->getResponse500('Ids can not be empty');
        }
        if(!isset($request['fieldId'])) {
            return $this->getResponse500('fieldId can not be null');
        }
        $data = $this->repository->getByColumnIds($column, $request['fieldId'], $request['ids']);
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
