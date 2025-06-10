const mysql_Pool = require('../Resources/db').mysql_Pool;
const bcrypt = require('bcrypt');

exports.displayAllUsers = () => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `SELECT * FROM users;`;
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

// exports.displayUsername = (username) => {
//   return new Promise((resolve, reject) => {
//     const sqlQuery = `SELECT * FROM users WHERE username = ?;`;
//     console.log(`Executing Query: ${sqlQuery}`);

//     mysql_Pool.getConnection((err, con) => {
//       if (err) {
//         return reject(new Error("Database connection failed"));
//       } else {
//         con.query(sqlQuery, [username], (err, result) => {
//           con.release();
//           if (err) {
//             return reject(new Error("Error in fetching user data"));
//           } else {
//             return resolve(result.length > 0 ? result[0] : null);
//           }
//         });
//       }
//     });
//   });
// };

// exports.displayPhoneno = (phoneno) => {
//   return new Promise((resolve, reject) => {
//     const sqlQuery = `SELECT * FROM users WHERE PhoneNumber = ?;`;
//     console.log(`Executing Query: ${sqlQuery}`);

//     mysql_Pool.getConnection((err, con) => {
//       if (err) {
//         return reject(new Error("Database connection failed"));
//       } else {
//         con.query(sqlQuery, [phoneno], (err, result) => {
//           con.release();
//           if (err) {
//             return reject(new Error("Error in fetching user data"));
//           } else {
//             return resolve(result.length > 0 ? result[0] : null);
//           }
//         });
//       }
//     });
//   });
// };

// exports.displayEmail = (email) => {
//   return new Promise((resolve, reject) => {
//     const sqlQuery = `SELECT * FROM users WHERE Email = ?;`;
//     console.log(`Executing Query: ${sqlQuery}`);

//     mysql_Pool.getConnection((err, con) => {
//       if (err) {
//         return reject(new Error("Database connection failed"));
//       } else {
//         con.query(sqlQuery, [email], (err, result) => {
//           con.release();
//           if (err) {
//             return reject(new Error("Error in fetching user data"));
//           } else {
//             return resolve(result.length > 0 ? result[0] : null);
//           }
//         });
//       }
//     });
//   });
// };

exports.createUser = (uname, fname, lname, email, hashedPassword, phoneno, address) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `INSERT INTO users (username, FirstName, LastName, Email, Password, PhoneNumber, Address) VALUES (?, ?, ?, ?, ?, ?, ?);`;
    const values = [uname, fname, lname, email, hashedPassword, phoneno, address];
    console.log('SQL Query:', sqlQuery);
    console.log('Values:', values);
    mysql_Pool.getConnection((err, con) => {
      if (err) {
        return reject(new Error("Connection error"));
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

exports.verifyLogin = (uname, phoneno, email, password) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `SELECT * FROM users WHERE username = ? OR PhoneNumber = ? OR Email = ?`;
    const values = [uname, phoneno, email];
    mysql_Pool.getConnection((err, con) => {
      if (err) return reject(new Error("Connection error"));
      con.query(sqlQuery, values, async (err, result) => {
        con.release();
        if (err) return reject(new Error(err));
        if (result.length === 0) {
          return resolve(null);
        }
        const user = result[0];
        const isMatch = await bcrypt.compare(password, user.Password);
        if (!isMatch) return resolve(null);
        return resolve({ result });
      });
    });
  });
};

exports.updateUser = (hashedPassword) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `UPDATE users WHERE userId=? `;
    const value = [hashedPassword];
    console.log(sqlQuery);
    mysql_Pool.getConnection((err, con) => {
      if (err) {
        return reject(new Error(err));
      } else {
        con.query(sqlQuery, value, (err, result) => {
          con.release();
          if (err) {
            return reject(new Error(err));
          } else {
            return resolve({ result: result });
          }
        });
      }
    });
  });
};

exports.removeUser = (id) => {
  return new Promise((resolve, reject) => {
    const sqlQuery = `DELETE FROM users WHERE userID=?;`;
    console.log(sqlQuery);
    mysql_Pool.getConnection((err, con) => {
      if (err) {
        return reject(new Error(err));
      }
      else {
        con.query(sqlQuery, [id], (err, result) => {
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
