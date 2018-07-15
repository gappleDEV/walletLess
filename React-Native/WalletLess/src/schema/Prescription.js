
export default class Prescription {
    // Any functions to manipulate or view the data
}

Prescription.schema = {
    name: 'Prescription',
    primaryKey: 'id',
    properties: {
        id: 'int',
        pharmacyName: {type: 'string', default: ''},
        pharmacyAddress: {type: 'string', default: ''},
        dateOfPrescription: {type: 'date?'},
        prescriptionNumber: {type: 'string', default: ''},
        strength: {type: 'string', default: ''},
        quantity: {type: 'string', default: ''},
        orderingPhysician: {type: 'string', default: ''},
        refillsRemaining: {type: 'string', default: ''}
    }
}