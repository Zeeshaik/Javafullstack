const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
    service : 'gmail',
    auth : {user : '',  pass: ''}
});

const mailOptions = {
    from : 'jeeshan21245a0530@grietcollege.com',
    to : 'zeeshaik1431@gmail.com',
    subject : 'Sending Email using Node.js',
    text : 'That was easy!'
};

transporter.sendMail(mailOptions, (error, info) => {
    if(error) console.log(error);
    else console.log('Email sent : ' + info.response);
});

// const url = require('url');
// const address = 'http://localhost:3000/default.html?year=2023&month=aug';
// const q = url.parse(address, true);
// console.log(q.host); //returns 'localhost:3000'
// console.log(q.pathname); //returns '/default.html'
// console.log(q.search); //returns '?year=2017&month=february'


// const http = require('http'); // In old versions we use var instrad of const, because const is a new feature in ES6
// const fs = require('fs');
// http.createServer((req, res) => {

//     fs.unlink('test.txt', (err) => {
//         if (err) {
//             res.writeHead(500, { 'Content-Type': 'text/plain' });
//             res.end('Error deleting file');
//         } else {
//             res.writeHead(200, { 'Content-Type': 'text/plain' });
//             res.end('File deleted successfully');
//         }
//     });

//     fs.appendFile('test.txt', 'Hello World\n', (err) => {
//         if (err) throw err;
//         console.log('Saved!');
//     });

//     fs.readFile('test.txt', (err, data) => {
//         res.write(data);
//         // console.log("Server is running on port 3000");
//         res.end();
//     })
// }).listen(3000);




//Working with file system...