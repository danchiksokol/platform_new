<?php

namespace App\Controller\Main;

use App\Services\Poster\PosterService;
use Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/poster', name: 'app_')]
class PosterController extends BaseController
{
    private PosterService $posterService;

    /**
     * PosterController constructor.
     * @param PosterService $posterService
     */
    public function __construct(PosterService $posterService)
    {
        $this->posterService = $posterService;
    }

    #[Route('/', name: 'poster')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Постеры';

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
    #[Route('/ajax', name: 'poster_ajax')]
    public function posterVoteAction(
        Request $request
    ): Response {
        $userId = $this->getUser()->getId();
        if ($request->isXMLHttpRequest() && $request->get('posterId')) {
            $posterId = (int)$request->get('posterId');
            $votePosters = $this->posterService->handleSession($request, $userId, $posterId);
            return new JsonResponse(array('output' => $votePosters));
        }

        return new Response('This is not ajax!', 400);
    }
}
