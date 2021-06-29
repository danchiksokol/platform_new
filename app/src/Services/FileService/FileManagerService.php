<?php


namespace App\Services\FileService;


use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class FileManagerService implements FileManagerServiceInterface
{

    private $fileUploadDirectory;

    /**
     * FileManagerService constructor.
     * @param $fileUploadDirectory
     */
    public function __construct($fileUploadDirectory)
    {
        $this->fileUploadDirectory = $fileUploadDirectory;
    }

    /**
     * @return mixed
     */
    public function getFileUploadDirectory()
    {
        return $this->fileUploadDirectory;
    }

    /**
     * @param UploadedFile $file
     * @return string
     */
    public function uploadFile(UploadedFile $file): string
    {
        $fileName = uniqid() . '.' . $file->guessExtension();

        try {
            $file->move($this->getFileUploadDirectory(), $fileName);
        } catch (FileException $exception) {
            return $exception;
        }

        return $fileName;
    }

    /**
     * @param string $fileName
     * @return mixed|void
     */
    public function removeFile(string $fileName)
    {
        $fileSystem = new Filesystem();
        $file = $this->getFileUploadDirectory() . $fileName;
        try {
            $fileSystem->remove($file);
        } catch (FileException $exception) {
            echo $exception->getMessage();
        }
    }


}