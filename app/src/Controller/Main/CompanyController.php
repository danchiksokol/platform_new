<?php

namespace App\Controller\Main;

use App\Controller\Main\BaseController;
use App\Repository\NewsRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/company', name: 'app_')]
class CompanyController extends BaseController
{
    private NewsRepository $newsRepository;

    /**
     * @param NewsRepository $newsRepository
     */
    public function __construct(NewsRepository $newsRepository)
    {
        $this->newsRepository = $newsRepository;
    }

    #[Route('/', name: 'company')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Карточка компании';
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        return $this->render('main/company/index.html.twig', $forRender);
    }
}
