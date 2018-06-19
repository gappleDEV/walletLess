
export default class PersonalInformation {
    // Any functions to manipulate or view the data
}

PersonalInformation.schema = {
    name: 'PersonalInformation',
    primaryKey: 'id',
    properties: {
        id: 'int',
        firstName: {type: 'string', default: ''},
        middleName: {type: 'string', default: ''},
        lastName: {type: 'string', default: ''},
        streetAddress: {type: 'string', default: ''},
        city: {type: 'string', default: ''},
        state: {type: 'string', default: ''},
        zipCode: {type: 'string', default: ''},
        county: {type: 'string', default: ''},
        dateOfBirth: {type: 'date?'},
        socialSecurityNumber: {type: 'string', default: ''},
        maritalStatus: {type: 'string', default: ''},
        sex: {type: 'string', default: ''},
        race: {type: 'string', default: ''},
        denomination: {type: 'string', default: ''},
        preferredLanguage: {type: 'string', default: ''},
        homePhone: {type: 'string', default: ''},
        cellPhone: {type: 'string', default: ''},
        workPhone: {type: 'string', default: ''},
        employer: {type: 'string', default: ''},
        employerAddress: {type: 'string', default: ''},
        nextOfKinName: {type: 'string', default: ''},
        nextOfKinPhone: {type: 'string', default: ''},
        motherFirstName: {type: 'string', default: ''},
        motherMaidenName: {type: 'string', default: ''},
        primaryCarePhysicianName: {type: 'string', default: ''},
        primaryCarePhysicianPhone: {type: 'string', default: ''}
    }
}