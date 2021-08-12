<?php

namespace App\Services\Company;

use App\Entity\Company;
use App\Repository\CompanyRepository;
use App\Services\FileService\FileManagerServiceInterface;
use DateTimeImmutable;
use Exception;
use Symfony\Component\Form\Form;

class CompanyService
{
    private CompanyRepository $companyRepository;
    private FileManagerServiceInterface $fileManagerService;

    /**
     * @param CompanyRepository $companyRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(
        CompanyRepository $companyRepository,
        FileManagerServiceInterface $fileManagerService
    ) {
        $this->companyRepository = $companyRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('company');
    }


    /**
     * @param Company $company
     * @param Form $form
     * @return $this
     * @throws Exception
     */
    public function handleCreate(Company $company, Form $form): static
    {
        $company->setTitle($form->get('title')->getData());
        $company->setCreatedAt(new DateTimeImmutable());
        $this->companyRepository->setCreate($company);
        $lastId = $company->getId();
        $file = $form->get('logo')->getData();
        if ($file) {
            $this->fileManagerService->setFileUploadDirectory($lastId . '/logo/');
            $fileName = $this->fileManagerService->uploadFile($file);
            $company->setLogo($fileName);
            $this->companyRepository->setUpdate($company);
        }
        $this->companyRepository->setSave();

        return $this;
    }

    /**
     * @param Company $company
     * @throws Exception
     */
    public function handleDelete(Company $company)
    {
        $this->companyRepository->setDelete($company);
    }

}