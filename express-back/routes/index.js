const crypto = require('crypto');
const WXBizDataCrypt = require('../WXBizDataCrypt')

const request = require('request')

var express = require('express');
var router = express.Router();
var db = require("../util/mysql"); //引入数据库封装模块
var dbConfig = require('../util/db.config'); 
const { Router } = require('express');



// new1
// router.get('/new', function(req,res){
//   db.query("SELECT * FROM NEW",[],function(results){
   
//     res.send(results);

//   })
// })
// new2 列表
router.get('/new', function(req,res){
  db.query("SELECT * FROM NEW2",[],function(results){
   
    res.send(results);

  })
})

// 根据id查询
router.get('/newbyid', function(req,res){
  // console.log(req.query.id);
  db.query("SELECT * FROM NEW2 WHERE ID = ?",[req.query.id],function(results){
   
    res.send(results);

  })
})

// 购物车
router.get('/cart', function(req,res){
  db.query("SELECT * FROM CART,NEW2 WHERE CART.N_ID=NEW2.ID  ",[],function(results){
   
    res.send(results);

  })
})
// 增
router.get('/cartadd', function(req,res){
  const sqlParams = [req.query.id,req.query.id,'true',req.query.nums];
  // console.log(req);
  db.add("insert into cart(id,n_id,selected,nums) values(?,?,?,?)" ,sqlParams,function(err,results){
   if(err){
     res.send({err:'1',mes:'增加失败'})
   }
    res.send(results,{err:'0',mes:'增加成功'});

  })
})

// 删
router.get('/cartdelete', function(req,res){
  const sqlParams = [req.query.id];
  // console.log(req);
  db.add("DELETE FROM cart WHERE id = ? ",sqlParams,function(err,results){
   if(err){
     res.send({err:'1',mes:'删除失败'})
   }
    res.send(results,{err:'0',mes:'删除成功'});

  })
})


router.get('/hot', function(req,res){
  db.query("SELECT * FROM HOT,GOODS WHERE HOT.HOT_ID=GOODS.HOT_ID ",[],function(results){
    res.send(results);

  })
})
// router.get('/category', function(req,res){
//   db.query("SELECT * FROM CATEGORY",[],function(results){
//   //  for(let i;i<=results.length;i++ ){
//   // }
//   let id = results.length
//   res.send(id);
//     // res.send(results[]);

//   })
// })

// 登录
const wx = {
  appid: 'wxda8a6325f7ea5b9e',
  secret: '9a813edb2a04d21bc3c85cfee18193c8'
}

var db2 = {
  session: {},
  user: {}
}
router.post('/login', (req, res) => {
  // 注意：小程序端的appid必须使用真实账号，如果使用测试账号，会出现login code错误
  console.log('login code: ' + req.body.code)
  var url = 'https://api.weixin.qq.com/sns/jscode2session?appid=' + wx.appid + '&secret=' + wx.secret + '&js_code=' + req.body.code + '&grant_type=authorization_code'
  request(url, (err, response, body) => {
      console.log('session: ' + body)
      var session = JSON.parse(body)
      if(session.openid) {
          var token = 'token_' + new Date().getTime()
          db2.session[token] = session
          // if(!db2.user[session.openid]) {
          //     db2.user[session.openid] = {
          //         credit: 100
          //     }
          // }
      }
      res.json({
          token: token
      })
  })
})
router.get('/checklogin', (req, res) => {
  var session = db2.session[req.query.token]
  console.log('checklogin: ', session)
  // 将用户是否已经登录的布尔值返回给客户端
  res.json({
      is_login: session !== undefined
  })
})
router.post('/userinfo', (req, res) => {
  // 获取session值
  var session = db2.session[req.query.token]
  console.log('session:' + session)
  if(session) {
      // 使用appid和session_key解密encryptedData
      var pc = new WXBizDataCrypt(wx.appid, session.session_key)
      var data = pc.decryptData(req.body.encryptedData, req.body.iv)
      // console.log('解密后：', data)
      // 校验rawData是否正确通过
      var sha1 = crypto.createHash('sha1')
      sha1.update(req.body.rawData + session.session_key)
      var signature2 = sha1.digest('hex')
      // console.log(signature2)
      // console.log(req.body.signature)
      res.json({
          pass: signature2 === req.body.signature
      })
  } else {
      res.json({
          err: '用户不存在，或未登录。'
      })
  }
})


module.exports = router;