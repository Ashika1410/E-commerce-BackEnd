const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const dotenv = require('dotenv');
dotenv.config(); 

const productRoute = require('./Routes/productRoute');
const categoryRoute = require('./Routes/categoryRoute');
const cartRoute = require('./Routes/cartRoute');
const wishlistRoute = require('./Routes/wishlistRoute');
const userRoute = require('./Routes/userRoute');
const orderRoute = require('./Routes/orderRoute');

const app = express();
app.use(express.static("dist"));
app.use(bodyParser.json());

app.use(cors());

app.use('/api/product', productRoute);
app.use('/api/category', categoryRoute);
app.use('/api/cart', cartRoute);
app.use('/api/wishlist', wishlistRoute);
app.use('/api/user', userRoute);
app.use('/api/order', orderRoute);

const PORT = 7702;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
