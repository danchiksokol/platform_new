<?php


namespace App\Controller\Main;

use App\Services\QuestionSpeaker\QuestionSpeakerService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/question', name: 'app_')]
class QuestionSpeakerController extends BaseController
{
    private QuestionSpeakerService $questionSpeakerService;

    /**
     * QuestionSpeakerController constructor.
     * @param QuestionSpeakerService $questionSpeakerService
     */
    public function __construct(QuestionSpeakerService $questionSpeakerService)
    {
        $this->questionSpeakerService = $questionSpeakerService;
    }

    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/question_ajax', name: 'question_ajax')]
    public function indexAction(Request $request):Response
    {
        if ($request->isXMLHttpRequest() && $request->get('chatRoomId')) {
            $chatRoomId = (int)$request->get('chatRoomId');
            $questions = $this->questionSpeakerService->getQuestionSpeakerForRender($chatRoomId);

            return new JsonResponse(array('output' => $questions));
        }

        return new Response('This is not ajax!', 400);
    }
}