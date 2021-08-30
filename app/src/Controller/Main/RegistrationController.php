<?php

namespace App\Controller\Main;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Security\EmailVerifier;
use App\Services\User\UserService;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Address;
use Symfony\Component\Routing\Annotation\Route;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;

class RegistrationController extends BaseController
{
    /**
     * @var EmailVerifier
     */
    private EmailVerifier $emailVerifier;
    /**
     * @var UserService
     */
    private UserService $userService;

    /**
     * RegistrationController constructor.
     * @param EmailVerifier $emailVerifier
     * @param UserService $userService
     */
    public function __construct(EmailVerifier $emailVerifier, UserService $userService)
    {
        $this->emailVerifier = $emailVerifier;
        $this->userService = $userService;
    }


    /**
     * @param Request $request
     * @return Response
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    #[Route('/register', name: 'app_register')]
    public function register(
        Request $request
    ): Response {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->userService->handleCreate($user, $form);

            $this->emailVerifier->sendEmailConfirmation(
                'app_login',
                $user,
                (new TemplatedEmail())
                    ->from(new Address('lymphorum@tsoncology.com', 'Подтверждение регистрации на Интерактивный форум экспертов "Лимфорум" 17-18 сентября 2021 г.'))
                    ->to($user->getEmail())
                    ->subject('Подтверждение регистрации на Интерактивный форум экспертов "Лимфорум" 17-18 сентября 2021 г.')
                    ->htmlTemplate('main/registration/confirmation_email.html.twig')
            );
            $this->addFlash('success', 'Вы успешно зарегистрировались на Лимфорум.');

            return $this->redirectToRoute('app_register');
        }
        $forRender = parent::renderDefault();
        $forRender['title'] = 'Регистрация';

        return $this->render(
            'main/registration/register.html.twig',
            [
                'registrationForm' => $form->createView(),
            ]
        );
    }

    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/verify/email', name: 'app_verify_email')]
    public function verifyUserEmail(
        Request $request
    ): Response {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        try {
            $this->emailVerifier->handleEmailConfirmation($request, $this->getUser());
        } catch (VerifyEmailExceptionInterface $exception) {
            $this->addFlash('verify_email_error', $exception->getReason());

            return $this->redirectToRoute('app_register');
        }

        $this->addFlash('success', 'Your email address has been verified.');

        return $this->redirectToRoute('app_main_home_index');
    }
}
