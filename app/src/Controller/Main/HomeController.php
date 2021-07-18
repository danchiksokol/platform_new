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
        return $this->render('main/index.html.twig', $forRender);
    }

    #[Route('/programms', 'programms')]
    public function programmsAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Программы';
        return $this->render('main/programms/index.html.twig', $forRender);
    }

    #[Route('/sponsors', 'sponsors')]
    public function sponsorsAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Страница виртуальной выставки';
        return $this->render('main/sponsors/index.html.twig', $forRender);
    }

    #[Route('/broadcast', 'broadcast')]
    public function broadcastAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Трансляция сессии';
        return $this->render('main/broadcast/index.html.twig', $forRender);
    }

    #[Route('/help', 'help')]
    public function helpAction()
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Поддержка';
        return $this->render('main/help/index.html.twig', $forRender);
    }

}