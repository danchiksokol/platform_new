<?php

namespace App\Controller\Admin;

use App\Entity\Poster;
use App\Entity\PosterCategory;
use App\Form\PosterCategoryFormType;
use App\Form\PosterFormType;
use App\Repository\PosterCategoryRepository;
use App\Repository\PosterRepository;
use App\Services\Poster\PosterService;
use App\Services\PosterCategory\PosterCategoryService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin', name: 'app_admin_')]
class AdminPosterController extends AdminBaseController
{
    private PosterService $posterService;
    private PosterRepository $posterRepository;
    private PosterCategoryRepository $posterCategoryRepository;
    private PosterCategoryService $posterCategoryService;

    /**
     * @param PosterService $posterService
     * @param PosterRepository $posterRepository
     * @param PosterCategoryService $posterCategoryService
     * @param PosterCategoryRepository $posterCategoryRepository
     */
    public function __construct(
        PosterService $posterService,
        PosterRepository $posterRepository,
        PosterCategoryService $posterCategoryService,
        PosterCategoryRepository $posterCategoryRepository
    ) {
        $this->posterService = $posterService;
        $this->posterRepository = $posterRepository;
        $this->posterCategoryRepository = $posterCategoryRepository;
        $this->posterCategoryService = $posterCategoryService;
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/poster/', name: 'poster')]
    public function indexAction(Request $request): Response
    {
        $catId = (int)$request->get('catId');
        $posters = $this->posterRepository->getAll();
        if ($catId) {
            $posters = $this->posterRepository->getAllByCategory($catId);
        }
        $posterCategory = new PosterCategory();
        $form = $this->createForm(PosterCategoryFormType::class, $posterCategory);
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $this->posterCategoryService->handleCreate($posterCategory, $form);
            $this->addFlash('Success', 'Создана категория');

            return $this->redirectToRoute('app_admin_poster');
        }


        $forRender = parent::renderDefault();
        $forRender['title'] = 'Админка постеров';
        $forRender['posters'] = $posters;
        $forRender['categoryForm'] = $form->createView();
        return $this->render('admin/poster/index.html.twig', $forRender);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/poster/create', name: 'poster_create')]
    public function createAction(Request $request): Response
    {
        $poster = new Poster();
        $categories = $this->posterCategoryRepository->getAllForRender();
        $form = $this->createForm(PosterFormType::class, $poster, ['posterCategory' => $categories]);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->posterService->handleCreate($poster, $form);

            $this->addFlash('Success', 'Добавлен успешно');
            return $this->redirectToRoute('app_admin_poster');
        }

        return $this->render(
            'admin/poster/form.html.twig',
            [
                'posterForm' => $form->createView(),
            ]
        );
    }

    /**
     * @param int $id
     * @return Response
     * @throws Exception
     */
    #[Route('/poster/delete/{id}', name: 'poster_delete')]
    public function deleteAction(int $id):Response
    {
        $poster=$this->posterRepository->getOne($id);
        $this->posterService->handleDelete($poster);

        return $this->redirectToRoute('app_admin_poster');
    }

    #[Route('/poster/show/{id}', name: 'poster_show')]
    public function setShowAction(int $id):Response
    {
        $poster = $this->posterRepository->getOne($id);
        $this->posterService->handleShow($poster);

        return $this->redirectToRoute('app_admin_poster');
    }

    #[Route('/poster/hide/{id}', name: 'poster_hide')]
    public function setHideAction(int $id):Response
    {
        $poster = $this->posterRepository->getOne($id);
        $this->posterService->handleHide($poster);

        return $this->redirectToRoute('app_admin_poster');
    }
}