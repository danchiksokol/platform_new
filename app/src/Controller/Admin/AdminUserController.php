<?php

namespace App\Controller\Admin;

use App\Repository\MemcachedRepository;
use Exception;
use App\Entity\User;
use App\Form\UserFormType;
use App\Repository\UserRepository;
use App\Services\Mailer\MailerService;
use App\Services\User\UserService;
use Psr\Cache\InvalidArgumentException;
use Symfony\Component\Form\Extension\Core\Type\SearchType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Cache\Adapter\AdapterInterface;

#[Route('/admin', name: 'app_admin_')]
class AdminUserController extends AdminBaseController
{
    private UserService $userService;
    private UserRepository $userRepository;
    private MailerService $mailerService;
    private AdapterInterface $adapter;
    private MemcachedRepository $memcachedRepository;

    /**
     * @param UserService $userService
     * @param UserRepository $userRepository
     * @param MailerService $mailerService
     * @param AdapterInterface $adapter
     * @param MemcachedRepository $memcachedRepository
     */
    public function __construct(
        UserService $userService,
        UserRepository $userRepository,
        MailerService $mailerService,
        AdapterInterface $adapter,
        MemcachedRepository $memcachedRepository
    ) {
        $this->userService = $userService;
        $this->userRepository = $userRepository;
        $this->mailerService = $mailerService;
        $this->adapter = $adapter;
        $this->memcachedRepository = $memcachedRepository;
    }


    /**
     * @param Request $request
     * @return Response
     * @throws InvalidArgumentException
     */
    #[Route('/users', name: 'users')]
    public function indexAction(Request $request): Response
    {
        $cacheId = 'users.getAll';
        $item = $this->adapter->getItem($cacheId);
        if (!$item->isHit()) {
            $users = $this->userRepository->getAll();
            $item->set($users);
            $this->adapter->save($item);
        } else {
            $users = $item->get();
        }

        $search = $request->get('search', null);
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
        $form = $this->createFormBuilder(null)
            ->add('query', SearchType::class)
            ->add(
                'search',
                SubmitType::class,
                [
                    'attr' => ['class' => 'btn btn-prymary']
                ]
            )->getForm();

        return $this->render(
            'search/searchBar.html.twig',
            ['form' => $form->createView()]
        );
    }


    /**
     * @param Request $request
     * @return Response
     * @throws InvalidArgumentException
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
            $this->memcachedRepository->clearByKey('users.getAll');

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
     * @throws InvalidArgumentException
     */
    #[Route('/users/update/{userId}', name: 'users_update')]
    public function updateAction(Request $request, int $userId): Response
    {
        $user = $this->userRepository->getOne($userId);
        $formUser = $this->createForm(UserFormType::class, $user);
        $formUser->handleRequest($request);

        if ($formUser->isSubmitted() && $formUser->isValid()) {
            $this->userService->handleUpdate($user, $formUser);
            $this->addFlash('success', 'Изменения сохранены');
            $this->memcachedRepository->clearByKey('users.getAll');

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
     * @throws InvalidArgumentException
     * @throws Exception
     */
    #[Route('/users/attend/{userId}', name: 'users_attend')]
    public function setAttendAction(int $userId): Response
    {
        $user = $this->userRepository->getOne($userId);
        $this->userService->handleAttend($user);
        $this->addFlash('success', 'Пользователь пришел');
        $this->memcachedRepository->clearByKey('users.getAll');

        return $this->redirectToRoute('app_admin_users');
    }


    /**
     * @param int $userId
     * @return Response
     * @throws InvalidArgumentException
     * @throws Exception
     */
    #[Route('/users/delete/{userId}', name: 'users_delete')]
    public function deleteAction(int $userId): Response
    {
        $user = $this->userRepository->getOne($userId);
        $this->userService->handleDelete($user);
        $this->addFlash('success', 'Пользователь удален');
        $this->memcachedRepository->clearByKey('users.getAll');

        return $this->redirectToRoute('app_admin_users');
    }


    /**
     * @param int $userId
     * @return Response
     * @throws TransportExceptionInterface
     */
    #[Route('/users/email/{userId}', name: 'users_send_email')]
    public function sendEmailAction(int $userId): Response
    {
        $user = $this->userRepository->getOne($userId);
        $this->mailerService->handleSendTemplateEmail($user);
        $this->addFlash('success', 'Письмо отправлено');

        return $this->redirectToRoute('app_admin_users');
    }
}
