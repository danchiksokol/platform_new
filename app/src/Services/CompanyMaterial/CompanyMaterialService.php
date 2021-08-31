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
        $companyMaterial->setIsShow(0);
        $file = $form->get('file')->getData();
        if ($file) {
            $this->fileManagerService->setFileUploadDirectory($company->getId() . '/materials');
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

    public function handleUpdate(CompanyMaterial $companyMaterial, Form $form, string|null $file, string|null $thumbnail): static
    {
        $company = $this->companyRepository->getOne($form->get('company')->getData());
        $companyMaterial->setCompany($company);
        $companyMaterial->setUpdatedAt(new DateTimeImmutable());
        $companyMaterial->setFile($file);
        $companyMaterial->setThumbnail($thumbnail);
        $this->fileManagerService->setFileUploadDirectory($company->getId() . '/materials/');
        $newFile = $form->get('file')->getData();
        if ($newFile) {
            $this->fileManagerService->removeFile($file);
            $fileName = $this->fileManagerService->uploadFile($newFile);
            $companyMaterial->setFile($fileName);
        }
        $newThumbnail = $form->get('thumbnail')->getData();
        if ($newThumbnail) {
            $this->fileManagerService->removeFile($thumbnail);
            $thumbnailName = $this->fileManagerService->uploadFile($newThumbnail);
            $companyMaterial->setThumbnail($thumbnailName);
        }
        $this->companyMaterialRepository->setSave();

        return $this;
    }

    /**
     * @param CompanyMaterial $companyMaterial
     * @throws Exception
     */
    public function handleDelete(CompanyMaterial $companyMaterial)
    {
        $this->fileManagerService->setFileUploadDirectory($companyMaterial->getCompany()->getId() . '/materials/');
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


    /**
     * @param CompanyMaterial $companyMaterial
     */
    public function handleShow(CompanyMaterial $companyMaterial): void
    {
        $companyMaterial->setIsShow(1);
        $this->companyMaterialRepository->setSave();
    }

    /**
     * @param CompanyMaterial $companyMaterial
     */
    public function handleHide(CompanyMaterial $companyMaterial): void
    {
        $companyMaterial->setIsShow(0);
        $this->companyMaterialRepository->setSave();
    }
}