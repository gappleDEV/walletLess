
export default class GeneralInsurance {
    // Any functions to manipulate or view the data
}

GeneralInsurance.schema = {
    name: 'GeneralInsurance',
    primaryKey: 'id',
    properties: {
        id: 'int',        
        generalInsurance: {type: 'string', default: ''}, //primary, secondary, tertiary
        generalCompanyName: {type: 'string', default: ''},
        generalCompanyAddress: {type: 'string', default: ''},
        generalCompanyPhone: {type: 'string', default: ''},
        generalCompanyCardFront: {type: 'string', default: ''},
        generalCompanyCardBack: {type: 'string', default: ''},
    }
}