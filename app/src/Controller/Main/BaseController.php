<?php


namespace App\Controller\Main;


use JetBrains\PhpStorm\ArrayShape;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class BaseController extends AbstractController
{
    /**
     * @return string[]
     */
    #[ArrayShape(['title' => "string"])]
    public function renderDefault(): array
    {
        return [
            'title' => 'Значение по умолчанию'
        ];
    }
}