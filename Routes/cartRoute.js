const express = require('express');
const cartController = require('../Controller/cartController');
const router = express.Router();

    router.get('/all',cartController.getAllItems);
    router.get('/:id',cartController.getCart);
    router.post('/add',cartController.postItem);
    router.put('/:id',cartController.putItem);
    router.delete('/:id',cartController.deleteItem);
    router.delete('/removeall',cartController.deleteAllItems);

module.exports=router;   