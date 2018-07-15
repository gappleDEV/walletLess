
export default class Bank {
    // Any functions to manipulate or view the data
}

Bank.schema = {
    name: 'Bank',
    primaryKey: 'id',
    properties: {
        id: 'int',
        checkingAccountNum: {type: 'string', default: ''},
        checkingAccountMICRNum: {type: 'string', default: ''}, 
        checkingAccountBalance: {type: 'string', default: ''},
        checkingAccountStatement: {type: 'string', default: ''},

        savingsAccountNum: {type: 'string', default: ''},
        savingsAccountBalance: {type: 'string', default: ''},
        savingsAccountStatement: {type: 'string', default: ''}
    }
}