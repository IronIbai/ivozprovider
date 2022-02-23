import ArticleIcon from '@mui/icons-material/Article';
import EntityInterface, { OrderDirection } from 'lib/entities/EntityInterface';
import _ from 'lib/services/translations/translate';
import defaultEntityBehavior from 'lib/entities/DefaultEntityBehavior';
import { CallCsvReportProperties } from './CallCsvReportProperties';
import { EntityValues } from 'lib/services/entity/EntityService';

const properties: CallCsvReportProperties = {
    'sentTo': {
        label: _('Sent to'),
    },
    'inDate': {
        label: _('In date'),
        format: 'date-time',
    },
    'outDate': {
        label: _('Out date'),
        format: 'date-time',
    },
    'createdOn': {
        label: _('Created on'),
        format: 'date-time',
    },
    'csv': {
        'label': _('CSV'),
        'type': 'file',
    },
};

const CallCsvReport: EntityInterface = {
    ...defaultEntityBehavior,
    icon: ArticleIcon,
    iden: 'CallCsvReport',
    title: _('Call CSV report', { count: 2 }),
    path: '/call_csv_reports',
    properties,
    toStr: (row: EntityValues) => (row?.name as string | ''),
    defaultOrderBy: 'id',
    defaultOrderDirection: OrderDirection.desc,
    columns: [
        'csv',
        'inDate',
        'outDate',
        'createdOn',
        'sentTo',
    ],
};

export default CallCsvReport;