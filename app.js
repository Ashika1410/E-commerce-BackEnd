const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const productRoute = require('./Routes/productRoute');
const categoryRoute = require('./Routes/categoryRoute');
const cartRoute = require('./Routes/cartRoute');
const wishlistRoute = require('./Routes/wishlistRoute');
const userRoute = require('./Routes/userRoute');
const orderRoute = require('./Routes/orderRoute');
const loginRoute = require('./Routes/loginRoute');
// const paymentRoute = require('./Routes/paymentRoute');

const app = express();
app.use(express.static("dist"));
app.use(bodyParser.json());

// const allowedOrigins = [
//   'http://localhost:5174',
//   'https://e-commerce-back-e6zpxi0ru-ashika-ms-projects.vercel.app'
// ];

// app.use(cors({
//   origin: (origin, callback) => {
//     if (!origin || allowedOrigins.includes(origin)) {
//       callback(null, true);
//     } else {
//       callback(new Error('Not allowed by CORS'));
//     }
//   },
//   methods: ['GET', 'POST', 'PUT', 'DELETE'],
//   credentials: false
// }));

app.use(cors({
  origin: [`https://e-commerce-back-e6zpxi0ru-ashika-ms-projects.vercel.app`],
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
}));

app.use('/product', productRoute);
app.use('/category', categoryRoute);
app.use('/cart', cartRoute);
app.use('/wishlist', wishlistRoute);
app.use('/user', userRoute);
app.use('/order', orderRoute);
app.use('/login', loginRoute);
// app.use('/payment', paymentRoute);

app.listen(7702, () => {
    console.log('Project is running on port 7702');
});
