
export default class HealthcareInsurance {
    // Any functions to manipulate or view the data
}

HealthcareInsurance.schema = {
    name: 'HealthcareInsurance',
    primaryKey: 'id',
    properties: {
        id: 'int',
        healthcareInsurance: {type: 'string', default: ''}, //primary, secondary, tertiary
        healthcareCompanyName: {type: 'string', default: ''},
        healthcareCompanyAddress: {type: 'string', default: ''},
        healthcareCompanyPhone: {type: 'string', default: ''},
        healthcareCompanySubscriberID: {type: 'string', default: ''},
        healthcareCompanyGroupID: {type: 'string', default: ''},
        healthcareCompanyClaimAddress: {type: 'string', default: ''},
        healthcareCompanyCardFront: {type: 'string', default: ''},
        healthcareCompanyCardBack: {type: 'string', default: ''},
        healthcareCompanyEffectiveDate: {type: 'date?'},
        healthcareCompanyClaimNumber: {type: 'string', default: ''},
        healthcareCompanyClaimDateOfService: {type: 'date?'}
    }
}