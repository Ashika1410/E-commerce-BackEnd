const bcrypt = require('bcrypt');
const userRepo = require('../Repoistory/users');

exports.getAllUser = async (req, res) => {
    try {
        const users = await userRepo.displayAllUsers();
        res.status(200).json(users);
    } catch (err) {
        console.error('Error in displaying all User:', err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.getUser = async (req, res) => {
    try {
        const { userID } = req.params;
        if (!userID) {
            return res.status(400).json({ error: "User ID is required" });
        }

        const user = await userRepo.displayUser(userID);
        if (!user) {
            return res.status(404).json({ error: "User not found" });
        }

        res.status(200).json(user);
    } catch (err) {
        console.error("Error in getting particular User:", err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};

exports.postUser = async (req, res) => {
    try {
        const { uname, fname, lname, email, password, phoneno, address } = req.body;
        if (!uname || !fname || !lname || !email || !password || !phoneno || !address) {
            return res.status(400).json({
                errorcode: 400,
                errormessage: "Missing required fields",
                missingFields: {
                    uname: !uname,
                    fname: !fname,
                    lname: !lname,
                    email: !email,
                    password: !password,     
                    phoneno: !phoneno,
                    address: !address
                }
            });
        }
        const saltRounds = 10;
        const hashedPassword = await bcrypt.hash(password, saltRounds);

        const result = await userRepo.createUser(uname, fname, lname, email, hashedPassword, phoneno, address);

        res.status(201).json({
            message: "New user added successfully",
            note: "Password stored in encrypted form",
            result
        });

    } catch (err) {
        console.error("Error in postUser:", err);
        res.status(500).json({
            errorcode: 500,
            errormessage: "An error occurred",
            error: err.message
        });
    }
};

// exports.postLogin = async (req, res) => {
//   try {
//     const { login_method, email, uname, phoneno, password } = req.body;
//     let user;
//     if (login_method === "email") {
//       user = await userRepo.displayEmail(email);
//     } else if (login_method === "uname") {
//       user = await userRepo.displayUsername(uname);
//     } else if (login_method === "phoneno") {
//       user = await userRepo.displayPhoneno(phoneno);
//     }
//     if (!user) {
//       return res.status(404).json({ errormessage: "User not found" });
//     }
//     const isMatch = await bcrypt.compare(password, user.Password);

//     if (!isMatch) {
//       return res.status(401).json({ errormessage: "Invalid password" });
//     }
//     res.status(200).json({ message: "Login successful", user });
//   } catch (err) {
//     console.error("Login error:", err);
//     res.status(500).json({ errormessage: "Internal server error", error: err.message });
//   }
// };

exports.postLogin = async (req, res) => {
    try {
        const { email, uname, phoneno, password } = req.body;
        const user = await userRepo.verifyLogin(uname, phoneno, email, password);
        if (!user || user.result.length === 0) {
            return res.status(404).json({ errormessage: "User not found or invalid credentials" });
        }
        res.status(200).json({ message: "Login successful", user: user.result[0] });
    } catch (err) {
        console.error("Login error:", err);
        res.status(500).json({ errormessage: "Internal server error", error: err.message });
    }
};

exports.putUserPassword = async (req, res) => {
    try {
        const { newpassword } = req.body;
        const saltRounds = 10;
        const salt = await bcrypt.genSalt(saltRounds);
        const hashedPassword = await bcrypt.hash(newpassword, salt);
        if (newpassword) {
            const result = await userRepo.updateUser(hashedPassword);
            return res.status(201).json({
                message: "password updated",
                result: result
            })
        }
    } catch (err) {
        console.error('Error in updating Password:', err);
        res.status(400).json({
            error: err.message
        });
    }
};

exports.putUserDetails = async (req, res) => {
    try {
        const user = await userRepo.updateUser();
        res.status(200).json({
            message: "Updated Successfully",
            result: user
        });
    } catch (err) {
        console.error('Error in updating User details:', err);
        res.status(400).json({
            error: err.message
        });
    }
};

exports.deleteUser = async (req, res) => {
    try {
        const users = await userRepo.removeUser();
        res.status(200).json(users);
    } catch (err) {
        console.error('Error in deleting User:', err);
        res.status(400).json({
            errorcode: 400,
            errormessage: err.message
        });
    }
};