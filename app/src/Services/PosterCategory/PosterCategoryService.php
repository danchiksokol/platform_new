<?php

namespace App\Services\PosterCategory;

use App\Entity\PosterCategory;
use App\Repository\PosterCategoryRepository;
use DateTime;
use Exception;
use Symfony\Component\Form\Form;

class PosterCategoryService
{
    private PosterCategoryRepository $posterCategoryRepository;

    /**
     * @param PosterCategoryRepository $posterCategoryRepository
     */
    public function __construct(PosterCategoryRepository $posterCategoryRepository)
    {
        $this->posterCategoryRepository = $posterCategoryRepository;
    }

    /**
     * @param PosterCategory $category
     * @param Form $form
     * @throws Exception
     */
    public function handleCreate(PosterCategory $category, Form $form)
    {
        $category->setName($form->get('name')->getData());
        $category->setCreatedAt(new DateTime());
        $this->posterCategoryRepository->setCreate($category);
        $this->posterCategoryRepository->setSave();
    }
}