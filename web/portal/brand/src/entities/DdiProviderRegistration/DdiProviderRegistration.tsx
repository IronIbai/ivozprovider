import AccountTreeIcon from '@mui/icons-material/AccountTree';
import EntityInterface from '@irontec/ivoz-ui/entities/EntityInterface';
import _ from '@irontec/ivoz-ui/services/translations/translate';
import defaultEntityBehavior from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import selectOptions from './SelectOptions';
import Form from './Form';
import { foreignKeyGetter } from './ForeignKeyGetter';
import { DdiProviderRegistrationProperties } from './DdiProviderRegistrationProperties';
import foreignKeyResolver from './ForeignKeyResolver';

const properties: DdiProviderRegistrationProperties = {
  username: {
    label: _('Username'),
  },
  domain: {
    label: _('Domain'),
  },
  realm: {
    label: _('Realm'),
    helpText: _('Leave empty to use the suggested default'),
  },
  authUsername: {
    label: _('Auth username'),
    helpText: _("Only if it's different from the Username"),
  },
  authPassword: {
    label: _('Password'),
    pattern: new RegExp('^sip:.*$|^sips:.*$'),
    helpText: _('Must start with sip or sips followed by colon'),
  },
  authProxy: {
    label: _('Registrar Server URI'),
  },
  expires: {
    label: _('Expire'),
    default: 3600,
  },
  multiDdi: {
    label: _('Random Contact Username'),
    default: 1,
    enum: {
      '0': _('No'),
      '1': _('Yes'),
    },
    visualToggle: {
      '0': {
        show: ['contactUsername'],
        hide: [],
      },
      '1': {
        show: [],
        hide: ['contactUsername'],
      },
    },
  },
  contactUsername: {
    label: _('Contact Username'),
    helpText: _(
      'Is sent in the username of Contact header in generated REGISTER.'
    ),
  },
  ddiProvider: {
    label: _('Ddi Provider'),
  },
  status: {
    label: _('Status'),
  },
  statusIcon: {
    label: _('Status'),
    //@TODO IvozProvider_Klear_Ghost_RegisterStatus::getDdiProviderStatusIcon
  },
};

const DdiProviderRegistration: EntityInterface = {
  ...defaultEntityBehavior,
  icon: AccountTreeIcon,
  iden: 'DdiProviderRegistration',
  title: _('DdiProviderRegistration', { count: 2 }),
  path: '/DdiProviderRegistrations',
  toStr: (row: any) => row.id,
  properties,
  selectOptions,
  foreignKeyResolver,
  foreignKeyGetter,
  Form,
};

export default DdiProviderRegistration;
