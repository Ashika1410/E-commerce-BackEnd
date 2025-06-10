const wishlistRepo = require('../Repoistory/wishlist');

exports.getAllItems = async (req, res) => {
    try {
        const wishlist = await wishlistRepo.displayAllItems();
        res.status(200).json(wishlist);
    } catch (err) {
        console.error("Error in displaying all orders", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.getWishlist = async (req, res) => {
    try {
        const { id } = req.params;
        const products = await wishlistRepo.displayWishlist(id);
        res.status(200).json(products);
    } catch (err) {
        console.error("Error in displaying product:", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message,
        });
    }
};

exports.postItem = async (req, res) => {
    const { productid } = req.body;
    console.log(req.body);
    try {
        const wishlist = await wishlistRepo.newItem(productid);
        res.status(200).json(wishlist);
    } catch (err) {
        console.error("Cannot adding new product into orders", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.putItem = async (req, res) => {
    try {
        const { productid } = req.params;
        console.log("Full Request Params:", req.params);
        console.log("Received request:", { productid });

        if (!productid) {
            return res.status(400).json({ error: "Product ID is required" });
        }

        const wishlist = await wishlistRepo.updateItem(productid);
        res.status(200).json(wishlist);
    } catch (err) {
        console.error("Error in updating wishlist:", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.deleteItem = async (req, res) => {
    try {
        const { id } = req.params;
        if (!id || isNaN(id)) {
            return res.status(400).json({ error: "Invalid wishlist ID" });
        }
        const result = await wishlistRepo.removeItems(id);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: "Item not found" });
        }
        res.status(200).json({ message: "Item removed successfully", result });
    } catch (err) {
        console.error("Error in deleting product from wishlist:", err);
        res.status(500).json({ error: "Server error", details: err.message });
    }
};

exports.deleteAllItems = async (req, res) => {
    try {
        const result = await cartRepo.removeAllItem();
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: "Wishlist is already empty" });
        }
        res.status(200).json({ message: "All items removed from Wishlist", result });
    } catch (err) {
        console.error("Error in clearing wishlist products:", err);
        res.status(500).json({ error: "Server error", details: err.message });
    }
}; 