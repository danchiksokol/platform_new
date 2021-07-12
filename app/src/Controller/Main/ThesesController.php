<?php

namespace App\Controller\Main;

use App\Entity\Theses;
use App\Form\ThesesFormType;
use App\Services\FileService\FileManagerServiceInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ThesesController extends AbstractController
{
    /**
     * @return Response
     */
    #[Route('/theses', name: 'theses')]
    public function index(): Response
    {
        return $this->render(
            'theses/index.html.twig',
            [
                'controller_name' => 'ThesesController',
            ]
        );
    }

    /**
     * @param Request $request
     * @param FileManagerServiceInterface $fileManagerService
     * @return Response
     */
    #[Route('/theses/create', name: 'theses_create')]
    public function create(
        Request $request,
        FileManagerServiceInterface $fileManagerService
    ): Response {
        $theses = new Theses();
        $form = $this->createForm(ThesesFormType::class, $theses);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $file = $form->get('file')->getData();
            if ($file) {
                $fileName = $fileManagerService->uploadFile($file);
                $theses->setFile($fileName);
            }
            $theses->setFIO($form->get('FIO')->getData());

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($theses);
            $entityManager->flush();
            $this->addFlash('Success', 'Добавлен успешно');

            return $this->redirectToRoute('app_register');
        }
        return $this->render(
            'theses/form.html.twig',
            [
                'thesesForm' => $form->createView(),
            ]
        );
    }
}
