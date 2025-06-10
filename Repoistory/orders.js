const mysql_Pool = require('../Resources/db').mysql_Pool;

exports.displayAllOrders = () => {
    return new Promise((resolve, reject) => {
        // const sqlQuery1 = `SELECT * FROM orders;`
        const sqlQuery2 = `SELECT orders.orderID, orders.orderQuantity, orders.orderQuantity, orders.deliveryDate, users.username, users.PhoneNumber, users.Email, users.Address
        FROM orders
        INNER JOIN users
        ON orders.userID = users.userID;`
        // const sqlQuery3 = `SELECT orders.orderID, products.product_name, products.product_imgSrc, products.product_price, products.product_vendors, products.product_description, orders.orderQuantity, orders.orderDate
        // FROM orders
        // INNER JOIN products
        // ON orders.productID = products.productID;` ;
        // console.log(sqlQuery1);
        console.log(sqlQuery2);
        // console.log(sqlQuery3);
        mysql_Pool.getConnection((err, con) => {
            if (err) {
                return reject(new Error(err));
            }
            else {
                con.query(sqlQuery2, (err, result) => {
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

exports.displayOrder = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `SELECT * FROM orders WHERE orderID=?;`;
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

exports.newOrders = ({ quantity, total, orderdate, deliverydate, uid, pid, paymethod }) => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `INSERT INTO orders (orderQuantity, orderTotal, orderDate, deliveryDate, userID, productID, payment_method)  VALUES (?, ?, ?, ?, ?, ?, ?);`;
        const values = [quantity, total, orderdate, deliverydate, uid, pid, paymethod];
        console.log(sqlQuery);
        console.log(values);
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

exports.updateOrder = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `UPDATE orders SET item_count=1, Date_of_order='2024-08-01', Date_of_delivery='2024-08-09' WHERE orderID=23423;`;
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

exports.removeOrder = () => {
    return new Promise((resolve, reject) => {
        const sqlQuery = `DELETE FROM orders WHERE orderID=20021;`;
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