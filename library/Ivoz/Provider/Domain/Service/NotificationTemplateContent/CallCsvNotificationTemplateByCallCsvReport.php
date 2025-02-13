<?php

namespace Ivoz\Provider\Domain\Service\NotificationTemplateContent;

use Ivoz\Provider\Domain\Model\CallCsvReport\CallCsvReportInterface;
use Ivoz\Provider\Domain\Model\NotificationTemplate\NotificationTemplateRepository;
use Ivoz\Provider\Domain\Model\NotificationTemplateContent\NotificationTemplateContentInterface;

class CallCsvNotificationTemplateByCallCsvReport
{
    public function __construct(
        private NotificationTemplateRepository $notificationTemplateRepository
    ) {
    }

    public function execute(CallCsvReportInterface $callCsvReport): ?NotificationTemplateContentInterface
    {
        $company = $callCsvReport->getCompany();
        $brand = $callCsvReport->getBrand();

        $language = $company
            ? $company->getLanguage()
            : $brand->getLanguage();

        $callCsvNotificationTemplate = $this
            ->notificationTemplateRepository
            ->findCallCsvTemplateByCallCsvReport($callCsvReport);

        // Get Notification contents for required language
        return $callCsvNotificationTemplate->getContentsByLanguage(
            $language
        );
    }
}
