<?php


namespace App\Services\Theses;


use App\Entity\Theses;
use App\Repository\ThesesRepository;
use App\Services\FileService\FileManagerService;
use Symfony\Component\Form\Form;

class ThesesService
{
    /**
     * @var ThesesRepository
     */
    private $thesesRepository;
    /**
     * @var FileManagerServiceInterface
     */
    private $fileManagerService;

    /**
     * ThesesService constructor.
     * @param ThesesRepository $thesesRepository
     * @param FileManagerServiceInterface $fileManagerService
     */
    public function __construct(ThesesRepository $thesesRepository, FileManagerService $fileManagerService)
    {
        $this->thesesRepository = $thesesRepository;
        $this->fileManagerService = $fileManagerService;
        $this->fileManagerService->setFileUploadDirectory('theses');
    }

    /**
     * @param Theses $theses
     * @param Form $form
     * @return $this
     * @throws \Exception
     */
    public function handleCreate(Theses $theses, Form $form)
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
    public function getThesesPath()
    {
        return $this->fileManagerService->getFileUploadDirectory();
    }

}