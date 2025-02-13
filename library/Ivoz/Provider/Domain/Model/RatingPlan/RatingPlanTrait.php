<?php

declare(strict_types=1);

namespace Ivoz\Provider\Domain\Model\RatingPlan;

use Ivoz\Core\Application\DataTransferObjectInterface;
use Ivoz\Core\Application\ForeignKeyTransformerInterface;
use Ivoz\Cgr\Domain\Model\TpTiming\TpTimingInterface;
use Ivoz\Cgr\Domain\Model\TpRatingPlan\TpRatingPlanInterface;

/**
* @codeCoverageIgnore
*/
trait RatingPlanTrait
{
    /**
     * @var ?int
     */
    protected $id = null;

    /**
     * @var TpTimingInterface
     * mappedBy ratingPlan
     */
    protected $tpTiming;

    /**
     * @var TpRatingPlanInterface
     * mappedBy ratingPlan
     */
    protected $tpRatingPlan;

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
     * @param RatingPlanDto $dto
     */
    public static function fromDto(
        DataTransferObjectInterface $dto,
        ForeignKeyTransformerInterface $fkTransformer
    ): static {
        /** @var static $self */
        $self = parent::fromDto($dto, $fkTransformer);
        if (!is_null($dto->getTpTiming())) {
            /** @var TpTimingInterface $entity */
            $entity = $fkTransformer->transform(
                $dto->getTpTiming()
            );
            $self->setTpTiming($entity);
        }

        if (!is_null($dto->getTpRatingPlan())) {
            /** @var TpRatingPlanInterface $entity */
            $entity = $fkTransformer->transform(
                $dto->getTpRatingPlan()
            );
            $self->setTpRatingPlan($entity);
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
     * @param RatingPlanDto $dto
     */
    public function updateFromDto(
        DataTransferObjectInterface $dto,
        ForeignKeyTransformerInterface $fkTransformer
    ): static {
        parent::updateFromDto($dto, $fkTransformer);
        if (!is_null($dto->getTpTiming())) {
            /** @var TpTimingInterface $entity */
            $entity = $fkTransformer->transform(
                $dto->getTpTiming()
            );
            $this->setTpTiming($entity);
        }

        if (!is_null($dto->getTpRatingPlan())) {
            /** @var TpRatingPlanInterface $entity */
            $entity = $fkTransformer->transform(
                $dto->getTpRatingPlan()
            );
            $this->setTpRatingPlan($entity);
        }
        $this->sanitizeValues();

        return $this;
    }

    /**
     * @internal use EntityTools instead
     */
    public function toDto(int $depth = 0): RatingPlanDto
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

    public function setTpTiming(TpTimingInterface $tpTiming): static
    {
        $this->tpTiming = $tpTiming;

        return $this;
    }

    public function getTpTiming(): ?TpTimingInterface
    {
        return $this->tpTiming;
    }

    public function setTpRatingPlan(TpRatingPlanInterface $tpRatingPlan): static
    {
        $this->tpRatingPlan = $tpRatingPlan;

        return $this;
    }

    public function getTpRatingPlan(): ?TpRatingPlanInterface
    {
        return $this->tpRatingPlan;
    }
}
