<?php

namespace App\Controller\Main;

use App\Services\UserStatistics\UserStatisticsService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/user/statistics', name: 'app_user_statistics_')]
class UserStatisticsController extends BaseController
{
    private UserStatisticsService $statisticsService;

    /**
     * @param UserStatisticsService $statisticsService
     */
    public function __construct(UserStatisticsService $statisticsService)
    {
        $this->statisticsService = $statisticsService;
    }
    #[Route('/ajax', name: 'ajax')]
    public function ajaxAction(Request $request): Response
    {
        $user = $this->getUser();
        if ($request->isXMLHttpRequest()) {
            $statistics = $this->statisticsService->handleCreate($request, $user);
            return new JsonResponse(array('output' => $statistics));
        }

        return new Response('This is not ajax!', 400);
    }
}
