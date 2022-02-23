import { UserPropertyList } from './UserProperties';
import { ForeignKeyGetterType } from 'lib/entities/EntityInterface';
import { autoSelectOptions } from 'lib/entities/DefaultEntityBehavior';
import entities from '../index';
import PickUpGroupSelectOptions from 'entities/PickUpGroup/SelectOptions';

export const foreignKeyGetter: ForeignKeyGetterType = async ({ cancelToken, entityService }): Promise<any> => {

    const response: UserPropertyList<unknown> = {};

    const promises = autoSelectOptions({
        entities,
        entityService,
        cancelToken,
        response,
    });

    promises[promises.length] = PickUpGroupSelectOptions({
        callback: (options: any) => {
            response.pickupGroupIds = options;
        },
        cancelToken
    });

    await Promise.all(promises);

    return response;
};