var express = require('express'),
    router  = express.Router(),
    users = require('../models/users');

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

router.post('/', function(req, res, next){
  users.addUser(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

router.delete('/:id', function(req, res, next){
  users.deleteUser(req.params.id, function(err, count){
  if(err){res.json(err);}
  else{res.json(count);}
  });
});

router.put('/:id', function(req, res, next){
  users.updateUser(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

module.exports = router;
