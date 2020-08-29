const express=require("express");
var router=express.Router();
var query=require("./query");
const pool = require("../pool");
router.get("/v1",(req,res)=>{
  let lid=req.query.lid;
  let sql="SELECT cid,title,subtitle,remind,spec,price,pic FROM `kml_cake_detail` where cid=?";
  pool.query(sql,[lid],(err,result)=>{
    if(err) throw err;
    res.send({message:'查询成功',code:1,result:result})
  })
})
module.exports=router;
//http://localhost:3000/details/v1?lid=3