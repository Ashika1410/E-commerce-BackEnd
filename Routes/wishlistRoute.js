const express = require('express');
const wishlistController = require('../Controller/wishlistController');
const router = express.Router();

    router.get('/all',wishlistController.getAllItems);
    router.get('/:id',wishlistController.getWishlist);
    router.post('/add',wishlistController.postItem);
    router.put('/:id',wishlistController.putItem);
    router.delete('/:id',wishlistController.deleteItem);
    router.delete('/all',wishlistController.deleteAllItems);

module.exports=router;    