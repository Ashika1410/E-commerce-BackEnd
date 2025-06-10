const categoryRepo = require('../Repoistory/category');

exports.getAllCategories = async (req, res) => {
    try {
        const orders = await categoryRepo.getAllCategory();
        res.status(200).json(orders);
    } catch (err) {
        console.error("Error in displaying all category", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.getCategory = async (req, res) => {
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

exports.postCategory = async (req ,res) => {
    const {category, description, img} = req.body;
    console.log("body value:", req.body);
    
    try {
        const orders = await categoryRepo.newCategory(category, description, img);
        res.status(200).json(orders);
    } catch (err) {
        console.error("Error in inserting new category", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.putCategory = async (req, res) => {
    try {
        const orders = await categoryRepo.updateCategory();
        res.status(200).json(orders);
    } catch (err) {
        console.error("Error in updating category", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.deleteCategory = async (req, res) => {
    try {
        const orders = await categoryRepo.removeCategory();
        res.status(200).json(orders);
    } catch (err) {
        console.error("Error in deleting category", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};