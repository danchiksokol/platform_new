<?php

namespace App\Controller\Main;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Form\RegistrationHelpFormType;
use App\Repository\MemcachedRepository;
use App\Security\EmailVerifier;
use App\Services\Mailer\MailerService;
use App\Services\User\UserService;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Exception;
use Psr\Cache\InvalidArgumentException;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
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
    private MailerService $mailerService;
    private MemcachedRepository $memcachedRepository;

    /**
     * RegistrationController constructor.
     * @param EmailVerifier $emailVerifier
     * @param UserService $userService
     * @param MailerService $mailerService
     * @param MemcachedRepository $memcachedRepository
     */
    public function __construct(
        EmailVerifier $emailVerifier,
        UserService $userService,
        MailerService $mailerService,
        MemcachedRepository $memcachedRepository
    ) {
        $this->emailVerifier = $emailVerifier;
        $this->userService = $userService;
        $this->mailerService = $mailerService;
        $this->memcachedRepository = $memcachedRepository;
    }


    /**
     * @param Request $request
     * @return Response
     * @throws TransportExceptionInterface
     * @throws InvalidArgumentException
     * @throws Exception
     */
    #[Route('/register', name: 'app_register')]
    public function registerAction(Request $request): Response
    {
        $user = new User();
        $registryForm = $this->createForm(RegistrationFormType::class, $user);
        $registryForm->handleRequest($request);
        if ($registryForm->get('registryButton')->isClicked()
            && $registryForm->isSubmitted() && $registryForm->isValid()) {
            $this->userService->handleCreate($user, $registryForm);
            $this->memcachedRepository->clearByKey('users.getAll');

            $this->emailVerifier->sendEmailConfirmation(
                'app_login',
                $user,
                (new TemplatedEmail())
                    ->from(new Address('conference@tsoncology.com', mb_convert_encoding('Conferenceml.com', "UTF-8")))
                    ->to($user->getEmail())
                    ->subject(
                        'Подтверждение регистрации на XVIII Российскую конференцию с международным участием «Злокачественные лимфомы»'
                    )
                    ->htmlTemplate('main/registration/confirmation_email.html.twig')
            );
            $this->addFlash(
                'successRegistration',
                'Вы успешно зарегистрировались на XVIII Российскую конференцию с международным участием «Злокачественные лимфомы».'
            );

            return $this->redirectToRoute('app_register');
        }

        $helpFrom = $this->createForm(RegistrationHelpFormType::class);
        $helpFrom->handleRequest($request);
        if ($helpFrom->get('helpButton')->isClicked() && $helpFrom->isSubmitted()) {
            $title = 'Помощь в регистрации на «Злокачественные лимфомы»';
            $this->mailerService->handleSendRegistrationHelpEmail($helpFrom, $title);
            $this->addFlash('successHelpSend', 'Ваше обращение отправлено');
            return $this->redirectToRoute('app_register');
        }


        $forRender = parent::renderDefault();
        $forRender['title'] = 'Регистрация';
        $forRender['registrationForm'] = $registryForm->createView();
        $forRender['helpForm'] = $helpFrom->createView();

        return $this->render(
            'main/registration/register.html.twig',
            $forRender
        );
    }

    /**
     * @param Request $request
     * @return Response
     */
    #[Route('/verify/email', name: 'app_verify_email')]
    public function verifyUserEmailAction(
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
