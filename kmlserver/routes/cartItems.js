var express=require("express");
var router=express.Router();
var pool=require("../pool");
var qs=require('qs');
var query=require("./query");

router.post("/v1/add",(req,res)=>{
  let str=qs.stringify(req.body);
  let obj=qs.parse(str);
  let arr=obj.cartItem;
  // console.log(res.body,typeof(res.body))
  // console.log(str,typeof(str));
  console.log(arr,typeof(arr));
  // 待完成
  // arr.forEach(function(key){
  //    console.log(key,typeof(key),obj[key]);
  // });
  arr.forEach(item => {
    let uid=item.uid;
    let cid=item.cid;
    let count=item.count;
    console.log(uid,cid,count)
    let sql="select * from kml_shoppingcart_item where  user_id=? and product_id=?";
    query(sql,[uid,cid])
    .then(result=>{
      console.log(result);
      if(result.length==0){
        let sql="insert into kml_shoppingcart_item values(null,?,?,?,0)";
        pool.query(sql,[uid,cid,count],(err,result)=>{
          if(err) throw err;
          // res.send({message:'提交成功',code:200});
        })
      }else{
        let sql="update kml_shoppingcart_item set count=count+? where product_id=? and user_id=?";
        pool.query(sql,[count,cid,uid],(err,result)=>{
          if(err) throw err;
          // res.send({message:'更新成功',code:200});
        })
      }
      res.send({message:'提交成功',code:200});
    })
  });
  
})




// router.get("/v1/delete",(req,res)=>{
//   let pid=req.query.pid;
//   console.log(pid)
//   var sql="delete from kml_shoppingcart_item where product_id=?";
//   pool.query(sql,[pid],(err,result)=>{
//     if(err) throw err;
//     res.send();
//   })
// })


module.exports=router;