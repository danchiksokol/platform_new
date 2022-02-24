<?php

namespace App\Services\Token;


use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Signer\Key\InMemory;
use Lcobucci\JWT\Configuration;
use Symfony\Component\DependencyInjection\ContainerInterface;


class TokenService
{

    /**
     * @var ContainerInterface
     */
    private ContainerInterface $container;

    /**
     * @param ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    /**
     * @param $chatRoomId
     * @return string
     */
    public function createToken($chatRoomId): string
    {
        $config = Configuration::forSymmetricSigner(
            new Sha256(),
            InMemory::plainText($this->container->getParameter('mercure_secret_key'))
        );

        return $config->builder()
            ->withClaim('mercure', ['subscribe' => ['/broadcast/' . $chatRoomId]])
            ->getToken($config->signer(), $config->signingKey())->toString();
    }
}