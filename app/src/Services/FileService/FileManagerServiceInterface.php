<?php


namespace App\Services\FileService;


use Symfony\Component\HttpFoundation\File\UploadedFile;

interface FileManagerServiceInterface
{
    /**
     * @param UploadedFile $file
     * @return string
     */
    public function uploadFile(UploadedFile $file): string;

    /**
     * @param string $fileName
     * @return mixed
     */
    public function removeFile(string $fileName);

}