
export default class MotorVehicleInsurance {
    // Any functions to manipulate or view the data
}

MotorVehicleInsurance.schema = {
    name: 'MotorVehicleInsurance',
    primaryKey: 'id',
    properties: {
        id: 'int',
        motorVehicleInsurance: {type: 'string', default: ''}, //primary, secondary, tertiary
        motorVehicleCompanyName: {type: 'string', default: ''},
        motorVehicleCompanyAddress: {type: 'string', default: ''},
        motorVehicleCompanyPhone: {type: 'string', default: ''},
        motorVehicleCompanyIdentificationNum: {type: 'string', default: ''},
        motorVehicleCompanyClaimNum: {type: 'string', default: ''},
        motorVehicleCompanyAccidentDate: {type: 'date?'},
        motorVehicleCompanyEffectiveDate: {type: 'date?'},
        motorVehicleCompanyLimitsOfLiability: {type: 'string', default: ''},
        motorVehicleCompanyLimitsOfPIP: {type: 'string', default: ''},
        motorVehicleCompanyPIPDocsToComplete: {type: 'string', default: ''},
        motorVehicleCompanyPrimary: {type: 'string', default: ''}, //auto or health
        motorVehicleCompanyCardFront: {type: 'string', default: ''},
        motorVehicleCompanyCardBack: {type: 'string', default: ''},
        motorVehicleCompanyInvestigationInfo: {type: 'string', default: ''},
        motorVehicleCompanyStatusOfClaim: {type: 'string', default: ''}
    }
}