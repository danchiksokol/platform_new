<?php

namespace App\Controller\Admin;

use Exception;
use App\Entity\Company;
use App\Form\CompanyFormType;
use App\Repository\CompanyRepository;
use App\Services\Company\CompanyService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


#[Route('/admin', name: 'app_admin_')]
class AdminCompanyController extends AdminBaseController
{
    private CompanyRepository $companyRepository;
    private CompanyService $companyService;

    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyService $companyService
     */
    public function __construct(CompanyRepository $companyRepository, CompanyService $companyService)
    {
        $this->companyRepository = $companyRepository;
        $this->companyService = $companyService;
    }

    #[Route('/company', name: 'company')]
    public function indexAction(): Response
    {
        $company = $this->companyRepository->getAll();
        $forRender = parent::renderDefault();
        $forRender['company'] = $company;
        $forRender['title'] = 'Админка Компаний';

        return $this->render('admin/company/index.html.twig', $forRender);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/company/create', name: 'company_create')]
    public function createAction(Request $request): Response
    {
        $company = new Company();
        $form = $this->createForm(CompanyFormType::class, $company);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->companyService->handleCreate($company, $form);
            $this->addFlash('Success', 'Добавлена успешно');

            return $this->redirectToRoute('app_admin_company');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Добавление компании';
        $forRender['companyForm'] = $form->createView();

        return $this->render(
            'admin/company/form.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/company/update/{id}', name: 'company_update')]
    public function updateAction(Request $request, int $id): Response
    {
        $company = $this->companyRepository->getOne($id);
        $logo = $company->getLogo();
        $form = $this->createForm(CompanyFormType::class, $company);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->companyService->handleUpdate($company, $form, $logo);
            $this->addFlash('Success', 'Изменена успешно');

            return $this->redirectToRoute('app_admin_company');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Редактирование компании';
        $forRender['companyForm'] = $form->createView();

        return $this->render(
            'admin/company/form.html.twig',
            $forRender
        );
    }

    /**
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/company/delete/{id}', name: 'company_delete')]
    public function deleteAction(int $id): Response
    {
        $company = $this->companyRepository->getOne($id);
        $this->companyService->handleDelete($company);
        $this->addFlash('success', 'Компания удалена');

        return $this->redirectToRoute('app_admin_company');
    }

}
