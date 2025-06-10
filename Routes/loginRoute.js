const express = require('express');
const loginController = require('../Controller/loginController')
const router = express.Router();

    router.get('/',loginController.getAllLogin);
    router.get('/:id',loginController.getLogin);
    router.post('/newlogin',loginController.postLogin);
    router.put('/:id',loginController.putUser);
    router.put('/password',loginController.putPassword);
    router.delete('/logout',loginController.deleteAccount);

module.exports = router; 