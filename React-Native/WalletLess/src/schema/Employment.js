
export default class Employment {
    // Any functions to manipulate or view the data
}

Employment.schema = {
    name: 'Employment',
    primaryKey: 'id',
    properties: {
        id: 'int',
        employerName: {type: 'string', default: ''},
        employerAddress: {type: 'string', default: ''},
        employerPhone: {type: 'string', default: ''},
        employeePosition: {type: 'string', default: ''},
    }
}