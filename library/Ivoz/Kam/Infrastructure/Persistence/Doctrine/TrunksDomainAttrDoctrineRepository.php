<?php

namespace Ivoz\Kam\Infrastructure\Persistence\Doctrine;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Ivoz\Kam\Domain\Model\TrunksDomainAttr\TrunksDomainAttrRepository;
use Ivoz\Kam\Domain\Model\TrunksDomainAttr\TrunksDomainAttr;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * TrunksDomainAttrDoctrineRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class TrunksDomainAttrDoctrineRepository extends ServiceEntityRepository implements TrunksDomainAttrRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, TrunksDomainAttr::class);
    }
}
