/* AUTHOR: MATTHEW AQUILES
** WALLETLESS LLC
** DATE LAST EDITED: 3/1/2017
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO USERS TABLE IN WALLETLESSDB
*/

var express = require('express'),
    router  = express.Router(),
    users = require('../models/users'); //reference to models in order to use functions defined

//get by id from users table
//if there is an id get only that id, if there is not get all data in table
router.get('/:id?', function(req, res, next){
  if(req.params.id){
    users.getUsersById(req.params.id, function(err, rows){
      if(err){res.json(err);}
      else{res.json(rows);}
    });
  }
  else{
    users.getAllUsers(function(err, rows){
      if(err){res.json(err);}
      else{res.json(rows);}
    });
  }
});

//post call to add user to users table
router.post('/', function(req, res, next){
  users.addUser(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//delete call to delete data from users table by id
router.delete('/:id', function(req, res, next){
  users.deleteUser(req.params.id, function(err, count){
  if(err){res.json(err);}
  else{res.json(count);}
  });
});

//put call to update data in users table by id
router.put('/:id', function(req, res, next){
  users.updateUser(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//export routes for use in app.js
module.exports = router;
