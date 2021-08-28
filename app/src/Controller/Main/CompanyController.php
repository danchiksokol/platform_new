<?php

namespace App\Controller\Main;

use App\Controller\Main\BaseController;
use App\Repository\CompanyRepository;
use App\Repository\NewsRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/company', name: 'app_')]
class CompanyController extends BaseController
{
    private NewsRepository $newsRepository;
    private CompanyRepository $companyRepository;

    /**
     * @param NewsRepository $newsRepository
     * @param CompanyRepository $companyRepository
     */
    public function __construct(NewsRepository $newsRepository, CompanyRepository $companyRepository)
    {
        $this->newsRepository = $newsRepository;
        $this->companyRepository = $companyRepository;
    }

    #[Route('/{id}', name: 'company', defaults: ['id' => 10])]
    public function indexAction(int $id): Response
    {
        $company = $this->companyRepository->getOne($id);
        $materials = $company->getCompanyMaterials();
        $video = $company->getCompanyVideos();
        $materialIsShow = false;
        foreach ($materials->getValues() as $value) {
            if ($value->getIsShow()) {
                $materialIsShow = true;
            }
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Карточка компании';
        $forRender['company'] = $company;
        $forRender['materials'] = $materials;
        $forRender['materialShow'] = $materialIsShow;
        $forRender['video'] = $video;
        $forRender['news'] = $this->newsRepository->getAllIsShow();
        $forRender['hrefShow'] = !empty($company->getHref());
        return $this->render('main/company/index.html.twig', $forRender);
    }
}
