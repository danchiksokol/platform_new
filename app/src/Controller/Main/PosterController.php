<?php

namespace App\Controller\Main;

use App\Repository\PosterCategoryRepository;
use App\Repository\PosterRepository;
use App\Services\Poster\PosterService;
use App\Services\PosterCategory\PosterCategoryService;
use App\Services\Vote\VoteService;
use Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/poster', name: 'app_')]
class PosterController extends BaseController
{
    private PosterService $posterService;
    private VoteService $voteService;
    private PosterCategoryService $posterCategoryService;
    private PosterRepository $posterRepository;
    private PosterCategoryRepository $posterCategoryRepository;

    /**
     * PosterController constructor.
     * @param PosterService $posterService
     * @param VoteService $voteService
     * @param PosterRepository $posterRepository
     * @param PosterCategoryRepository $posterCategoryRepository
     */
    public function __construct(
        PosterService $posterService,
        VoteService $voteService,
        PosterRepository $posterRepository,
        PosterCategoryRepository $posterCategoryRepository
    ) {
        $this->posterService = $posterService;
        $this->voteService = $voteService;
        $this->posterRepository = $posterRepository;
        $this->posterCategoryRepository = $posterCategoryRepository;
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/{categoryId}', name: 'poster', defaults: ['categoryId' => 0])]
    public function indexAction(
        Request $request
    ): Response {
        $category = $this->posterCategoryRepository->getAll();
        $categoryId = $request->get('categoryId');
        $posters = $this->posterRepository->getAll();
        if ($categoryId) {
            $posters = $this->posterRepository->getAllByCategory($categoryId);
        }
        $user = $this->getUser();
        $countVotePoster = $this->posterService->countVotePoster($request, $user);
        $isVote = $this->voteService->isVote($user);
        $selectedPosters = $this->posterService->getPostersFromSession($request, $user);

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Постеры';
        $forRender['categories'] = $category;
        $forRender['posters'] = $posters;
        $forRender['selectedPosters'] = $selectedPosters;
        $forRender['countVotePoster'] = $countVotePoster;
        $forRender['isVote'] = (int)$isVote;

        return $this->render(
            'main/poster/index.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/ajax/create', name: 'poster_ajax_create')]
    public function createVotePosterAction(
        Request $request
    ): Response {
        $user = $this->getUser();
        if ($request->isXMLHttpRequest() && $request->get('posterId')) {
            $posterId = (int)$request->get('posterId');
            $votePosters = $this->posterService->handleCreateVotePosterInSession($request, $user, $posterId);
            return new JsonResponse(array('output' => $votePosters));
        }

        return new Response('This is not ajax!', 400);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/ajax/delete', name: 'poster_ajax_delete')]
    public function deleteVotePosterAction(
        Request $request
    ): Response {
        $user = $this->getUser();
        if ($request->isXMLHttpRequest() && $request->get('posterId')) {
            $posterId = (int)$request->get('posterId');
            $votePosters = $this->posterService->handleDeleteVotePosterFromSession($request, $user, $posterId);
            return new JsonResponse(array('output' => $votePosters));
        }

        return new Response('This is not ajax!', 400);
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/ajax/vote', name: 'poster_ajax_vote')]
    public function voteAction(
        Request $request
    ): Response {
        $user = $this->getUser();
        if ($request->isXMLHttpRequest()) {
            $votePosters = $this->voteService->handleCreate($request, $user);
            return new JsonResponse(array('output' => $votePosters));
        }

        return new Response('This is not ajax!', 400);
    }


    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/ajax/vote/view', name: 'poster_ajax_vote_view')]
    public function voteViewAction(Request $request): Response
    {
        $user = $this->getUser();
        if ($request->isXMLHttpRequest()) {
            $posters = $this->posterService->getPostersFromSession($request, $user);
            return new JsonResponse(array('output' => $posters));
        }

        return new Response('This is not ajax!', 400);
    }
}
