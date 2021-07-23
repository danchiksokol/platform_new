<?php

namespace App\Security;

use App\Repository\UserRepository;
use JetBrains\PhpStorm\ArrayShape;
use JetBrains\PhpStorm\Pure;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAccountStatusException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Guard\AbstractGuardAuthenticator;

class SecretAuthenticator extends AbstractGuardAuthenticator
{
    /**
     * @var UserRepository
     */
    private UserRepository $userRepository;

    /**
     * SecretAuthenticator constructor.
     * @param UserRepository $userRepository
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * @param Request $request
     * @return bool
     */
    #[Pure]
    public function supports(
        Request $request
    ): bool {
        return $request->query->has('secret');
    }

    /**
     * @param Request $request
     * @return array
     */
    #[ArrayShape(['secret' => "mixed"])]
    public function getCredentials(
        Request $request
    ): array {
        return [
            'secret' => $request->query->get('secret')
        ];
    }

    /**
     * @param mixed $credentials
     * @param UserProviderInterface $userProvider
     * @return object
     */
    public function getUser($credentials, UserProviderInterface $userProvider): object
    {
        $user = $this->userRepository->getOneBySecret($credentials['secret']);

        if (!$user) {
            throw new CustomUserMessageAccountStatusException('Неверный код!');
        }

        return $user;
    }

    /**
     * @param mixed $credentials
     * @param UserInterface $user
     * @return bool
     */
    public function checkCredentials($credentials, UserInterface $user): bool
    {
        if ($credentials['secret'] === $user->getSecret()) {
            $this->userRepository->setVerification($user);

            return true;
        }

        return false;
    }

    /**
     * @param Request $request
     * @param AuthenticationException $exception
     * @return Response
     */
    public function onAuthenticationFailure(Request $request, AuthenticationException $exception): Response
    {
        return new Response('Что-то пошло не так попробуюте через форму залогиниться');
    }

    /**
     * @param Request $request
     * @param TokenInterface $token
     * @param string $providerKey
     * @return RedirectResponse
     */
    public function onAuthenticationSuccess(
        Request $request,
        TokenInterface $token,
        string $providerKey
    ): RedirectResponse {
        return new RedirectResponse('/');
    }

    public function start(Request $request, AuthenticationException $authException = null)
    {
        // todo
    }

    public function supportsRememberMe()
    {
        // todo
    }
}
