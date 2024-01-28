<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

abstract class BaseController extends Controller {
    protected $service;

    abstract function getService();

    public function setService() {
        return app()->make($this->getService());
    }

    public function __construct()
    {
        $this->service = $this->setService();
    }

    public function getAll() {
        $result = $this->service->getAll();
        return response()->json($result);
    }

    public function getData(Request $request)
    {
        $data = $request->all();
        $result = $this->service->getData($data);
        return response()->json($result);
    }

    public function getByIds(Request $request)
    {
        $data = $request->all();
        $result = $this->service->getByIds($data);
        return response()->json($result);
    }

    public function getByColumnIds(Request $request)
    {
        $data = $request->all();
        $result = $this->service->getByColumnIds($data);
        return response()->json($result);
    }

    public function getById($id)
    {
        $result = $this->service->getById($id);
        return response()->json($result);
    }

    public function save(Request $request)
    {
        $data = $request->all();
        $result = $this->service->save($data);
        return response()->json($result);
    }

    public function delete($id)
    {
        $result = $this->service->delete($id);
        return response()->json($result);
    }

    public function paginate(Request $request)
    {
        $data = $request->all();
        $result = $this->service->paginate($data);
        return response()->json($result);
    }
}
