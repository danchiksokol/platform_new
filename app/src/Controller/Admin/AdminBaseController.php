<?php


namespace App\Controller\Admin;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminBaseController extends AbstractController
{

    /**
     * @return string[]
     */
    public function renderDefault()
    {
        return [
            'title' => 'Значение по умолчанию Admin',
        ];
    }
}