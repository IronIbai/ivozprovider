<?php

namespace Ivoz\Provider\Domain\Service\MusicOnHold;

use Ivoz\Provider\Infrastructure\Gearman\Jobs\Recoder;
use Ivoz\Provider\Domain\Model\MusicOnHold\MusicOnHold;
use Ivoz\Provider\Domain\Model\MusicOnHold\MusicOnHoldInterface;

/**
 * Class RecodingOrder
 * @package Ivoz\Provider\Domain\Service\MusicOnHold
 */
class SendRecodingOrder implements MusicOnHoldLifecycleEventHandlerInterface
{
    const ON_COMMIT_PRIORITY = self::PRIORITY_NORMAL;

    /**
     * @var Recoder
     */
    protected $recoder;

    public function __construct(
        Recoder $recoder
    ) {
        $this->recoder = $recoder;
    }

    public static function getSubscribedEvents()
    {
        return [
            self::EVENT_ON_COMMIT => self::ON_COMMIT_PRIORITY
        ];
    }

    /**
     * @return void
     */
    public function execute(MusicOnHoldInterface $entity)
    {
        if ($entity->hasBeenDeleted()) {
            return;
        }

        $pendingStatus = $entity->getStatus() === 'pending';
        $statusHasChanged = $entity->hasChanged('status');

        if ($pendingStatus && $statusHasChanged) {
            $this->recoder
                ->setId($entity->getId())
                ->setEntityName(MusicOnHold::class)
                ->send();
        }
    }
}
