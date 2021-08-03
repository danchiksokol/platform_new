<?php

namespace App\Controller\Admin;

use App\Controller\Admin\AdminBaseController;
use App\Repository\QuestionSpeakerRepository;
use App\Services\QuestionSpeaker\QuestionSpeakerService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin', name: 'app_')]
class AdminQuestionSpeakerController extends AdminBaseController
{
    private QuestionSpeakerRepository $questionSpeakerRepository;
    private QuestionSpeakerService $questionSpeakerService;

    /**
     * AdminQuestionSpeakerController constructor.
     * @param QuestionSpeakerRepository $questionSpeakerRepository
     * @param QuestionSpeakerService $questionSpeakerService
     */
    public function __construct(
        QuestionSpeakerRepository $questionSpeakerRepository,
        QuestionSpeakerService $questionSpeakerService
    ) {
        $this->questionSpeakerRepository = $questionSpeakerRepository;
        $this->questionSpeakerService = $questionSpeakerService;
    }


    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/question/{chatid}', name: 'admin_question_speaker')]
    public function indexAction(
        Request $request
    ): Response {
        $chatRoomId = (int)$request->get('chatid');
        $questions = $this->questionSpeakerService->getQuestionSpeakerForRenderAdmin($chatRoomId);

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Вопросы у спикеру';
        $forRender['questions'] = $questions;

        return $this->render(
            'admin/question_speaker/index.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/question/setshow/{id}', name: 'admin_question_speaker_setshow')]
    public function setShowAction(
        Request $request
    ): Response {
        $questionId = (int)$request->get('id');
        $question = $this->questionSpeakerRepository->getOne($questionId);
        $this->questionSpeakerService->handleShow($question);
        $this->addFlash('success', 'Вопрос отображен');

        return $this->redirectToRoute('admin_users');
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/question/delete/{id}', name: 'admin_question_speaker_delete')]
    public function deleteAction(
        Request $request
    ): Response {
        $questionId = (int)$request->get('id');
        $question = $this->questionSpeakerRepository->getOne($questionId);
        $this->questionSpeakerService->handleDelete($question);
        $this->addFlash('success', 'Вопрос удален');

        return $this->redirectToRoute('admin_users');
    }
}
