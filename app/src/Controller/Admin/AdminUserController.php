<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Form\UserFormType;
use App\Repository\UserRepository;
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

    /**
     * @param UserService $userService
     * @param UserRepository $userRepository
     */
    public function __construct(UserService $userService, UserRepository $userRepository)
    {
        $this->userService = $userService;
        $this->userRepository = $userRepository;
    }

    /**
     * @return Response
     */
    #[Route('/users', name: 'users')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Пользователи';

        $usersAll = $this->userRepository->getAll();

        return $this->render(
            'admin/user/index.html.twig',
            [
                'title' => $forRender,
                'users' => $usersAll
            ]
        );
    }

    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/users/create', name: 'users_create')]
    public function createAction(Request $request): Response
    {
        $user = new User();
        $formUser = $this->createForm(UserFormType::class, $user);
        $formUser->handleRequest($request);

        if ($formUser->isSubmitted() && $formUser->isValid()) {
            if ($formUser->get('save')->isClicked()) {
                $this->userService->handleUpdate($user, $formUser);
                $this->addFlash('success', 'Пользователь добавлен');
            }

            return $this->redirectToRoute('users');
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

            return $this->redirectToRoute('users');
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
    #[Route('/users/delete/{userId}', name: 'users_delete')]
    public function deleteAction(
        int $userId
    ): Response {
        $user = $this->userRepository->getOne($userId);
        $this->userService->handleDelete($user);
        $this->addFlash('success', 'Пользователь удален');

        return $this->redirectToRoute('users');
    }
}
