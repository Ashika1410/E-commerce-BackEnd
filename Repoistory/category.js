const mysql_Pool = require('../Resources/db').mysql_Pool;

exports.getAllCategory = () => {
  return new Promise((resolve, reject) => {
    let sqlQuery = `SELECT * FROM category;`;
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

exports.getCategory = () => {
  return new Promise((resolve, reject) => {
    let sqlQuery = `SELECT * FROM category WHERE categoryID=2;`;
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

exports.newCategory = (category, description, img) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `INSERT INTO category (category_name, category_description, category_imgSrc) VALUES (?, ?, ?);`;
    const values = [category, description, img];
    console.log(sqlQuery);
    console.log("Sql:", sqlQuery);
    console.log("Values", values);

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

exports.putCategory = (req, res) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `UPDATE category SET category_name='Ornaments' WHERE categoryID=202`;
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

exports.deleteCategory = (req, res) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `DELETE FROM category WHERE categoryID=206;`;
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