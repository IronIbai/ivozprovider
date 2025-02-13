<?php

namespace Ivoz\Provider\Domain\Model\TerminalModel;

use Doctrine\Common\Collections\Selectable;
use Doctrine\Persistence\ObjectRepository;

interface TerminalModelRepository extends ObjectRepository, Selectable
{
    /**
     * @return TerminalModelInterface | null
     */
    public function findOneByIden(string $iden);
}
