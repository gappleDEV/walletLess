/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/19/2017
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO MESSAGES TABLE IN WALLETLESSDB
*/

var express = require('express'),
    router = express.Router(),
    messages = require('../models/messages.js'); //reference to messages function models in models directory

//router.get for both sender and receiver columns, getting all columns from db (select *)
router.get('/sender/:id', function(req, res, next){
  //should only be getting by id, we dont want to get all from user_info table
  messages.getMsgBySndr(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});
router.get('/receiver/:id', function(req, res, next){
  //should only be getting by id, we dont want to get all from user_info table
  messages.getMsgByRcvr(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//router.post for creating/sending of new messages
//need to figure out some way of creating unique mesage ids for each message, maybe just increment an integer?
router.post('/', function(req, res, next){
  messages.addMessage(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//router.put for updating is_read column
router.put('/:id', function(req, res, next){
  messages.updateIsRead(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//router.delete
//might have to get message_id first? not relaly sure
router.delete('/:id', function(req, res, next){
  messages.deleteMessage(req.params.id, function(err, count){
    if(err){res.json(err);}
    else{res.json(count);}
  });
});

module.exports = router;
