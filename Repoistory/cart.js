const mysql_Pool = require('../Resources/db').mysql_Pool;

exports.displayAllItems = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `SELECT cart.cartID, cart.productID, cart.Quantity,
           products.product_name, products.product_imgSrc, products.product_price, product_vendors
    FROM cart
    INNER JOIN products ON cart.productID = products.productID`;
        console.log(sqlQuery);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                return reject(new Error(err));
            }
            else {
                con.query(sqlQuery, (err, result) => {
                    con.release();
                    if (err) {
                        return reject(new Error(err));
                    }
                    else {
                        return resolve({ result: result });
                    }
                });
            }
        });
    });
}

exports.displayCart = (productId) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `SELECT * FROM cart WHERE productID=?;`;
        console.log(sqlQuery);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                return reject(new Error(err));
            }
            else {
                con.query(sqlQuery, [productId], (err, result) => {
                    con.release();
                    if (err) {
                        return reject(new Error(err));
                    }
                    else {
                        return resolve({ result: result });
                    }
                });
            }
        });
    });
}

exports.newItem = (productid, quantity) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `INSERT INTO cart (productID, quantity) VALUES (?, ?);`;
        const values = [productid, quantity];
        console.log(sqlQuery);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                return reject(new Error(err));
            }
            else {
                con.query(sqlQuery, values, (err, result) => {
                    con.release();
                    if (err) {
                        return reject(new Error(err));
                    }
                    else {
                        return resolve({ result: result });
                    }
                });
            }
        });
    });
}

exports.updateItem = (productid, quantity) => {
    return new Promise((resolve, reject) => {
      if (!productid || quantity < 1) {
        return reject(new Error("Invalid productID or quantity"));
      }
      const sqlQuery = `UPDATE cart SET Quantity = ? WHERE productID = ?;`;
      mysql_Pool.getConnection((err, con) => {
        if (err) {
          console.error("Database connection error:", err);
          return reject(new Error("Database connection failed"));
        }
        con.query(sqlQuery, [quantity, productid], (err, result) => { 
          con.release();
          if (err) {
            console.error("Query error:", err);
            return reject(new Error("Failed to update cart item"));
          } else if (result.affectedRows === 0) {
            return reject(new Error("Product not found in cart"));
          } else {
            return resolve({ message: "Cart updated successfully", result });
          }
        });
      });
    });
  };  

exports.removeItem = (cartId) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `DELETE FROM cart WHERE cartID=?;`;
        console.log("Executing Query:", sqlQuery, "with ID:", cartId);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                console.error("Database connection error:", err);
                return reject(new Error("Database connection failed"));
            }
            con.query(sqlQuery, [cartId], (err, result) => {
                con.release();
                if (err) {
                    console.error("Query error:", err);
                    return reject(new Error("Failed to remove item"));
                }
                resolve(result);
            });
        });
    });
};

exports.removeAllItems = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `DELETE FROM cart;`; 
        console.log("Executing Query:", sqlQuery);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                console.error("Database connection error:", err);
                return reject(new Error("Database connection failed"));
            }
            con.query(sqlQuery, (err, result) => {
                con.release();
                if (err) {
                    console.error("Query error:", err);
                    return reject(new Error("Failed to clear cart"));
                }
                resolve(result);
            });
        });
    });
};

