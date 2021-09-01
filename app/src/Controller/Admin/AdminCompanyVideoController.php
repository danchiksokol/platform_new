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

#[Route('/admin/company/video', name: 'app_admin_company_')]
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

    #[Route('/index/{id}', name: 'video')]
    public function indexAction(int $id): Response
    {
        $company = $this->companyRepository->getOne($id);
        $video = $company->getCompanyVideos();

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Видео компании';
        $forRender['company'] = $company;
        $forRender['video'] = $video;
        return $this->render('admin/company_video/index.html.twig', $forRender);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/create', name: 'video_create')]
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
     * @param Request $request
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/update/{id}', name: 'video_update')]
    public function updateAction(Request $request, int $id):Response
    {
        $companyVideo = $this->companyVideoRepository->getOne($id);
        $companyId = $companyVideo->getCompany()->getId();
        $companyVideo->setCompany($companyId);
        $company = $this->companyRepository->getAllForRender();
        $form = $this->createForm(CompanyVideoFormType::class, $companyVideo, ['company' => $company]);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->companyVideoService->handleUpdate($companyVideo, $form);
            $this->addFlash('Success', 'Изменено успешно');

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
    #[Route('/delete/{id}', name: 'video_delete')]
    public function deleteAction(int $id):Response
    {
        $companyVideo = $this->companyVideoRepository->getOne($id);
        $this->companyVideoService->handleDelete($companyVideo);
        $this->addFlash('success', 'Материал удален');
        $companyId = $companyVideo->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_video', ['id' => $companyId]);
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/show/{id}', name: 'video_show')]
    public function showAction(int $id): Response
    {
        $companyVideo = $this->companyVideoRepository->getOne($id);
        $this->companyVideoService->handleShow($companyVideo);
        $this->addFlash('success', 'Видео Отображено');
        $companyId = $companyVideo->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_video', ['id' => $companyId]);
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/hide/{id}', name: 'video_hide')]
    public function hideAction(int $id): Response
    {
        $companyVideo = $this->companyVideoRepository->getOne($id);
        $this->companyVideoService->handleHide($companyVideo);
        $this->addFlash('success', 'Видео Скрыто');
        $companyId = $companyVideo->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_video', ['id' => $companyId]);
    }

}
