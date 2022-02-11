import genericForeignKeyResolver, { remapFk } from 'lib/services/api/genericForeigKeyResolver';
import entities from '../index';
import { ConditionalRoutePropertiesList } from './ConditionalRouteProperties';
import { CountryPropertyList } from 'entities/Country/CountryProperties';
import { foreignKeyResolverType } from 'lib/entities/EntityInterface';

const foreignKeyResolver: foreignKeyResolverType = async function(
    { data, cancelToken }
): Promise<ConditionalRoutePropertiesList> {

    const promises = [];
    const {
        User, HuntGroup, ConferenceRoom, Queue, Ivr, Extension, Country, Friend, Locution
    } = entities;

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'user',
            entity: User,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'ivr',
            entity: Ivr,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'huntGroup',
            entity: HuntGroup,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'voicemailUser',
            entity: User,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'numberCountry',
            entity: {
                ...Country,
                toStr: (row: CountryPropertyList<string>) => row.countryCode as string,
            },
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'friend',
            entity: Friend,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'queue',
            entity: Queue,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'conferenceRoom',
            entity: ConferenceRoom,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'extension',
            entity: Extension,
            cancelToken,
        })
    );

    promises.push(
        genericForeignKeyResolver({
            data,
            fkFld: 'locution',
            entity: Locution,
            cancelToken,
        })
    );

    await Promise.all(promises);

    if (!Array.isArray(data)) {
        return data;
    }

    for (const idx in data) {

        switch (data[idx].routetype) {
            case 'user':
                remapFk(data[idx], 'user', 'target');
                break;
            case 'ivr':
                remapFk(data[idx], 'ivr', 'target');
                break;
            case 'huntGroup':
                remapFk(data[idx], 'huntGroup', 'target');
                break;
            case 'voicemail':
                remapFk(data[idx], 'voicemailUser', 'target');
                break;
            case 'number':
                data[idx].target =
                    data[idx].numberCountry
                    + ' '
                    + data[idx].numbervalue;
                break;
            case 'friend':
                data[idx].target = data[idx].friendvalue;
                break;
            case 'queue':
                remapFk(data[idx], 'queue', 'target');
                break;
            case 'conferenceRoom':
                remapFk(data[idx], 'conferenceRoom', 'target');
                break;
            case 'extension':
                remapFk(data[idx], 'extension', 'target');
                break;
            default:
                console.error('Unkown route type:', data[idx].routetype);
                data[idx].target = '';
                break;
        }

        delete data[idx].user;
        delete data[idx].ivr;
        delete data[idx].huntGroup;
        delete data[idx].voicemailUser;
        delete data[idx].numbervalue;
        delete data[idx].friendvalue;
        delete data[idx].queue;
        delete data[idx].conferenceRoom;
        delete data[idx].extension;
    }

    return data;
}

export default foreignKeyResolver;