import { IvrPropertyList } from './IvrProperties';
import { ForeignKeyGetterType } from '@irontec/ivoz-ui/entities/EntityInterface';
import entities from '../index';
import { autoSelectOptions } from '@irontec/ivoz-ui/entities/DefaultEntityBehavior';
import ExtensionSelectOptions from 'entities/Extension/SelectOptions';
import EnabledVoicemailSelectOptions from 'entities/Voicemail/EnabledVoicemailSelectOptions';

export const foreignKeyGetter: ForeignKeyGetterType = async ({
  cancelToken,
  entityService,
}): Promise<any> => {
  const response: IvrPropertyList<Array<string | number>> = {};

  const promises = autoSelectOptions({
    entities,
    entityService,
    cancelToken,
    response,
    skip: [
      'noInputExtension',
      'errorExtension',
      'excludedExtensionIds',

      'noInputVoicemail',
      'errorVoicemail',
    ],
  });

  promises[promises.length] = ExtensionSelectOptions({
    callback: (options: any) => {
      response.noInputExtension = options;
      response.errorExtension = options;
      response.excludedExtensionIds = options;
    },
    cancelToken,
  });

  promises[promises.length] = EnabledVoicemailSelectOptions({
    callback: (options: any) => {
      response.noInputVoicemail = options;
      response.errorVoicemail = options;
    },
    cancelToken,
  });

  await Promise.all(promises);

  return response;
};
