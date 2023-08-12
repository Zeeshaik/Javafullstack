const express = require('express');
const mongoose = require('mongoose');
const BrandName = require('./model'); // Use uppercase convention for model names
const cors = require('cors');
const app = express();
app.use(cors());
mongoose.connect('mongodb+srv://zeeshaik:zeeshaik@cluster0.6y8dgvf.mongodb.net/', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => {
    console.log('Connected to MongoDB');
}).catch(err => {
    console.error('Error connecting to MongoDB:', err);
});

app.use(express.json());
app.use(express.static('public')); 

app.post('/addbrand', async (req, res) => {
    const { brandname } = req.body;
    try {
        const newData = new BrandName({ brandname }); // Use uppercase model name
        await newData.save();
        const brandList = await BrandName.find(); // Use uppercase model name
        return res.json(brandList);
    } catch (err) {
        console.error('Error:', err);
        return res.status(500).send('Server Error');
    }
});

app.get('/', async (req, res) => {
    console.log('Hello');
    return res.send('Hello');
});

app.get('/getbrand', async (req, res) => {
    try {
        const brandList = await BrandName.find(); // Use uppercase model name
        return res.json(brandList);
    } catch (err) {
        console.error('Error:', err);
        return res.status(500).send('Server Error');
    }
});

app.get('/getbrand/:id', async (req, res) => {
    try {
        const brand = await BrandName.findById(req.params.id); // Use uppercase model name
        return res.json(brand);
    } catch (err) {
        console.error('Error:', err);
        return res.status(500).send('Server Error');
    }
});

app.delete('/deletebrand/:id', async (req, res) => {
    try {
        const userId = req.params.id;
        // Find and delete the user by ID
        await BrandName.findByIdAndDelete(userId);
        // Return the updated list of users after deletion
        return res.json(await BrandName.find());
    } catch (err) {
        console.error('Error:', err);
        return res.status(500).send('Server Error');
    }
});

const port =  8080;
app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});
