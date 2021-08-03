<?php

namespace App\Controller\Admin;

use App\Form\RegistrationFormType;
use App\Form\UserFormType;
use App\Repository\UserRepository;
use App\Services\User\UserService;
use Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminUserController extends AdminBaseController
{
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var UserService
     */
    private $userService;

    /**
     * AdminUserController constructor.
     * @param UserService $userService
     * @param UserRepository $userRepository
     */
    public function __construct(UserService $userService, UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
        $this->userService = $userService;
    }

    /**
     * @return Response
     */
    #[Route('/admin/users', name: 'admin_users')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Пользователи';

        $usersAll = $this->userRepository->getAll();

        return $this->render(
            'admin/user/index.html.twig',
            [
                'title' => $forRender,
                'controller_name' => 'AdminUserController',
                'users' => $usersAll
            ]
        );
    }

    /**
     * @param Request $request
     * @param int $userId
     * @return Response
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    #[Route('/admin/users/update/{userId}', name: 'admin_users_update')]
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

            return $this->redirectToRoute('admin_users');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Редактирование пользователя';

        return $this->render(
            'admin/user/form.html.twig',
            [
                'forRender' => $forRender,
                'userForm' => $formUser->createView(),
            ]
        );
    }

    /**
     * @param int $userId
     * @return Response
     * @throws Exception
     */
    #[Route('/admin/users/delete/{userId}', name: 'admin_users_delete')]
    public function deleteAction(
        int $userId
    ): Response {
        $user = $this->userRepository->getOne($userId);
        $this->userService->handleDelete($user);
        $this->addFlash('success', 'Пользователь удален');

        return $this->redirectToRoute('admin_users');
    }
}
