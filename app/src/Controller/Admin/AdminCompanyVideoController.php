<?php

namespace App\Controller\Admin;


use App\Entity\CompanyVideo;
use App\Form\CompanyVideoFormType;
use App\Repository\CompanyRepository;
use App\Repository\CompanyVideoRepository;
use App\Services\CompanyVideo\CompanyVideoService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/company/video', name: 'app_admin_')]
class AdminCompanyVideoController extends AdminBaseController
{
    private CompanyRepository $companyRepository;
    private CompanyVideoService $companyVideoService;
    private CompanyVideoRepository $companyVideoRepository;

    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyVideoRepository $companyVideoRepository
     * @param CompanyVideoService $companyVideoService
     */
    public function __construct(CompanyRepository $companyRepository, CompanyVideoRepository $companyVideoRepository, CompanyVideoService $companyVideoService)
    {
        $this->companyRepository = $companyRepository;
        $this->companyVideoService = $companyVideoService;
        $this->companyVideoRepository = $companyVideoRepository;
    }

    #[Route('/', name: 'company_video')]
    public function indexAction(): Response
    {
        return $this->render('admin_company_video/index.html.twig', [
            'controller_name' => 'AdminCompanyVideoController',
        ]);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/create', name: 'company_video_create')]
    public function createAction(Request $request):Response
    {
        $companyVideo = new CompanyVideo();
        $company = $this->companyRepository->getAllForRender();
        $form = $this->createForm(CompanyVideoFormType::class, $companyVideo, ['company' => $company]);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->companyVideoService->handleCreate($companyVideo, $form);
            $this->addFlash('Success', 'Добавлена успешно');

            return $this->redirectToRoute('app_admin_company');
        }

        return $this->render(
            'admin/company_video/form.html.twig',
            [
                'companyVideoForm' => $form->createView(),
            ]
        );
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/delete/{id}', name: 'company_video_delete')]
    public function deleteAction(int $id):Response
    {
        $companyMaterial = $this->companyVideoRepository->getOne($id);
        $this->companyVideoService->handleDelete($companyMaterial);
        $this->addFlash('success', 'Материал удален');

        return $this->redirectToRoute('app_admin_company');
    }

}
