<?php

namespace Controller\My;

use ApiPlatform\Core\Exception\ResourceClassNotFoundException;
use Assert\Assertion;
use Ivoz\Kam\Domain\Service\TrunksClientInterface;
use Model\ActiveCalls;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class ActiveCallsAction
{
    public function __construct(
        private TokenStorageInterface $tokenStorage,
        private RequestStack $requestStack,
        private TrunksClientInterface $apiClient
    ) {
    }

    public function __invoke()
    {
        /** @var Request $request */
        $request = $this->requestStack->getCurrentRequest();

        $token =  $this->tokenStorage->getToken();

        if (!$token || !$token->getUser()) {
            throw new ResourceClassNotFoundException('User not found');
        }

        $brandId = $request->query->get('brand');
        if ($brandId) {
            Assertion::numeric($brandId);
        }

        $activeCalls = $brandId !== null
            ? $this->apiClient->getBrandActiveCalls(intval($brandId))
            : $this->apiClient->getPlatformActiveCalls();

        return new ActiveCalls(
            $activeCalls[0] ?? 0,
            $activeCalls[1] ?? 0
        );
    }
}
