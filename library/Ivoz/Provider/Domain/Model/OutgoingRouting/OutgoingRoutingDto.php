<?php

namespace Ivoz\Provider\Domain\Model\OutgoingRouting;

use Ivoz\Api\Core\Annotation\AttributeDefinition;
use Ivoz\Provider\Domain\Model\OutgoingRoutingRelCarrier\OutgoingRoutingRelCarrierDto;

class OutgoingRoutingDto extends OutgoingRoutingDtoAbstract
{
    public const CONTEXT_WITH_CARRIERS = 'withCarriers';

    public const CONTEXTS_WITH_CARRIERS = [
        self::CONTEXT_WITH_CARRIERS,
        self::CONTEXT_DETAILED
    ];

    /**
     * @var int[]
     * @AttributeDefinition(
     *     type="array",
     *     collectionValueType="int",
     *     description="Carriers on LCR route type"
     * )
     */
    private $carrierIds = [];

    public static function getPropertyMap(string $context = '', string $role = null): array
    {
        if ($context === self::CONTEXT_COLLECTION) {
            $response = [
                'id' => 'id',
                'type' => 'type',
                'priority' => 'priority',
                'weight' => 'weight',
                'routingMode' => 'routingMode',
                'companyId' => 'company',
                'routingTagId' => 'routingTag',
            ];
        } else {
            $response = parent::getPropertyMap($context);
        }

        if (in_array($context, self::CONTEXTS_WITH_CARRIERS, true)) {
            $response['carrierIds'] = 'carrierIds';
        }

        if ($role === 'ROLE_BRAND_ADMIN') {
            unset($response['brandId']);
        }

        return $response;
    }

    public function denormalize(array $data, string $context, string $role = ''): void
    {
        $contextProperties = self::getPropertyMap($context, $role);
        if ($role === 'ROLE_BRAND_ADMIN') {
            $contextProperties['brandId'] = 'brand';
        }

        $this->setByContext(
            $contextProperties,
            $data
        );
    }

    public function normalize(string $context, string $role = ''): array
    {
        $response = parent::normalize(
            $context,
            $role
        );

        if (in_array($context, self::CONTEXTS_WITH_CARRIERS, true)) {
            $response['carrierIds'] = $this->carrierIds;
        }

        return $response;
    }

    /**
     * @param int[] $carrierIds
     *
     * @return void
     */
    public function setCarrierIds(array $carrierIds): void
    {
        $this->carrierIds = $carrierIds;

        $relCarriers = [];
        foreach ($carrierIds as $id) {
            $dto = new OutgoingRoutingRelCarrierDto();
            $dto->setCarrierId($id);
            $relCarriers[] = $dto;
        }

        $this->setRelCarriers($relCarriers);
    }
}
