<?php

namespace App\Controller\Main;

use App\Controller\Main\BaseController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CompanyController extends BaseController
{
    #[Route('/company', name: 'app_company')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Карточка компании';
        return $this->render('main/company/index.html.twig', $forRender);
    }
}
