<?php

namespace App\Controller\Admin;

use App\Entity\News;
use App\Form\NewsFormType;
use App\Repository\NewsRepository;
use App\Services\News\NewsService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin', name: 'app_admin_')]
class AdminNewsController extends AdminBaseController
{
    private NewsRepository $newsRepository;
    private NewsService $newsService;

    /**
     * @param NewsRepository $newsRepository
     * @param NewsService $newsService
     */
    public function __construct(NewsRepository $newsRepository, NewsService $newsService)
    {
        $this->newsRepository = $newsRepository;
        $this->newsService = $newsService;
    }

    #[Route('/news', name: 'news')]
    public function indexAction(): Response
    {
        $news = $this->newsRepository->getAll();
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Админка новостей';
        $forRender['news'] = $news;

        return $this->render('admin/news/index.html.twig', $forRender);
    }

    #[Route('/news/create', name: 'news_create')]
    public function createAction(Request $request): Response
    {
        $news = new News();
        $form = $this->createForm(NewsFormType::class, $news);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->newsService->handleCreate($news, $form);
            $this->addFlash('Success', 'Добавлен успешно');

            return $this->redirectToRoute('app_admin_news');
        }
        return $this->render(
            'admin/news/form.html.twig',
            [
                'newsForm' => $form->createView(),
            ]
        );
    }

    /**
     * @param Request $request
     * @param int $id
     * @return Response
     */
    #[Route('/news/update/{id}', name: 'news_update')]
    public function updateAction(Request $request, int $id): Response
    {
        $news = $this->newsRepository->getOne($id);
        $file = $news->getFile();
        $form = $this->createForm(NewsFormType::class, $news);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            if ($form->get('save')->isClicked()) {
                $this->newsService->handleUpdate($news, $form, $file);
                $this->addFlash('success', 'Изменения сохранены');
            }

            return $this->redirectToRoute('app_admin_news');
        }
        return $this->render(
            'admin/news/form.html.twig',
            [
                'newsForm' => $form->createView(),
            ]
        );
    }


    /**
     * @param int $id
     * @return Response
     */
    #[Route('/news/delete/{id}', name: 'news_delete')]
    public function deleteAction(int $id): Response
    {
        $news = $this->newsRepository->getOne($id);
        $this->newsService->handleDelete($news);
        $this->addFlash('success', 'Новость удалена');

        return $this->redirectToRoute('app_admin_news');
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/news/show/{id}', name: 'news_show')]
    public function showAction(int $id): Response
    {
        $news = $this->newsRepository->getOne($id);
        $this->newsService->handleShow($news);
        $this->addFlash('success', 'Новость Отображена');

        return $this->redirectToRoute('app_admin_news');
    }

    /**
     * @param int $id
     * @return Response
     */
    #[Route('/news/hide/{id}', name: 'news_hide')]
    public function hideAction(int $id): Response
    {
        $news = $this->newsRepository->getOne($id);
        $this->newsService->handleHide($news);
        $this->addFlash('success', 'Новость Скрыта');

        return $this->redirectToRoute('app_admin_news');
    }

}
