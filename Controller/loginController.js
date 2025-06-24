// const bcrypt = require('bcrypt');
// const loginRepo = require('../Repoistory/login');

// exports.getAllLogin = async (req, res) => {
//     try {
//         const login = await loginRepo.displayAllLogin();
//         res.status(200).json(login);
//     } catch (err) {
//         console.error('Error in displaying all User:', err);
//         res.status(400).json({
//             errorcode: 400,
//             errormessage: err.message
//         });
//     }
// };

// exports.getLogin = async (req, res) => {
//     try {
//         const { userID } = req.params;
//         if (!userID) {
//             return res.status(400).json({ error: "User ID is required" });
//         }

//         const user = await loginRepo.displayLogin(userID);
//         if (!user) {
//             return res.status(404).json({ error: "User not found" });
//         }

//         res.status(200).json(user);
//     } catch (err) {
//         console.error("Error in getting particular User:", err);
//         res.status(400).json({
//             errorcode: 400,
//             errormessage: err.message
//         });
//     }
// };

// exports.postLogin = async (req, res) => {
//     try {
//         const { uname, email, password, phoneno } = req.body;

//         if (!password || (!uname && !email && !phoneno)) {
//             return res.status(400).json({
//                 errorcode: 400,
//                 errormessage: "Missing required fields",
//                 missingFields: {
//                     uname: !uname,
//                     email: !email,
//                     password: !password,
//                     phoneno: !phoneno
//                 }
//             });
//         }

//         const saltRounds = 10;
//         const hashedPassword = await bcrypt.hash(password, saltRounds);

//         const result = await loginRepo.addNewLogin(uname || email || phoneno, hashedPassword);

//         res.status(201).json({
//             message: "New Login added successfully",
//             note: "Password stored in encrypted form",
//             result
//         });

//     } catch (err) {
//         console.error("Error in postUser:", err);
//         res.status(500).json({
//             errorcode: 500,
//             errormessage: "An error occurred",
//             error: err.message
//         });
//     }
// };

// exports.putUser = async (req, res) => {
//     try {

//     } catch (err) {

//     }
// };

// exports.putPassword = async (req, res) => {
//     try {

//     } catch (err) {

//     }
// };

// exports.deleteAccount = async (req, res) => {
//     try {

//     } catch (err) {

//     }
// };