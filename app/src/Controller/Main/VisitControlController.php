<?php

namespace App\Controller\Main;

use App\Services\VisitControl\VisitControlService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/visit/control', name: 'visit_control_')]
class VisitControlController extends AbstractController
{
    private VisitControlService $visitControlService;

    /**
     * @param VisitControlService $visitControlService
     */
    public function __construct(VisitControlService $visitControlService)
    {
        $this->visitControlService = $visitControlService;
    }

    #[Route('/visit/control/ajax', name: 'visit_control_ajax')]
    public function ajaxAction(Request $request): Response
    {
        $user = $this->getUser();
        if ($request->isXMLHttpRequest()) {
            $visitControl = $this->visitControlService->handleCreate($request, $user);
            return new JsonResponse(array('output' => $visitControl));
        }

        return new Response('This is not ajax!', 400);
    }
}
