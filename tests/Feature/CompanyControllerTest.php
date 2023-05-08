<?php

namespace Tests\Feature;

use App\Models\Api\v1\Company;
use Tests\TestCase;
use Illuminate\Http\Response;

class CompanyControllerTest extends TestCase
{
    /**
     * @return void
     */
    public function testGetAllCompanies()
    {
        $this->withoutMiddleware();
        $this->json('get', 'api/v1/companies')
            ->assertStatus(Response::HTTP_OK)
            ->assertJsonStructure([
                "data" => [
                    '*' => [
                        'id',
                        'company_name',
                        'parent_company_id'
                    ]
                ]
            ]);
    }

    public function testViewASingleCompany()
    {
        $company = Company::create(Company::factory()->make()->getAttributes());

        $this->withoutMiddleware();
        $this->json('get', 'api/v1/companies/' . $company->id)
            ->assertStatus(Response::HTTP_OK)
            ->assertJsonStructure([
                "data" => [
                    'id',
                    'company_name',
                    'parent_company_id'
                ]
            ]);
    }

    /**
     * @return void
     */
    public function testStoreANewCompany()
    {
        $data = [
            'company_name' => fake('Fi-fi')->company,
            'parent_company_id' => rand(0, 100)
        ];

        $this->withoutMiddleware();
        $this->json('post', 'api/v1/companies', $data)
            ->assertStatus(Response::HTTP_CREATED)
            ->assertJsonStructure([
                'data' => [
                    'id',
                    'company_name',
                    'parent_company_id'
                ]
            ]);
        $this->assertDatabaseHas('companies', $data);
    }

    public function testUpdateACompany()
    {

        $company = Company::create(Company::factory()->make()->getAttributes());
        $payload = Company::factory()->make();

        $this->withoutMiddleware();
        $this->json('put', 'api/v1/companies/' . $company->id, [
            'company_name' => $payload['company_name'],
            'parent_company_id' => $payload['parent_company_id']
        ])
            ->assertStatus(Response::HTTP_OK)
            ->assertJsonStructure([
                'data' => [
                    'id',
                    'company_name',
                    'parent_company_id'
                ]
            ]);
    }

    public function testDeleteACompany() {
        $companyAttributes = Company::factory()->make()->getAttributes();
        $company = Company::create($companyAttributes);

        $this->withoutMiddleware();
        $this->json('delete', 'api/v1/companies/'.$company->id)
            ->assertStatus(Response::HTTP_NO_CONTENT)
            ->assertNoContent();

//        $this->assertDatabaseMissing('companies', [
//           'id' => $company->id,
//           'parent_company_id' => $companyAttributes['parent_company_id'],
//           'company_name' => $companyAttributes['company_name'],
//           'created_at' => (string) $company->created_at,
//           'updated_at' => (string) $company->updated_at
//        ]);
    }

}
