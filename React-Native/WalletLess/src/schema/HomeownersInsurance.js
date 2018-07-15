
export default class HomeownersInsurance {
    // Any functions to manipulate or view the data
}

HomeownersInsurance.schema = {
    name: 'HomeownersInsurance',
    primaryKey: 'id',
    properties: {
        id: 'int',
        homeownersInsurance: {type: 'string', default: ''}, //primary, secondary, tertiary
        homeownersCompanyName: {type: 'string', default: ''},
        homeownersCompanyAddress: {type: 'string', default: ''},
        homeownersCompanyPhone: {type: 'string', default: ''},
        homeownersClaimSubmission: {type: 'string', default: ''}
    }
}