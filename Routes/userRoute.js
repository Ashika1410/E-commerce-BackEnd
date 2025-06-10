const express = require('express');
const userController = require('../Controller/userController')
const router = express.Router();

    router.get('/',userController.getAllUser);
    router.get('/:id',userController.getUser)
    router.post('/newuser',userController.postUser);
    router.post('/check',userController.postLogin);
    router.put('/:id/password',userController.putUserPassword);
    router.put('/:id/details',userController.putUserDetails);
    router.delete('/:id',userController.deleteUser);

module.exports=router;   