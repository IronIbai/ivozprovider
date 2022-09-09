<?php

namespace Ivoz\Provider\Domain\Model\MusicOnHold;

use Ivoz\Api\Core\Annotation\AttributeDefinition;

class MusicOnHoldDto extends MusicOnHoldDtoAbstract
{
    /** @var ?string */
    private $originalFilePath;
    /** @var ?string */
    private $encodedFilePath;

    /**
     * @inheritdoc
     * @codeCoverageIgnore
     */
    public static function getPropertyMap(string $context = '', string $role = null): array
    {
        if ($context === self::CONTEXT_COLLECTION) {
            return [
                'id' => 'id',
                'name' => 'name',
                'status' => 'status',
                'originalFile' => ['baseName'],
            ];
        }

        $response = parent::getPropertyMap(...func_get_args());

        if ($role === 'ROLE_COMPANY_ADMIN') {
            unset($response['companyId']);
        } elseif ($role === 'ROLE_BRAND_ADMIN') {
            unset($response['brandId']);
            unset($response['companyId']);
        }

        return $response;
    }

    public function denormalize(array $data, string $context, string $role = ''): void
    {
        $contextProperties = self::getPropertyMap($context, $role);
        if ($role === 'ROLE_COMPANY_ADMIN') {
            $contextProperties['companyId'] = 'company';
        }

        if ($role === 'ROLE_BRAND_ADMIN') {
            $contextProperties['brandId'] = 'brand';
        }

        if ($context === self::CONTEXT_SIMPLE) {
            $contextProperties['originalFile'][] = 'path';
        }

        $this->setByContext(
            $contextProperties,
            $data
        );
    }

    /**
     * @return self
     */
    public function setOriginalFilePath(string $path)
    {
        $this->originalFilePath = $path;
        return $this;
    }

    /**
     * @return ?string
     */
    public function getOriginalFilePath()
    {
        return $this->originalFilePath;
    }

    /**
     * @return self
     */
    public function setEncodedFilePath(string $path)
    {
        $this->encodedFilePath = $path;
        return $this;
    }

    /**
     * @return ?string
     */
    public function getEncodedFilePath()
    {
        return $this->encodedFilePath;
    }

    /**
     * @return string[]
     *
     * @psalm-return array{0: string, 1: string}
     */
    public function getFileObjects(): array
    {
        return [
            'encodedFile',
            'originalFile'
        ];
    }
}
