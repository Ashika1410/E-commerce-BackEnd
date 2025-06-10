const express = require('express');
const productController = require('../Controller/productController');
const router = express.Router();


router.get('/allproducts', productController.getAllProducts);
router.get('/:id', productController.getProduct);
router.get('/category/:categoryID', productController.getProductCategory);
router.post('/newproduct', productController.postProduct);
router.put('/:id', productController.putProduct);
router.delete('/:id', productController.deleteProduct);

module.exports = router;