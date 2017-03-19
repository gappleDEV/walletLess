/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/19/2017
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO MESSAGES TABLE IN WALLETLESSDB
*/

var express = require('express'),
    router = express.Router(),
    messages = require('../models/messages.js'); //reference to messages function models in models directory

//router.get for both sender and receiver columns, getting all columns from db (select *)

//router.post for creating/sending of new messages
//need to figure out some way of creating unique mesage ids for each message, maybe just increment an integer?

//router.put for updating is_read column

//router.delete
//might have to get message_id first? not relaly sure

module.exports = router;
