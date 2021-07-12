<?php

namespace App\Controller\Admin;

use App\Form\RegistrationFormType;
use App\Repository\UserRepository;
use App\Services\User\UserService;
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

    #[Route('/admin/users', name: 'admin_users')]
    public function indexAction(): Response
    {
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Пользователи';

        $usersAll = $this->userRepository->getAll();

        return $this->render(
            'admin/user/user.html.twig',
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
     */
    #[Route('/admin/users/update/{userId}', name: 'admin_users_update')]
    public function updateAction(Request $request, int $userId)
    {
        $user = $this->userRepository->getOne($userId);
        $formUser = $this->createForm(RegistrationFormType::class, $user);
        $formUser->handleRequest($request);

        if($formUser->isSubmitted() && $formUser->isValid()) {
            $this->userService->handleUpdate($user, $formUser);
            $this->addFlash('success', 'Изменения сохранены');

            return $this->redirectToRoute('admin_users');
        }

        $forRender = parent::renderDefault();
        $forRender['title'] = 'Редактирование пользователя';

        //TODO Сделать новую форму для редактирования
        return $this->render(
            'registration/register.html.twig',
            [
                'registrationForm' => $formUser->createView(),
            ]
        );
    }
}
