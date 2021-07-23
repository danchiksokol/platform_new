<?php

namespace App\Controller\Main;

use App\Entity\Theses;
use App\Form\ThesesFormType;
use App\Services\FileService\FileManagerServiceInterface;
use App\Services\Mailer\MailerService;
use App\Services\Theses\ThesesService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ThesesController extends AbstractController
{
    /**
     * @var ThesesService
     */
    private $thesesService;
    /**
     * @var MailerService
     */
    private $mailerService;

    /**
     * ThesesController constructor.
     * @param ThesesService $thesesService
     * @param MailerService $mailerService
     */
    public function __construct(ThesesService $thesesService, MailerService $mailerService)
    {
        $this->thesesService = $thesesService;
        $this->mailerService = $mailerService;
    }

    /**
     * @return Response
     */
    #[Route('/theses', name: 'theses')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Тезисы';

        return $this->render(
            'main/theses/index.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/theses/create', name: 'theses_create')]
    public function createAction(
        Request $request
    ): Response {
        $theses = new Theses();
        $form = $this->createForm(ThesesFormType::class, $theses);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->thesesService->handleCreate($theses, $form);
            $path = $this->thesesService->getThesesPath();
            $fileInPath = $path . '/' . $theses->getFile();
            $this->mailerService->handleSendEmail($form, $fileInPath);

            $this->addFlash('Success', 'Добавлен успешно');

            return $this->redirectToRoute('app_register');
        }
        return $this->render(
            'main/theses/form.html.twig',
            [
                'thesesForm' => $form->createView(),
            ]
        );
    }
}
