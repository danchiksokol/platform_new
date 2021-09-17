<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Form\UserFormType;
use App\Repository\UserRepository;
use App\Services\Mailer\MailerService;
use App\Services\User\UserService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin', name: 'app_admin_')]
class AdminUserController extends AdminBaseController
{
    private UserService $userService;
    private UserRepository $userRepository;
    private MailerService $mailerService;

    /**
     * @param UserService $userService
     * @param UserRepository $userRepository
     * @param MailerService $mailerService
     */
    public function __construct(UserService $userService, UserRepository $userRepository, MailerService $mailerService)
    {
        $this->userService = $userService;
        $this->userRepository = $userRepository;
        $this->mailerService = $mailerService;
    }

    /**
     * @return Response
     */
    #[Route('/users', name: 'users')]
    public function indexAction(Request $request): Response
    {
        $search = $request->get('search', null);
        $users = $this->userRepository->getAll();
        if (!empty($search)) {
            $users = $this->userRepository->findByAllFields($search);
        }
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Пользователи';
        $forRender['users'] = $users;
        $forRender['search'] = $search;

        return $this->render(
            'admin/user/index.html.twig',
            $forRender
        );
    }

    /**
     * @return Response
     */
    public function searchBarAction(): Response
    {
        $form = $this->createFormBuilder(null)->add('query', SearchType::class)
            ->add(
                'search',
                SubmitType::class,
                ['attr' => ['class' => 'btn btn-ptymary']]
            )->getForm();

        return $this->render(
            'search/searchBar.html.twig',
            ['form' => $form->createView()]
        );
    }


    /**
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    #[Route('/users/create', name: 'users_create')]
    public function createAction(Request $request): Response
    {
        $user = new User();
        $formUser = $this->createForm(UserFormType::class, $user);
        $formUser->handleRequest($request);

        if ($formUser->isSubmitted() && $formUser->isValid()) {
            $this->userService->handleCreateUser($user, $formUser);
            $this->addFlash('success', 'Пользователь добавлен');

            return $this->redirectToRoute('app_admin_users');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Создание пользователя';
        $forRender['userForm'] = $formUser->createView();

        return $this->render(
            'admin/user/form.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @param int $userId
     * @return Response
     * @throws Exception
     */
    #[Route('/users/update/{userId}', name: 'users_update')]
    public function updateAction(
        Request $request,
        int $userId
    ): Response {
        $user = $this->userRepository->getOne($userId);
        $formUser = $this->createForm(UserFormType::class, $user);
        $formUser->handleRequest($request);

        if ($formUser->isSubmitted() && $formUser->isValid()) {
            if ($formUser->get('save')->isClicked()) {
                $this->userService->handleUpdate($user, $formUser);
                $this->addFlash('success', 'Изменения сохранены');
            }

            if ($formUser->get('delete')->isClicked()) {
                $this->userService->handleDelete($user);
                $this->addFlash('success', 'Пользователь удален');
            }

            return $this->redirectToRoute('app_admin_users');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Редактирование пользователя';
        $forRender['userForm'] = $formUser->createView();

        return $this->render(
            'admin/user/form.html.twig',
            $forRender
        );
    }


    /**
     * @param int $userId
     * @return Response
     * @throws Exception
     */
    #[Route('/users/attend/{userId}', name: 'users_attend')]
    public function setAttendAction(int $userId): Response
    {
        $user = $this->userRepository->getOne($userId);
        $this->userService->handleAttend($user);
        $this->addFlash('success', 'Пользователь пришел');

        return $this->redirectToRoute('app_admin_users');
    }


    /**
     * @param int $userId
     * @return Response
     * @throws Exception
     */
    #[Route('/users/delete/{userId}', name: 'users_delete')]
    public function deleteAction(int $userId): Response {
        $user = $this->userRepository->getOne($userId);
        $this->userService->handleDelete($user);
        $this->addFlash('success', 'Пользователь удален');

        return $this->redirectToRoute('app_admin_users');
    }

    /**
     * @param int $userId
     * @return Response
     * @throws \Symfony\Component\Mailer\Exception\TransportExceptionInterface
     */
    #[Route('/users/email/{userId}', name: 'users_send_email')]
    public function sendEmailAction(int $userId):Response
    {
        $user = $this->userRepository->getOne($userId);
        $this->mailerService->handleSendTemplateEmail($user);
        $this->addFlash('success', 'Письмо отправлено удален');

        return $this->redirectToRoute('app_admin_users');
    }
}
