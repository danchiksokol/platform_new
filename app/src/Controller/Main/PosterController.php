<?php

namespace App\Controller\Main;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PosterController extends BaseController
{
    #[Route('/poster', name: 'poster')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Постеры';

        return $this->render(
            'main/poster/index.html.twig',
            $forRender
        );
    }
}
