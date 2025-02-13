<?php

declare(strict_types=1);

namespace Ivoz\Provider\Domain\Model\Extension;

use Ivoz\Core\Application\DataTransferObjectInterface;
use Ivoz\Core\Application\ForeignKeyTransformerInterface;
use Ivoz\Provider\Domain\Model\User\UserInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\Selectable;
use Doctrine\Common\Collections\Criteria;

/**
* @codeCoverageIgnore
*/
trait ExtensionTrait
{
    /**
     * @var ?int
     */
    protected $id = null;

    /**
     * @var Collection<array-key, UserInterface> & Selectable<array-key, UserInterface>
     * UserInterface mappedBy extension
     */
    protected $users;

    /**
     * Constructor
     */
    protected function __construct()
    {
        parent::__construct(...func_get_args());
        $this->users = new ArrayCollection();
    }

    abstract protected function sanitizeValues(): void;

    /**
     * Factory method
     * @internal use EntityTools instead
     * @param ExtensionDto $dto
     */
    public static function fromDto(
        DataTransferObjectInterface $dto,
        ForeignKeyTransformerInterface $fkTransformer
    ): static {
        /** @var static $self */
        $self = parent::fromDto($dto, $fkTransformer);
        $users = $dto->getUsers();
        if (!is_null($users)) {

            /** @var Collection<array-key, UserInterface> $replacement */
            $replacement = $fkTransformer->transformCollection(
                $users
            );
            $self->replaceUsers($replacement);
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
     * @param ExtensionDto $dto
     */
    public function updateFromDto(
        DataTransferObjectInterface $dto,
        ForeignKeyTransformerInterface $fkTransformer
    ): static {
        parent::updateFromDto($dto, $fkTransformer);
        $users = $dto->getUsers();
        if (!is_null($users)) {

            /** @var Collection<array-key, UserInterface> $replacement */
            $replacement = $fkTransformer->transformCollection(
                $users
            );
            $this->replaceUsers($replacement);
        }
        $this->sanitizeValues();

        return $this;
    }

    /**
     * @internal use EntityTools instead
     */
    public function toDto(int $depth = 0): ExtensionDto
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

    public function addUser(UserInterface $user): ExtensionInterface
    {
        $this->users->add($user);

        return $this;
    }

    public function removeUser(UserInterface $user): ExtensionInterface
    {
        $this->users->removeElement($user);

        return $this;
    }

    /**
     * @param Collection<array-key, UserInterface> $users
     */
    public function replaceUsers(Collection $users): ExtensionInterface
    {
        $updatedEntities = [];
        $fallBackId = -1;
        foreach ($users as $entity) {
            /** @var string|int $index */
            $index = $entity->getId() ? $entity->getId() : $fallBackId--;
            $updatedEntities[$index] = $entity;
            $entity->setExtension($this);
        }

        foreach ($this->users as $key => $entity) {
            $identity = $entity->getId();
            if (!$identity) {
                $this->users->remove($key);
                continue;
            }

            if (array_key_exists($identity, $updatedEntities)) {
                $this->users->set($key, $updatedEntities[$identity]);
                unset($updatedEntities[$identity]);
            } else {
                $this->users->remove($key);
            }
        }

        foreach ($updatedEntities as $entity) {
            $this->addUser($entity);
        }

        return $this;
    }

    /**
     * @return array<array-key, UserInterface>
     */
    public function getUsers(Criteria $criteria = null): array
    {
        if (!is_null($criteria)) {
            return $this->users->matching($criteria)->toArray();
        }

        return $this->users->toArray();
    }
}
