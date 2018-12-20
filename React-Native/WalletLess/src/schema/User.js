export default class User {
    // Any functions to manipulate or view the data
}

User.schema = {
    name: 'User',
    primaryKey: 'id',
    properties: {
        id: 'int',
        email: {type: 'string', default: ''},
        password: {type: 'string', default: ''},
        dateCreated: {type: 'date?'},
        lastLogin: {type: 'date?'},
    }
}