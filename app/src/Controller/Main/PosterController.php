<?php

namespace App\Controller\Main;

use App\Services\Poster\PosterService;
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
     */
    #[Route('/ajax', name: 'poster_ajax')]
    public function posterVoteAction(
        Request $request
    ): Response {
        if ($request->isXMLHttpRequest() && $request->get('posterId')) {
            $posterId = (int)$request->get('posterId');
            $this->posterService->handleSession($request, $posterId);
            return new JsonResponse(array('output' => $posterId));
        }

        return new Response('This is not ajax!', 400);
    }
}
