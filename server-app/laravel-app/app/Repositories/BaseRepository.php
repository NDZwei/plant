<?php

namespace App\Repositories;

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

    public function getByIds($columns = ['*'], array $ids)
    {
        return $this->model->whereIn('id', $ids)->get($columns);
    }

    public function getByColumnIds($columns = ['*'], string $fieldId, array $ids)
    {
        return $this->model->whereIn($fieldId, $ids)->get($columns);
    }

    public function getById($id)
    {
        return $this->model->where('id', $id)->first();
    }

    public function save(array $data) {
        if(isset($data['id'])) {
            $modelById = $this->model->find($data['id']);
            if ($modelById) {
                return $modelById->update($data);
            }
        } else {
            return $this->model->create($data);
        }
    }

    public function delete($id)
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

    public function paginate(array $data) {
        $pageIndex = $data['page_index'] ?? 1;
        $pageSize = $data['page_size'] ?? 10;
        $model = $this->model;

        if (isset($data['conditions']) && !empty($data['conditions'])) {
            $conditions = $data['conditions'];
            $model = $model->where(function ($query) use ($conditions) {
                foreach ($conditions as $item) {
                    $query->orWhere($item[0], $item[1], $item[2]);
                }
            });
        }

        $queryData = $model->paginate($pageSize, ['*'], 'page', $pageIndex);
        return $queryData;
    }
}
