<?php

namespace App\Controller\Admin;

use App\Entity\Poster;
use App\Form\PosterFormType;
use App\Repository\PosterCategoryRepository;
use App\Repository\PosterRepository;
use App\Services\Poster\PosterService;
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

    /**
     * @param PosterService $posterService
     * @param PosterRepository $posterRepository
     * @param PosterCategoryRepository $posterCategoryRepository
     */
    public function __construct(
        PosterService $posterService,
        PosterRepository $posterRepository,
        PosterCategoryRepository $posterCategoryRepository
    ) {
        $this->posterService = $posterService;
        $this->posterRepository = $posterRepository;
        $this->posterCategoryRepository = $posterCategoryRepository;
    }

    #[Route('/poster/', name: 'poster')]
    public function indexAction(Request $request): Response
    {
        $catId = (int)$request->get('catId');
        $posters = $this->posterRepository->getAll();
        if ($catId) {
            $posters = $this->posterRepository->getAllByCategory($catId);
        }


        $forRender = parent::renderDefault();
        $forRender['title'] = 'Админка постеров';
        $forRender['posters'] = $posters;
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
}