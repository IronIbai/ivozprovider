import LockIcon from '@mui/icons-material/Lock';
import EntityInterface from '@irontec/ivoz-ui/entities/EntityInterface';
import _ from '@irontec/ivoz-ui/services/translations/translate';
import defaultEntityBehavior from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import Form from './Form';
import { RouteLockProperties } from './RouteLockProperties';
import selectOptions from './SelectOptions';
import Status from './Field/Status';

const properties: RouteLockProperties = {
  status: {
    label: _('Status'),
    component: Status,
  },
  name: {
    label: _('Name'),
  },
  description: {
    label: _('Description'),
    required: false,
  },
  open: {
    label: _('Status'),
    enum: {
      '0': _('Closed'),
      '1': _('Opened'),
    },
    default: 1,
  },
  closeExtension: {
    label: _('Close extension'),
  },
  openExtension: {
    label: _('Open extension'),
  },
  toggleExtension: {
    label: _('Toggle extension'),
  },
};

const columns = [
  'status',
  'name',
  'description',
  'open',
  'closeExtension',
  'openExtension',
  'toggleExtension',
];

const routeLock: EntityInterface = {
  ...defaultEntityBehavior,
  icon: LockIcon,
  iden: 'RouteLock',
  title: _('Route Lock', { count: 2 }),
  path: '/route_locks',
  properties,
  columns,
  acl: {
    ...defaultEntityBehavior.acl,
    iden: 'RouteLocks',
  },
  Form,
  selectOptions: (props, customProps) => {
    return selectOptions(props, customProps);
  },
};

export default routeLock;
