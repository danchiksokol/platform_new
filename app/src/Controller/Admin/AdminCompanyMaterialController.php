<?php

namespace App\Controller\Admin;

use App\Entity\CompanyMaterial;
use App\Form\CompanyMaterialFormType;
use App\Repository\CompanyMaterialRepository;
use App\Repository\CompanyRepository;
use App\Services\CompanyMaterial\CompanyMaterialService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Exception;

#[Route('/admin/company/material', name: 'app_admin_company_')]
class AdminCompanyMaterialController extends AdminBaseController
{
    private CompanyRepository $companyRepository;
    private CompanyMaterialService $companyMaterialService;
    private CompanyMaterialRepository $companyMaterialRepository;

    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyMaterialRepository $companyMaterialRepository
     * @param CompanyMaterialService $companyMaterialService
     */
    public function __construct(
        CompanyRepository $companyRepository,
        CompanyMaterialRepository $companyMaterialRepository,
        CompanyMaterialService $companyMaterialService
    ) {
        $this->companyRepository = $companyRepository;
        $this->companyMaterialService = $companyMaterialService;
        $this->companyMaterialRepository = $companyMaterialRepository;
    }

    #[Route('/', name: 'material')]
    public function indexAction(): Response
    {
        return $this->render('admin_company_material/index.html.twig', [
            'controller_name' => 'AdminCompanyMaterialController',
        ]);
    }


    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/create', name: 'material_create')]
    public function createAction(Request $request): Response
    {
        $companyMaterial = new CompanyMaterial();
        $company = $this->companyRepository->getAllForRender();
        $form = $this->createForm(CompanyMaterialFormType::class, $companyMaterial, ['company' => $company]);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->companyMaterialService->handleCreate($companyMaterial, $form);
            $this->addFlash('Success', 'Добавлена успешно');

            return $this->redirectToRoute('app_admin_company');
        }

        return $this->render(
            'admin/company_material/form.html.twig',
            [
                'companyMaterialForm' => $form->createView(),
            ]
        );
    }


    /**
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/delete/{id}', name: 'material_delete')]
    public function deleteAction(int $id): Response
    {
        $companyMaterial = $this->companyMaterialRepository->getOne($id);
        $this->companyMaterialService->handleDelete($companyMaterial);
        $this->addFlash('success', 'Материал удален');

        return $this->redirectToRoute('app_admin_company');
    }
}
