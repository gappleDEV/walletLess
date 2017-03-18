/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/18/2017
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO USER_INFO TABLE IN WALLETLESSDB
*/

var express = require('express'),
    router = express.Router(),
    user_info = require('../models/user_info'); //reference to user_info models in models folder

//get route to get info from user_info table
router.get('/:id', function(req, res, next){
  //should only be getting by id, we dont want to get all from user_info table
  user_info.getUserInfo(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

router.post('/', function(req, res, next){
  user_info.addUserInfo(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

router.put('/:id', function(req, res, next){
  user_info.updateUserInfo(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

router.delete('/:id', function(req, res, next){
  user_info.deleteUserInfo(req.params.id, function(err, count){
    if(err){res.json(err);}
    else{res.json(count);}
  });
});

//export routes for use in app.js
module.exports = router;
