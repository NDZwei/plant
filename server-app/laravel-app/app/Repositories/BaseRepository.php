<?php

namespace App\Repositories;

use Exception;

abstract class BaseRepository {
    protected $model;

    abstract function getModel();

    public function setModel() {
        return app()->make($this->getModel());
    }

    public function __construct()
    {
        $this->model = $this->setModel();
    }

    public function getAll()
    {
        return $this->model->all();
    }

    public function getData($column = '*', $relation = [])
    {
        return $this->model->with($relation)->get($column);
    }

    public function findByIds(array $ids, $columns = ['*'])
    {
        return $this->model->whereIn('id', $ids)->get($columns);
    }

    public function getById($id)
    {
        return $this->model->where('id', $id)->first();
    }

    public function saveModel(array $data) {
        try {
            if(isset($data['id'])) {
                $modelById = $this->model->find($data['id']);
                if ($modelById) {
                    return $modelById->update($data);
                }
            } else {
                return $this->model->create($data);
            }
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }

    public function destroy($id)
    {
        return $this->model->destroy($id);
    }

    public function deleteById($id)
    {
        $data = $this->model->find($id);
        if ($data) {
            $this->model->find($id)->delete();
            return 1;
        }
        else {
            return 0;
        }
    }
}
