const mysql_Pool = require('../Resources/db').mysql_Pool;
const mysql = require('mysql');

exports.displayAllProducts = () => {
  return new Promise((resolve, reject) => {
    let sqlQuery = `SELECT * FROM products;`;
    console.log("Executing Query:", sqlQuery);

    mysql_Pool.getConnection((err, con) => {
      if (err) {
        console.error("Database Connection Error:", err);
        return reject(err);  // 🔹 Directly reject without wrapping in `Error`
      }

      con.query(sqlQuery, (err, results) => {
        con.release();  // Always release the connection

        if (err) {
          console.error("Query Execution Error:", err);
          return reject(err);
        }

        console.log("Query Results:", results);
        return resolve(results); // 🔹 Return results directly
      });
    });
  });
};

exports.displayProduct = (productId) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `SELECT * FROM products WHERE productID = ?`; 

    mysql_Pool.getConnection((err, con) => {
      if (err) {
        return reject(new Error(err.message));
      }

      con.query(sqlQuery, [productId], (err, result) => { 
        con.release();  
        if (err) {
          return reject(new Error(err.message));
        }
        resolve({ result });
      });
    });
  });
};

exports.displayProductCategory = (categoryID) => {
  return new Promise((resolve, reject) => {
    let sqlQuery = `SELECT * FROM products WHERE categoryID = ?`;

    mysql_Pool.getConnection((err, con) => {
      if (err) {
        console.error("Database connection error:", err);
        return reject(new Error("Database connection failed"));
      }

      con.query(sqlQuery, [categoryID], (err, result) => {
        con.release();
        if (err) {
          console.error("Error in SQL Query:", err);
          return reject(new Error("Error fetching product categories"));
        } else {
          return resolve({ result: result });
        }
      });
    });
  });
};

exports.newProduct = (name, imageSrc, price, description, vendors, category) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `INSERT INTO products (product_name, product_imgSrc, product_price, product_description, product_vendors, categoryID) VALUES (?, ?, ?, ?, ?, ?);`;
    const values = [name, imageSrc, price, description, vendors, category];
    console.log(sqlQuery);
    console.log('SQL:', sqlQuery);
    console.log('Values:', values);

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
};

exports.updateProduct = (req, res) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `UPDATE products product_name="Potraites" WHERE productID=4`;
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
};

exports.removeProduct = (req, res) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `DELETE FROM products WHERE productID=106;`;
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
};
