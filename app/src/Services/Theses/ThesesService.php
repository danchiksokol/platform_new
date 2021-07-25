<?php


namespace App\Services\Theses;


use App\Entity\Theses;
use App\Repository\ThesesRepository;
use App\Services\FileService\FileManagerService;
use App\Services\FileService\FileManagerServiceInterface;
use Exception;
use JetBrains\PhpStorm\Pure;
use Symfony\Component\Form\Form;

class ThesesService
{
    /**
     * @var ThesesRepository
     */
    private ThesesRepository $thesesRepository;
    /**
     * @var FileManagerServiceInterface
     */
    private FileManagerServiceInterface $fileManagerService;

    /**
     * ThesesService constructor.
     * @param ThesesRepository $thesesRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(ThesesRepository $thesesRepository, FileManagerServiceInterface $fileManagerService)
    {
        $this->thesesRepository = $thesesRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('theses');
    }

    /**
     * @param Theses $theses
     * @param Form $form
     * @return $this
     * @throws Exception
     */
    public function handleCreate(Theses $theses, Form $form): static
    {
        $file = $form->get('file')->getData();
        if ($file) {
            $fileName = $this->fileManagerService->uploadFile($file);
            $theses->setFile($fileName);
        }
        $theses->setFIO($form->get('FIO')->getData());
        $this->thesesRepository->setCreate($theses);

        return $this;
    }

    /**
     * @return mixed
     */
    #[Pure]
    public function getThesesPath(): mixed
    {
        return $this->fileManagerService->getFileUploadDirectory();
    }

}