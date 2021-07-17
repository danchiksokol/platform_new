<?php


namespace App\Controller\Main;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends BaseController
{

    #[Route('/', 'home')]
    public function indexAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Главная страница';
        return $this->render(
            'main/index.html.twig',
            $forRender
        );
    }

    #[Route('/programms', 'programms')]
    public function programmsAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Программы';
        return $this->render(
            'main/programms/programms.html.twig',
            $forRender
        );
    }

    #[Route('/sponsors', 'sponsors')]
    public function sponsorsAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Спонсоры';
        return $this->render(
            'main/sponsors/sponsors.html.twig',
            $forRender
        );
    }

}