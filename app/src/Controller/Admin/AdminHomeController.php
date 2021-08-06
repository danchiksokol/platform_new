<?php


namespace App\Controller\Admin;


use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin', 'app_admin_')]
class AdminHomeController extends AdminBaseController
{

    /**
     * @return Response
     */
    #[Route('/', '_home_index')]
    public function index(): Response
    {
        $forRender = parent::renderDefault();
        return $this->render(
            'admin/index.html.twig', $forRender
        );
    }
}