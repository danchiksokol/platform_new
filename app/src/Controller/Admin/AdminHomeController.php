<?php


namespace App\Controller\Admin;


use Symfony\Component\Routing\Annotation\Route;

class AdminHomeController extends AdminBaseController
{

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
    #[Route('/admin', 'admin_home')]
    public function index()
    {
        $forRender = parent::renderDefault();
        return $this->render(
            'main/index.html.twig', $forRender
        );
    }
}