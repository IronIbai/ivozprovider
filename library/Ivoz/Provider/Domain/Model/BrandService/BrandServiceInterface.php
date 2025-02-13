<?php

namespace Ivoz\Provider\Domain\Model\BrandService;

use Ivoz\Core\Domain\Model\LoggableEntityInterface;
use Ivoz\Core\Domain\Model\EntityInterface;
use Ivoz\Core\Application\DataTransferObjectInterface;
use Ivoz\Core\Application\ForeignKeyTransformerInterface;
use Ivoz\Provider\Domain\Model\Brand\BrandInterface;
use Ivoz\Provider\Domain\Model\Service\ServiceInterface;

/**
* BrandServiceInterface
*/
interface BrandServiceInterface extends LoggableEntityInterface
{
    /**
     * @codeCoverageIgnore
     * @return array<string, mixed>
     */
    public function getChangeSet(): array;

    /**
     * Get id
     * @codeCoverageIgnore
     * @return integer
     */
    public function getId(): ?int;

    /**
     * {@inheritDoc}
     */
    public function setCode(string $code): static;

    public static function createDto(string|int|null $id = null): BrandServiceDto;

    /**
     * @internal use EntityTools instead
     * @param null|BrandServiceInterface $entity
     */
    public static function entityToDto(?EntityInterface $entity, int $depth = 0): ?BrandServiceDto;

    /**
     * Factory method
     * @internal use EntityTools instead
     * @param BrandServiceDto $dto
     */
    public static function fromDto(DataTransferObjectInterface $dto, ForeignKeyTransformerInterface $fkTransformer): static;

    /**
     * @internal use EntityTools instead
     */
    public function toDto(int $depth = 0): BrandServiceDto;

    public function getCode(): string;

    public function setBrand(BrandInterface $brand): static;

    public function getBrand(): BrandInterface;

    public function getService(): ServiceInterface;

    public function isInitialized(): bool;
}
