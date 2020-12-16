
const express = require('express')
const bodyParser = require('body-parser')
const path = require('path')

const app = express()
const router = require('./routes/index')

// localhost:3000/images/......
app.use(express.static(path.join(__dirname, 'public')))
app.use(bodyParser.json())
app.use(router)


app.listen(3000,function(){
    console.log('服务器已启动')
})