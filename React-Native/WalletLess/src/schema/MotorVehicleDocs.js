
export default class MotorVehicleDocs {
    // Any functions to manipulate or view the data
}

MotorVehicleDocs.schema = {
    name: 'MotorVehicleDocs',
    primaryKey: 'id',
    properties: {
        id: 'int',
        motorVehicleLicense: {type: 'string', default: ''}, //uri to pic
        motorVehicleRegistrationOne: {type: 'string', default: ''},
        motorVehicleRegistrationTwo: {type: 'string', default: ''},
        motorVehicleRegistrationThree: {type: 'string', default: ''}
    }
}