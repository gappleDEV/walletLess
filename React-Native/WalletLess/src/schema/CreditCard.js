
export default class CreditCard {
    // Any functions to manipulate or view the data
}

CreditCard.schema = {
    name: 'CreditCard',
    primaryKey: 'id',
    properties: {
        id: 'int',
        creditCardType: {type: 'string', default: ''}, //VISA, Mastercard, Amex, etc.
        creditCardNameOnCard: {type: 'string', default: ''}, 
        creditCardNum: {type: 'string', default: ''},
        creditCardExpireDate: {type: 'string', default: ''},
        creditCardSecurityCode: {type: 'string', default: ''},
        creditCardCurrentBalance: {type: 'string', default: ''},
        creditCardCreditAvailable: {type: 'string', default: ''},
        creditCardRewardPoints: {type: 'string', default: ''},
    }
}