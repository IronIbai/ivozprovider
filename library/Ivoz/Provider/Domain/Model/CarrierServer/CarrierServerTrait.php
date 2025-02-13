<?php

declare(strict_types=1);

namespace Ivoz\Provider\Domain\Model\CarrierServer;

use Ivoz\Core\Application\DataTransferObjectInterface;
use Ivoz\Core\Application\ForeignKeyTransformerInterface;
use Ivoz\Kam\Domain\Model\TrunksLcrGateway\TrunksLcrGatewayInterface;

/**
* @codeCoverageIgnore
*/
trait CarrierServerTrait
{
    /**
     * @var ?int
     */
    protected $id = null;

    /**
     * @var TrunksLcrGatewayInterface
     * mappedBy carrierServer
     */
    protected $lcrGateway;

    /**
     * Constructor
     */
    protected function __construct()
    {
        parent::__construct(...func_get_args());
    }

    abstract protected function sanitizeValues(): void;

    /**
     * Factory method
     * @internal use EntityTools instead
     * @param CarrierServerDto $dto
     */
    public static function fromDto(
        DataTransferObjectInterface $dto,
        ForeignKeyTransformerInterface $fkTransformer
    ): static {
        /** @var static $self */
        $self = parent::fromDto($dto, $fkTransformer);
        if (!is_null($dto->getLcrGateway())) {
            /** @var TrunksLcrGatewayInterface $entity */
            $entity = $fkTransformer->transform(
                $dto->getLcrGateway()
            );
            $self->setLcrGateway($entity);
        }

        $self->sanitizeValues();
        if ($dto->getId()) {
            $self->id = $dto->getId();
            $self->initChangelog();
        }

        return $self;
    }

    /**
     * @internal use EntityTools instead
     * @param CarrierServerDto $dto
     */
    public function updateFromDto(
        DataTransferObjectInterface $dto,
        ForeignKeyTransformerInterface $fkTransformer
    ): static {
        parent::updateFromDto($dto, $fkTransformer);
        if (!is_null($dto->getLcrGateway())) {
            /** @var TrunksLcrGatewayInterface $entity */
            $entity = $fkTransformer->transform(
                $dto->getLcrGateway()
            );
            $this->setLcrGateway($entity);
        }
        $this->sanitizeValues();

        return $this;
    }

    /**
     * @internal use EntityTools instead
     */
    public function toDto(int $depth = 0): CarrierServerDto
    {
        $dto = parent::toDto($depth);
        return $dto
            ->setId($this->getId());
    }

    /**
     * @return array<string, mixed>
     */
    protected function __toArray(): array
    {
        return parent::__toArray() + [
            'id' => self::getId()
        ];
    }

    public function setLcrGateway(TrunksLcrGatewayInterface $lcrGateway): static
    {
        $this->lcrGateway = $lcrGateway;

        return $this;
    }

    public function getLcrGateway(): ?TrunksLcrGatewayInterface
    {
        return $this->lcrGateway;
    }
}
