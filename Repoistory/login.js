// const mysql_Pool = require('../Resources/db').mysql_Pool;

// exports.displayAllLogin = () => {
//     return new Promise((resolve, reject) => {
//         const sqlQuery = `SELECT * FROM login`;
//         console.log(sqlQuery);
//         mysql_Pool.getConnection((err, con) => {
//             if (err) {
//                 return reject(new Error(err));
//             }
//             else {
//                 con.query(sqlQuery, (err, result) => {
//                     con.release();
//                     if (err) {
//                         return reject(new Error(err));
//                     }
//                     else {
//                         return resolve({ result: result });
//                     }
//                 })
//             }
//         })
//     })
// };

// exports.displayLogin = () => {
//     return new Promise((resolve, reject) => {
//         const sqlQuery = `SELECT login.loginID, login.userID, users.username, users.password
//                             FROM login
//                             INNER JOIN users ON login.userID = users.userID WHERE userID = ?;`;
//         console.log(sqlQuery);
//         mysql_Pool.getConnection((err, con) => {
//             if (err) {
//                 return reject(new Error(err));
//             }
//             else {
//                 con.query(sqlQuery, (err, result) => {
//                     con.release();
//                     if (err) {
//                         return reject(new Error(err));
//                     }
//                     else {
//                         return resolve({ result: result });
//                     }
//                 })
//             }
//         })

//     })
// };

// exports.addNewLogin = (userID, loginMethod) => {
//     return new Promise((resolve, reject) => {
//         const sqlQuery = `INSERT INTO login (userID, login_method, login_time) VALUES (?, ?, NOW())`;
//         const values = [userID, loginMethod];
//         console.log('SQL Query:', sqlQuery);
//         console.log('Values:', values);
//         mysql_Pool.getConnection((err, con) => {
//             if (err) {
//                 return reject(new Error(err));
//             } else {
//                 con.query(sqlQuery, [userID, loginMethod], (err, result) => {
//                     con.release();
//                     if (err) {
//                         return reject(new Error(err));
//                     } else {
//                         return resolve({ result: result });
//                     }
//                 });
//             }
//         });
//     });
// };

// // exports.updateLogin = () => {
// //     return new Promise((resolve, reject) => {
// //         const sqlQuery = ``;
// //         console.log(sqlQuery);

// //     })
// // };

// // exports.updatePassword = () => {
// //     return new Promise((resolve, reject) => {
// //         const sqlQuery = ``;
// //         console.log(sqlQuery);

// //     })
// // };

// // exports.removeAccount = () => { 
// //     return new Promise((resolve, reject) => {
// //         const sqlQuery = ``;
// //         console.log(sqlQuery);

// //     })
// // };