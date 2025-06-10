const cartRepo = require('../Repoistory/cart');

exports.getAllItems = async (req, res) => {
    try {
        const carts = await cartRepo.displayAllItems();
        res.status(200).json(carts);
    } catch (err) {
        console.error("Error in displaying all orders", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.getCart = async (req, res) => {
    try {
        const { id } = req.params;
        const products = await cartRepo.displayCart(id);
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
    const { productid, quantity } = req.body;
    console.log(req.body);
    try {
        const cart = await cartRepo.newItem(productid, quantity);
        res.status(200).json(cart);
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
        const { quantity } = req.body; 

        console.log("Received request:");
        console.log("Params:", req.params);
        console.log("Body:", req.body);

        if (!productid || !quantity) {  
            console.error("Missing required fields:", { productid, quantity });
            return res.status(400).json({ error: "Product ID and Quantity are required" });
        }

        const cart = await cartRepo.updateItem(productid, quantity);
        res.status(200).json(cart);
    } catch (err) {
        console.error("Error in updating cart item:", err);
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
            return res.status(400).json({ error: "Invalid cart ID" });
        }
        const result = await cartRepo.removeItem(id);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: "Item not found" });
        }
        res.status(200).json({ message: "Item removed successfully", result });
    } catch (err) {
        console.error("Error in deleting product from cart:", err);
        res.status(500).json({ error: "Server error", details: err.message });
    }
};

exports.deleteAllItems = async (req, res) => {
    try {
      const result = await cartRepo.removeAllItems();
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: "Cart is already empty" });
      }
      res.status(200).json({ message: "All items removed from cart", result });
    } catch (err) {
      console.error("Error in clearing cart products:", err);
      res.status(500).json({ error: "Server error", details: err.message });
    }
  };
  
