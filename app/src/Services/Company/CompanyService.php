<?php

namespace App\Services\Company;

use App\Entity\Company;
use App\Repository\CompanyMaterialRepository;
use App\Repository\CompanyRepository;
use App\Repository\CompanyVideoRepository;
use App\Services\CompanyMaterial\CompanyMaterialService;
use App\Services\CompanyVideo\CompanyVideoService;
use App\Services\FileService\FileManagerServiceInterface;
use DateTimeImmutable;
use Exception;
use Symfony\Component\Form\Form;

class CompanyService
{
    private CompanyRepository $companyRepository;
    private FileManagerServiceInterface $fileManagerService;
    private CompanyMaterialRepository $companyMaterialRepository;
    private CompanyVideoRepository $companyVideoRepository;


    /**
     * @param CompanyRepository $companyRepository
     * @param CompanyMaterialRepository $companyMaterialRepository
     * @param CompanyVideoRepository $companyVideoRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(
        CompanyRepository $companyRepository,
        CompanyMaterialRepository $companyMaterialRepository,
        CompanyVideoRepository $companyVideoRepository,
        FileManagerServiceInterface $fileManagerService
    ) {
        $this->companyRepository = $companyRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('company');
        $this->companyMaterialRepository = $companyMaterialRepository;
        $this->companyVideoRepository = $companyVideoRepository;
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
        $company->setContent($form->get('content')->getData());
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
     * @param Form $form
     * @param string|null $file
     * @return $this
     * @throws Exception
     */
    public function handleUpdate(Company $company, Form $form, string|null $file): static
    {
        $company->setTitle($form->get('title')->getData());
        $company->setContent($form->get('content')->getData());
        $company->setCreatedAt(new DateTimeImmutable());
        $company->setLogo($file);
        $newLogo = $form->get('logo')->getData();
        if ($newLogo) {
            $this->fileManagerService->setFileUploadDirectory($company->getId() . '/logo/');
            $this->fileManagerService->removeFile($file);
            $fileName = $this->fileManagerService->uploadFile($newLogo);
            $company->setLogo($fileName);
        }
        $this->companyRepository->setUpdate($company);
        $this->companyRepository->setSave();

        return $this;
    }

    /**
     * @param Company $company
     * @throws Exception
     */
    public function handleDelete(Company $company)
    {
        $path = $this->fileManagerService->getFileUploadDirectory().'/'.$company->getId();
        $this->fileManagerService->removeDirectory($path);
        $materials = $company->getCompanyMaterials();
        foreach ($materials as $material) {
            $this->companyMaterialRepository->setDelete($material);
        }
        $videos = $company->getCompanyVideos();
        foreach ($videos as $video) {
            $this->companyVideoRepository->setDelete($video);
        }
        $this->companyRepository->setDelete($company);
        $this->companyMaterialRepository->setSave();
        $this->companyVideoRepository->setSave();
        $this->companyRepository->setSave();
    }

}