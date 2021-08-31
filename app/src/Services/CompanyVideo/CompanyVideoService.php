<?php

namespace App\Services\CompanyVideo;

use App\Entity\CompanyVideo;
use App\Repository\CompanyRepository;
use App\Repository\CompanyVideoRepository;
use App\Services\FileService\FileManagerServiceInterface;
use Exception;
use Symfony\Component\Form\Form;

class CompanyVideoService
{
    private CompanyRepository $companyRepository;
    private CompanyVideoRepository $companyVideoRepository;
    private FileManagerServiceInterface $fileManagerService;

    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyVideoRepository $companyVideoRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(
        CompanyRepository $companyRepository,
        CompanyVideoRepository $companyVideoRepository,
        FileManagerServiceInterface $fileManagerService,
        
    ) {
        $this->companyRepository = $companyRepository;
        $this->companyVideoRepository = $companyVideoRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('company');
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
        if ($file) {
            $this->fileManagerService->setFileUploadDirectory($company->getId().'/video');
            $fileName = $this->fileManagerService->uploadFile($file);
            $companyVideo->setVideo($fileName);
        }
        $this->companyVideoRepository->setCreate($companyVideo);
        $this->companyVideoRepository->setSave();
    }

    /**
     * @param CompanyVideo $companyVideo
     * @throws Exception
     */
    public function handleDelete(CompanyVideo $companyVideo)
    {
        $this->fileManagerService->setFileUploadDirectory($companyVideo->getCompany()->getId().'/video/');
        $file = $companyVideo->getVideo();
        if ($file) {
            $this->fileManagerService->removeFile($file);
        }
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