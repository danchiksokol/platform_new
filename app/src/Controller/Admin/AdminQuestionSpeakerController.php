<?php

namespace App\Controller\Admin;

use App\Controller\Admin\AdminBaseController;
use App\Repository\QuestionSpeakerRepository;
use App\Services\QuestionSpeaker\QuestionSpeakerService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin', name: 'app_admin_')]
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
    #[Route('/question/{chatid}', name: 'question_speaker', defaults: ['chatid' => 1])]
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
    #[Route('/question/show/{id}', name: 'question_speaker_show')]
    public function setShowAction(
        Request $request
    ): Response {
        $questionId = (int)$request->get('id');
        $question = $this->questionSpeakerRepository->getOne($questionId);
        $this->questionSpeakerService->handleShow($question);
        $this->addFlash('success', 'Вопрос отображен');

        return $this->redirectToRoute('question_speaker');
    }

    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/question/delete/{id}', name: 'question_speaker_delete')]
    public function deleteAction(
        Request $request
    ): Response {
        $questionId = (int)$request->get('id');
        $question = $this->questionSpeakerRepository->getOne($questionId);
        $this->questionSpeakerService->handleDelete($question);
        $this->addFlash('success', 'Вопрос удален');

        return $this->redirectToRoute('question_speaker');
    }
}
