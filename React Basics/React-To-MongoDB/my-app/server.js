const express = require('express');
const app = express();
const mongoose = require('mongoose');
const devuser=require('./devusermodel')
mongoose.connect("mongodb+srv://zeesh:zeesh@cluster0.6y8dgvf.mongodb.net/").then(
    () => console.log("DB Connected")
)

app.use(express.json())

app.get('/data',async (req,res) =>{
    
  try{
      const{fullname,email,mobile,skill,password,confirmpassword} = req.body;
      const exist = await devuser.find();
      return res.send(exist)
      
  }
  catch(err){
      console.log('Error');
      return res.status(500).send('Server Error')

  }
}
)

app.post('/register',async(req,res)=>{
    try{
    const{fullname,email,mobile,skill,password,confirmpassword}=req.body;
    const exist= await devuser.findOne({email});
    if(exist){
        return res.statusCode(400).send('user already exist')
    }
    if(password!=confirmpassword){
        return res.statusCode(403).send('Invalid Password')
    }

    let newUser=new devuser({
        fullname,email,skill,mobile,password,confirmpassword
    })
    newUser.save();
    return res.status(200).send('User Registered Sucessfully');
    }
    catch(err){
        console.log('err');
        return res.status(500).send('Server error')
    }
}
)

app.delete('/delete/:userId', async (req, res) => {
  try {
    const userId = req.params.userId;
    // Find and delete the user by ID
    await devuser.findByIdAndDelete(userId);
    // Return the updated list of users after deletion
    return res.json(await devuser.find());
  } catch (err) {
    console.log(err);
    return res.status(500).send('Server error');
  }
});


app.listen(5000,()=> console.log('Server Running'))