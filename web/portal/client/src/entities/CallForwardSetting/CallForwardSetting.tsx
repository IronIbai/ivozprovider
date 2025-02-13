import PhoneForwardedIcon from '@mui/icons-material/PhoneForwarded';
import EntityInterface from '@irontec/ivoz-ui/entities/EntityInterface';
import _ from '@irontec/ivoz-ui/services/translations/translate';
import defaultEntityBehavior from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import { CallForwardSettingProperties } from './CallForwardSettingProperties';
import Form from './Form';
import TargetTypeValue from './Field/TargetTypeValue';
import TargetType from './Field/TargetType';
import CallForwardType from './Field/CallForwardType';
import { foreignKeyGetter } from './foreignKeyGetter';
import foreignKeyResolver from './foreignKeyResolver';
import selectOptions from './SelectOptions';

const properties: CallForwardSettingProperties = {
  user: {
    label: _('User'),
  },
  residentialDevice: {
    label: _('Residential Device'),
  },
  retailAccount: {
    label: _('Retail Account'),
  },
  friend: {
    label: _('Friend'),
  },
  ddi: {
    label: _('Called DDI'),
    null: _('Any'),
    default: '__null__',
  },
  cfwToRetailAccount: {
    label: _('Retail Account'),
    null: _('Unassigned'),
    default: '__null__',
    required: true,
  },
  callTypeFilter: {
    label: _('Call type'),
    enum: {
      internal: _('Internal'),
      external: _('External'),
      both: _('Both'),
    },
  },
  callForwardType: {
    label: _('Call forward type'),
    component: CallForwardType,
    enum: {
      inconditional: _('Inconditional'),
      noAnswer: _('No Answer'),
      busy: _('Busy'),
      userNotRegistered: _('Unreachable'),
    },
    visualToggle: {
      inconditional: {
        show: [],
        hide: ['noAnswerTimeout'],
      },
      noAnswer: {
        show: ['noAnswerTimeout'],
        hide: [],
      },
      busy: {
        show: [],
        hide: ['noAnswerTimeout'],
      },
      userNotRegistered: {
        show: [],
        hide: ['noAnswerTimeout'],
      },
    },
  },
  targetType: {
    label: _('Target type'),
    component: TargetType,
    enum: {
      number: _('Number'),
      extension: _('Extension'),
      voicemail: _('Voicemail'),
      retail: _('Retail Account'),
    },
    null: _('Unassigned'),
    default: '__null__',
    visualToggle: {
      __null__: {
        show: [],
        hide: [
          'extension',
          'voicemail',
          'numberCountry',
          'numberValue',
          'cfwToRetailAccount',
        ],
      },
      number: {
        show: ['numberCountry', 'numberValue'],
        hide: ['extension', 'voicemail', 'cfwToRetailAccount'],
      },
      extension: {
        show: ['extension'],
        hide: [
          'numberCountry',
          'numberValue',
          'voicemail',
          'cfwToRetailAccount',
        ],
      },
      voicemail: {
        show: ['voicemail'],
        hide: [
          'extension',
          'numberCountry',
          'numberValue',
          'cfwToRetailAccount',
        ],
      },
      retail: {
        show: ['cfwToRetailAccount'],
        hide: ['extension', 'numberCountry', 'numberValue', 'voicemail'],
      },
    },
  },
  numberCountry: {
    label: _('Country'),
    required: true,
  },
  numberValue: {
    label: _('Number'),
    pattern: RegExp('^[0-9]+$'),
    required: true,
  },
  extension: {
    label: _('Extension'),
    null: _('Unassigned'),
    default: '__null__',
    required: true,
  },
  voicemail: {
    label: _('Voicemail'),
    null: _('Unassigned'),
    default: '__null__',
    required: true,
  },
  noAnswerTimeout: {
    label: _('No answer timeout'),
    default: 10,
    required: true,
  },
  targetTypeValue: {
    label: _('Target type value'),
    component: TargetTypeValue,
  },
  enabled: {
    label: _('Enabled'),
    enum: {
      '0': _('No'),
      '1': _('Yes'),
    },
    default: '1',
  },
};

const CallForwardSetting: EntityInterface = {
  ...defaultEntityBehavior,
  icon: PhoneForwardedIcon,
  iden: 'CallForwardSetting',
  title: _('Call forward setting', { count: 2 }),
  path: '/call_forward_settings',
  properties,
  columns: [
    'enabled',
    'callTypeFilter',
    'callForwardType',
    'targetType',
    'targetTypeValue',
  ],
  acl: {
    ...defaultEntityBehavior.acl,
    iden: 'CallForwardSettings',
  },
  Form,
  foreignKeyResolver,
  foreignKeyGetter,
  selectOptions: (props, customProps) => {
    return selectOptions(props, customProps);
  },
};

export default CallForwardSetting;
