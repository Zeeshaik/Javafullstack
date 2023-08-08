const express = require('express');
const app = express();
const path = require('path');
app.use(express.urlencoded({ extended: true })); // Add this line for parsing form data
app.use(express.json());  
app.use(express.static(path.join(__dirname, 'public')));  
app.get('/', (req, res) => {
    // res.send('Hello World');
    res.json('Hello world!');
}); 

const products=[
    {id:1, name:"oppo"},
    {id:2, name:"mi"},
    {id:3, name:"realme"},
    {id:4, name:"iphone"},
    {id:5, name:"xiaomi"}
]

app.get('/products', (req, res) => {
    return res.send(products);
})

app.get('/products/:id', (req, res) => {
    // const newData = products.filter(item => item.id === parseInt(req.params.id));
    const newData = products.filter(item => item.id.toString() === req.params.id);
    return res.send(newData);
})

app.post('/addProduct', (req, res) => {
    const { name } = req.body;

    if (!name) {
         return res.status(400).send('Product name is required');
        
    }

    const newProductId = products.length + 1;
    const newProduct = { id: newProductId, name: name };
    products.push(newProduct);

    return res.send(products);
});

app.delete('/deleteProduct/:id', (req, res) => {
    const productId = parseInt(req.params.id);

    // Find the index of the product to be deleted
    const productIndex = products.findIndex(product => product.id === productId);

    if (productIndex !== -1) {
        // Remove the product from the array
        products.splice(productIndex, 1);
        return res.send(products);
    } else {
        return res.status(404).send('Product not found');
    }
});

app.put('/updateProduct/:id', (req, res) => {
    const productId = parseInt(req.params.id);

    // Find the index of the product to be updated
    const productIndex = products.findIndex(product => product.id === productId);

    if (productIndex !== -1) {
        // Update the product information
        products[productIndex].name = req.body.name;
        return res.send(products);
    } else {
        return res.status(404).send('Product not found');
    }
});

app.listen(4000, () => console.log('Listening on port 4000...'));