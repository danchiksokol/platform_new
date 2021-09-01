<?php

namespace App\Services\CompanyVideo;

use App\Entity\CompanyVideo;
use App\Repository\CompanyRepository;
use App\Repository\CompanyVideoRepository;
use Exception;
use Symfony\Component\Form\Form;

class CompanyVideoService
{
    private CompanyRepository $companyRepository;
    private CompanyVideoRepository $companyVideoRepository;

    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyVideoRepository $companyVideoRepository
     */
    public function __construct(
        CompanyRepository $companyRepository,
        CompanyVideoRepository $companyVideoRepository,

    ) {
        $this->companyRepository = $companyRepository;
        $this->companyVideoRepository = $companyVideoRepository;
    }

    /**
     * @param CompanyVideo $companyVideo
     * @param Form $form
     * @throws Exception
     */
    public function handleCreate(CompanyVideo $companyVideo, Form $form)
    {
        $company = $this->companyRepository->getOne($form->get('company')->getData());
        $companyVideo->setCompany($company);
        $file = $form->get('video')->getData();
        $companyVideo->setVideo($file);
        $this->companyVideoRepository->setCreate($companyVideo);
        $this->companyVideoRepository->setSave();
    }

    public function handleUpdate(CompanyVideo $companyVideo, Form $form)
    {
        $company = $this->companyRepository->getOne($form->get('company')->getData());
        $companyVideo->setCompany($company);
        $file = $form->get('video')->getData();
        $companyVideo->setVideo($file);
        $this->companyVideoRepository->setSave();
    }

    /**
     * @param CompanyVideo $companyVideo
     * @throws Exception
     */
    public function handleDelete(CompanyVideo $companyVideo)
    {
        $this->companyVideoRepository->setDelete($companyVideo);
        $this->companyVideoRepository->setSave();
    }

    /**
     * @param CompanyVideo $companyVideo
     */
    public function handleShow(CompanyVideo $companyVideo): void
    {
        $companyVideo->setIsShow(1);
        $this->companyVideoRepository->setSave();
    }

    /**
     * @param CompanyVideo $companyVideo
     */
    public function handleHide(CompanyVideo $companyVideo): void
    {
        $companyVideo->setIsShow(0);
        $this->companyVideoRepository->setSave();
    }

}