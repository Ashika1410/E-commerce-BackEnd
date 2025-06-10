const productRepo = require('../Repoistory/products')

exports.getAllProducts = async (req, res) => {
    try {
        const products = await productRepo.displayAllProducts();
        res.status(200).json(products);
    } catch (err) {
        console.error("Error in displaying all products", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};
 
exports.getProduct = async (req, res) => {
    try {
      const { id } = req.params; 
      const products = await productRepo.displayProduct(id); 
      res.status(200).json(products);
    } catch (err) {
      console.error("Error in displaying product:", err);
      res.status(400).json({
        errorcode: 400,
        errormessage: err.message,
      });
    }
  };

exports.getProductCategory = async (req, res) => {
    try {
        const { categoryID } = req.params; 
        if (!categoryID) {
            return res.status(400).json({
                errorcode: 400,
                errormessage: "categoryID is required"
            });
        }

        const products = await productRepo.displayProductCategory(categoryID);
        res.status(200).json(products);
    } catch (err) {
        console.error("Error in displaying product category:", err);
        res.status(500).json({
            errorcode: 500,
            errormessage: "Internal Server Error" 
        });
    }
};

exports.postProduct = async (req, res) => {
    const { name, imageSrc, price, description, vendors, category } = req.body;
    console.log('body value', req.body)
    try {
        const products = await productRepo.newProduct(name, imageSrc, price, description, vendors, category);
        res.status(200).json(products);
    } catch (err) {
        console.error("Error in inserting new products", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.putProduct = async (req, res) => {
    try {
        const products = await productRepo.updateProduct();
        res.status(200).json(products);
    } catch (err) {
        console.error("Error in updating products", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.deleteProduct = async (req, res) => {
    try {
        const products = await productRepo.removeProduct();
        res.status(200).json(products);
    } catch (err) {
        console.error("Error in deleting products", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};