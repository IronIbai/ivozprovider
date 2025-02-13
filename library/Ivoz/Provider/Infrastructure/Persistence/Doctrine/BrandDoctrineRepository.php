<?php

namespace Ivoz\Provider\Infrastructure\Persistence\Doctrine;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Ivoz\Provider\Domain\Model\Brand\Brand;
use Ivoz\Provider\Domain\Model\Brand\BrandRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * BrandDoctrineRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 *
 * @template-extends ServiceEntityRepository<Brand>
 */
class BrandDoctrineRepository extends ServiceEntityRepository implements BrandRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Brand::class);
    }

    /**
     * @return string[]
     */
    public function getNames()
    {
        $qb = $this->createQueryBuilder('self');

        $result = $qb
            ->select('self.id, self.name')
            ->getQuery()
            ->getScalarResult();

        $response = [];
        foreach ($result as $row) {
            $response[$row['id']] = $row['name'];
        }

        return $response;
    }
}
