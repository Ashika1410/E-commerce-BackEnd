const express = require('express');
const categoryController = require('../Controller/categoryController');
const router = express.Router();

    router.get('/',categoryController.getAllCategories);
    router.get('/:id',categoryController.getCategory);
    router.post('/newcategory',categoryController.postCategory);
    router.put('/:id',categoryController.putCategory);
    router.delete('/:id',categoryController.deleteCategory);

module.exports=router; 