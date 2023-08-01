const express = require('express');
const app = express();
const mongoose = require('mongoose');
// const devuser = require('./devusermodel');



// Replace 'my-database' with the name of your MongoDB database
const uri = 'mongodb://127.0.0.1:27017/c1';

mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error.message);
  });

  app.get('/', (req, res) => {
    return res.send('Received a GET HTTP method');
  })

  app.post('register', async (req, res) => {
    try{
        const {name, email, password} = req.body;
    }
    catch(err){
        console.log(err);
        return res.status(500).send("Internal Server Error")
    }
  })


app.listen(5000, ()=> console.log('Server is running on port 5000'));