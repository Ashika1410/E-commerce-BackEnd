const mysql_Pool = require('../Resources/db').mysql_Pool;

exports.displayAllItems = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `SELECT wishlist.wishlistID, wishlist.productID,
           products.product_name, products.product_imgSrc, products.product_price, product_vendors
    FROM wishlist
    INNER JOIN products ON wishlist.productID = products.productID`;
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

exports.displayWishlist = (productId) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `SELECT * FROM wishlist WHERE productID=?;`;
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

exports.newItem = (productid) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `INSERT INTO wishlist (productID) VALUES (?);`;
        const values = [productid];
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

exports.updateItem = (productid) => {
    return new Promise((resolve, reject) => {
        if (!productid) {
            return reject(new Error("Invalid productID"));
        }
        const sqlQuery = `UPDATE wishlist WHERE productID = ?;`;
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                return reject(new Error(err));
            } else {
                con.query(sqlQuery, [productid], (err, result) => {
                    con.release();
                    if (err) {
                        return reject(new Error(err));
                    } else if (result.affectedRows === 0) {
                        return reject(new Error("Product not found in cart"));
                    } else {
                        return resolve({ message: "wishlist updated successfully", result });
                    }
                });
            }
        });
    });
};

exports.removeItems = (wishlistId) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `DELETE FROM wishlist WHERE wishlistID=?;`;
        console.log("Executing Query:", sqlQuery, "with ID:", wishlistId);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                console.error("Database connection error:", err);
                return reject(new Error("Database connection failed"));
            }
            con.query(sqlQuery, [wishlistId], (err, result) => {
                con.release();
                if (err) {
                    console.error("Query error:", err);
                    return reject(new Error("Failed to remove item"));
                }
                resolve(result);
            });
        });
    });
}

exports.removeAllItem = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `DELETE FROM wishlist;`; 
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
}