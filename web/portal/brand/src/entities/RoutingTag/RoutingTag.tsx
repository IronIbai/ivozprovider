import AccountTreeIcon from '@mui/icons-material/AccountTree';
import EntityInterface from '@irontec/ivoz-ui/entities/EntityInterface';
import _ from '@irontec/ivoz-ui/services/translations/translate';
import defaultEntityBehavior from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import selectOptions from './SelectOptions';
import Form from './Form';
import { foreignKeyGetter } from './ForeignKeyGetter';
import { RoutingTagProperties } from './RoutingTagProperties';
import foreignKeyResolver from './ForeignKeyResolver';

const properties: RoutingTagProperties = {
  name: {
    label: _('Name'),
    maxLength: 80,
  },
  tag: {
    label: _('Tag'),
    pattern: new RegExp(`^[0-9]{1,3}#$`),
    maxLength: 15,
    helpText: _(`From 1 to 3 digits ended by # symbol`),
  },
};

const RoutingTag: EntityInterface = {
  ...defaultEntityBehavior,
  icon: AccountTreeIcon,
  iden: 'RoutingTag',
  title: _('RoutingTag', { count: 2 }),
  path: '/RoutingTags',
  toStr: (row: any) => row.id,
  properties,
  selectOptions,
  foreignKeyResolver,
  foreignKeyGetter,
  Form,
};

export default RoutingTag;
