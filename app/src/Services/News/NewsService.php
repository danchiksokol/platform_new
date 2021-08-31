<?php

namespace App\Services\News;

use App\Entity\News;
use App\Repository\NewsRepository;
use App\Services\FileService\FileManagerServiceInterface;
use DateTimeImmutable;
use Symfony\Component\Form\Form;

class NewsService
{
    private NewsRepository $newsRepository;
    private FileManagerServiceInterface $fileManagerService;

    /**
     * @param NewsRepository $newsRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(NewsRepository $newsRepository, FileManagerServiceInterface $fileManagerService)
    {
        $this->newsRepository = $newsRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('news');
    }

    /**
     * @param News $news
     * @param Form $form
     * @return $this
     */
    public function handleCreate(News $news, Form $form): static
    {
        $this->setObjectsFromForm($news, $form);
        $file = $form->get('file')->getData();
        if ($file) {
            $fileName = $this->fileManagerService->uploadFile($file);
            $news->setFile($fileName);
        }
        $this->newsRepository->setCreate($news);
        $this->newsRepository->setSave();

        return $this;
    }

    /**
     * @param News $news
     * @param Form $form
     * @return $this
     */
    public function handleUpdate(News $news, Form $form, string|null $file): static
    {
        $this->setObjectsFromForm($news, $form);
        $news->setFile($file);
        $newFile = $form->get('file')->getData();
        if ($newFile) {
            $this->fileManagerService->removeFile($file);
            $fileName = $this->fileManagerService->uploadFile($newFile);
            $news->setFile($fileName);
        }
        $news->setUpdatedAt(new DateTimeImmutable());

        $this->newsRepository->setSave();

        return $this;
    }

    /**
     * @param News $news
     */
    public function handleDelete(News $news): void
    {
        $file = $news->getFile();
        if ($file) {
            $this->fileManagerService->removeFile($file);
        }
        $this->newsRepository->setDelete($news);
        $this->newsRepository->setSave();
    }

    /**
     * @param News $news
     */
    public function handleShow(News $news): void
    {
        $news->setIsShow(1);
        $this->newsRepository->setSave();
    }

    /**
     * @param News $news
     */
    public function handleHide(News $news): void
    {
        $news->setIsShow(0);
        $this->newsRepository->setSave();
    }

    /**
     * @param News $news
     * @param Form $form
     */
    public function setObjectsFromForm(News $news, Form $form): void
    {
        $news->setTitle($form->get('title')->getData());
        $news->setHref($form->get('href')->getData());
        $news->setIsShow($form->get('is_show')->getData());
        $news->setCreatedAt(new DateTimeImmutable());
    }

}