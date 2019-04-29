
export default class Personal {
    // Any functions to manipulate or view the data
}

Personal.schema = {
    name: 'Personal',
    primaryKey: 'id',
    properties: {
        id: 'int',
        firstName: {type: 'string', default: ''},
        lastName: {type: 'string', default: ''},
        socialSecurityNumber: {type: 'string', default: ''},
        socialInsuranceNumber: {type: 'string', default: ''},
        streetAddress: {type: 'string', default: ''},
        city: {type: 'string', default: ''},
        county: {type: 'string', default: ''},
        state: {type: 'string', default: ''},
        zipCode: {type: 'string', default: ''},
        province: {type: 'string', default: ''},
        country: {type: 'string', default: ''},
        sex: {type: 'string', default: ''},
        maritalStatus: {type: 'string', default: ''},
        dateOfBirth: {type: 'date?'},
        race: {type: 'string', default: ''},
        religion: {type: 'string', default: ''},
        primaryLanguage: {type: 'string', default: ''},
        homePhone: {type: 'string', default: ''},
        cellPhone: {type: 'string', default: ''},
        workPhone: {type: 'string', default: ''},

        primaryCarePhysicianName: {type: 'string', default: ''},
        primaryCarePhysicianAddress: {type: 'string', default: ''},
        primaryCarePhysicianPhone: {type: 'string', default: ''},

        nextOfKinFirstName: {type: 'string', default: ''},
        nextOfKinLastName: {type: 'string', default: ''},
        nextOfKinRelationship: {type: 'string', default: ''},
        nextOfKinCellPhone: {type: 'string', default: ''},
        nextOfKinHomePhone: {type: 'string', default: ''},

        emergencyContact: {type: 'string', default: ''}, //next of kin or other
        emergencyContactFirstName: {type: 'string', default: ''}, //if not next of kin -> the following is required
        emergencyContactLastName: {type: 'string', default: ''},
        emergencyContactAddress: {type: 'string', default: ''},
        emergencyContactPhone: {type: 'string', default: ''},
        emergencyContactRelationship: {type: 'string', default: ''},

        guarantor: {type: 'string', default: ''}, //next of kin or other
        guarantorFirstName: {type: 'string', default: ''}, //if not next of kin -> the following is required
        guarantorLastName: {type: 'string', default: ''},
        guarantorAddress: {type: 'string', default: ''},
        guarantorPhone: {type: 'string', default: ''},
        guarantorSSN: {type: 'string', default: ''},
        guarantorDateOfBirth: {type: 'date?'},
        guarantorRelationship: {type: 'string', default: ''}
    }
}