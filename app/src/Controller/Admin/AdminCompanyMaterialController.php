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

    #[Route('/index/{id}', name: 'material')]
    public function indexAction($id): Response
    {
        $company = $this->companyRepository->getOne($id);
        $materials = $company->getCompanyMaterials();

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Карточка компании';
        $forRender['company'] = $company;
        $forRender['materials'] = $materials;
        return $this->render('admin/company_material/index.html.twig', $forRender);
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

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/show/{id}', name: 'material_show')]
    public function showAction(int $id): Response
    {
        $companyMaterial = $this->companyMaterialRepository->getOne($id);
        $this->companyMaterialService->handleShow($companyMaterial);
        $this->addFlash('success', 'Материал Отображена');
        $companyId = $companyMaterial->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_material', ['id' => $companyId]);
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/hide/{id}', name: 'material_hide')]
    public function hideAction(int $id): Response
    {
        $companyMaterial = $this->companyMaterialRepository->getOne($id);
        $this->companyMaterialService->handleHide($companyMaterial);
        $this->addFlash('success', 'Материал Скрыт');
        $companyId = $companyMaterial->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_material', ['id' => $companyId]);
    }

}
