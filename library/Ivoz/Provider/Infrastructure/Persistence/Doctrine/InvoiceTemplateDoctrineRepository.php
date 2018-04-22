<?php

namespace Ivoz\Provider\Infrastructure\Persistence\Doctrine;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Ivoz\Provider\Domain\Model\InvoiceTemplate\InvoiceTemplateRepository;
use Ivoz\Provider\Domain\Model\InvoiceTemplate\InvoiceTemplate;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * InvoiceTemplateDoctrineRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class InvoiceTemplateDoctrineRepository extends ServiceEntityRepository implements InvoiceTemplateRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, InvoiceTemplate::class);
    }
}
