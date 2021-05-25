<?php

namespace App\Controller;

use App\Entity\Theses;
use App\Form\ThesesFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ThesesController extends AbstractController
{
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

    #[Route('/theses/create', name: 'theses_create')]
    public function create(
        Request $request
    ): Response {
        $theses = new Theses();
        $form = $this->createForm(ThesesFormType::class, $theses);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $theses->setFIO($form->get('FIO')->getData());

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($theses);
            $entityManager->flush();
            $this->addFlash('Success', 'Добавлен успешно');

            return $this->redirectToRoute('/');
        }
        return $this->render(
            'theses/form.html.twig',
            [
                'thesesForm' => $form->createView(),
            ]
        );
    }
}
