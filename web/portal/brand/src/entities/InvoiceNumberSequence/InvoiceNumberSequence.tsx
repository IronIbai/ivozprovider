import AccountTreeIcon from '@mui/icons-material/AccountTree';
import EntityInterface from '@irontec/ivoz-ui/entities/EntityInterface';
import _ from '@irontec/ivoz-ui/services/translations/translate';
import defaultEntityBehavior from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import selectOptions from './SelectOptions';
import Form from './Form';
import { foreignKeyGetter } from './ForeignKeyGetter';
import { InvoiceNumberSequenceProperties } from './InvoiceNumberSequenceProperties';
import foreignKeyResolver from './ForeignKeyResolver';

const properties: InvoiceNumberSequenceProperties = {
  name: {
    label: _('Name'),
    maxLength: 40,
  },
  prefix: {
    label: _('Prefix'),
    maxLength: 20,
  },
  sequenceLength: {
    label: _('Sequence length'),
    default: 4,
    maximum: 10,
    minimum: 2,
  },
  increment: {
    label: _('Increment'),
    default: 1,
    maximum: 10,
    minimum: 1,
  },
  latestValue: {
    label: _('Latest value'),
  },
  iteration: {
    label: _('Iteration'),
  },
  version: {
    label: _('Version'),
  },
};

const InvoiceNumberSequence: EntityInterface = {
  ...defaultEntityBehavior,
  icon: AccountTreeIcon,
  iden: 'InvoiceNumberSequence',
  title: _('InvoiceNumberSequence', { count: 2 }),
  path: '/InvoiceNumberSequences',
  toStr: (row: any) => row.id,
  properties,
  selectOptions,
  foreignKeyResolver,
  foreignKeyGetter,
  Form,
};

export default InvoiceNumberSequence;
