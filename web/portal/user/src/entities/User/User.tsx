import defaultEntityBehavior from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import EntityInterface from '@irontec/ivoz-ui/entities/EntityInterface';
import _ from '@irontec/ivoz-ui/services/translations/translate';
import AccountTreeIcon from '@mui/icons-material/AccountTree';
import { foreignKeyGetter } from './ForeignKeyGetter';
import foreignKeyResolver from './ForeignKeyResolver';
import Form from './Form';
import { UserProperties } from './UserProperties';

const properties: UserProperties = {
  bossAssistant: {
    label: _('Boss Assistant'),
  },
  doNotDisturb: {
    label: _('Do Not Disturb'),
  },
  email: {
    label: _('email'),
  },
  id: {
    label: _('ID'),
  },
  isBoss: {
    label: _('Is Boss'),
  },
  lastname: {
    label: _('Last Name'),
  },
  maxCalls: {
    label: _('Max Calls'),
  },
  name: {
    label: _('Name'),
  },
  timezone: {
    label: _('TimeZone'),
  },
  pass: {
    label: _('Password'),
  },
  oldPass: {
    label: _('Old password'),
  },
  repeatPass: {
    label: _('Repeat password'),
  },
};

const columns = ['startTime', 'caller', 'duration', 'direction'];

const User: EntityInterface = {
  ...defaultEntityBehavior,
  icon: AccountTreeIcon,
  iden: 'User',
  title: _('Profile', { count: 2 }),
  path: '/my/profile',
  localPath: '/profile',
  toStr: (row: any) => row.id,
  properties,
  columns,
  foreignKeyResolver,
  foreignKeyGetter,
  Form,
};

export default User;
