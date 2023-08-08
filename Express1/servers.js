express = require('express');

const app = express();
app.use(express.json());

const products= [
    {id:1, name:'oppo'},
    {id:2, name:'mi'},
    {id:3, name:'realme'},
    {id:4, name:'iphone'},
    {id:5, name:'xiaomi'}
]

app.get('/', (req, res) => {
    return  res.send('Hello world!');
});



app.listen(3000, () => {console.log('Listening on port 3000...')});