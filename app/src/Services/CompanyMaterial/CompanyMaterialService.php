<?php

namespace App\Services\CompanyMaterial;

use App\Entity\CompanyMaterial;
use App\Repository\CompanyMaterialRepository;
use App\Repository\CompanyRepository;
use App\Services\FileService\FileManagerServiceInterface;
use DateTimeImmutable;
use Exception;
use Symfony\Component\Form\Form;

class CompanyMaterialService
{
    private CompanyRepository $companyRepository;
    private FileManagerServiceInterface $fileManagerService;
    private CompanyMaterialRepository $companyMaterialRepository;

    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyMaterialRepository $companyMaterialRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(
        CompanyRepository $companyRepository,
        CompanyMaterialRepository $companyMaterialRepository,
        FileManagerServiceInterface $fileManagerService
    ) {
        $this->companyRepository = $companyRepository;
        $this->fileManagerService = $fileManagerService;
        $this->companyMaterialRepository = $companyMaterialRepository;
        $this->fileManagerService->setFileUploadDirectory('company');
    }


    /**
     * @param CompanyMaterial $companyMaterial
     * @param Form $form
     * @return $this
     * @throws Exception
     */
    public function handleCreate(CompanyMaterial $companyMaterial, Form $form): static
    {
        $company = $this->companyRepository->getOne($form->get('company')->getData());
        $companyMaterial->setCompany($company);
        $companyMaterial->setCreatedAt(new DateTimeImmutable());
        $file = $form->get('file')->getData();
        if ($file) {
            $this->fileManagerService->setFileUploadDirectory($company->getId().'/materials');
            $fileName = $this->fileManagerService->uploadFile($file);
            $companyMaterial->setFile($fileName);
        }
        $thumbnail = $form->get('thumbnail')->getData();
        if ($thumbnail) {
            $thumbnailName = $this->fileManagerService->uploadFile($thumbnail);
            $companyMaterial->setThumbnail($thumbnailName);
        }
        $this->companyMaterialRepository->setCreate($companyMaterial);
        $this->companyMaterialRepository->setSave();

        return $this;
    }

    public function handleUpdate()
    {
    }

    /**
     * @param CompanyMaterial $companyMaterial
     * @throws Exception
     */
    public function handleDelete(CompanyMaterial $companyMaterial)
    {
        $file = $companyMaterial->getFile();
        if ($file) {
            $this->fileManagerService->removeFile($file);
        }
        $thumbnail = $companyMaterial->getThumbnail();
        if ($thumbnail) {
            $this->fileManagerService->removeFile($thumbnail);
        }
        $this->companyMaterialRepository->setDelete($companyMaterial);
        $this->companyMaterialRepository->setSave();
    }
}