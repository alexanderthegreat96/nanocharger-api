<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\v1\Company\StoreCompanyRequest;
use App\Http\Requests\Api\v1\Company\UpdateCompanyRequest;
use App\Http\Resources\Api\v1\CompanyResource;
use App\Models\Api\v1\Company;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index()
    {
        return CompanyResource::collection(Company::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCompanyRequest $request)
    {
        $data = [
            'company_name' => $request->input('company_name'),
            'parent_company_id' => 0
        ];

        if($request->has('parent_company_id')) {;
            $data['parent_company_id'] = $request->input('parent_company_id');
        }

        return CompanyResource::make(Company::create($data));
    }

    /**
     * Display the specified resource.
     */
    public function show(Company $company)
    {
        return CompanyResource::make($company);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCompanyRequest $request, Company $company)
    {
        $data = [
            'company_name' => null,
            'parent_company_id' => 0
        ];

        if($request->has('company_name')) {
            $data['company_name']  = $request->input('company_name');
        }

        if($request->has('parent_company_id')) {;
            $data['parent_company_id'] = $request->input('parent_company_id');
        }

        $company->update($data);

        return CompanyResource::make($company);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Company $company)
    {
        $company->delete();
        return response()->json([
            'status' => true,
            'message' => 'Company was deleted!'
        ])->setStatusCode(204);
    }
}
