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

    #[Route('/index/{id}', name: 'company_video')]
    public function indexAction(ind $id): Response
    {
        $company = $this->companyRepository->getOne($id);
        $video = $company->getCompanyVideos();

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Видео компании';
        $forRender['company'] = $company;
        $forRender['video'] = $video;
        return $this->render('admin/company_material/index.html.twig', $forRender);
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
        $this->addFlash('success', 'Материал Отображена');
        $companyId = $companyVideo->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_video', ['id' => $companyId]);
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/hide/{id}', name: 'material_hide')]
    public function hideAction(int $id): Response
    {
        $companyVideo = $this->companyMaterialRepository->getOne($id);
        $this->companyVideoService->handleHide($companyVideo);
        $this->addFlash('success', 'Материал Скрыт');
        $companyId = $companyVideo->getCompany()->getId();

        return $this->redirectToRoute('app_admin_company_video', ['id' => $companyId]);
    }

}
