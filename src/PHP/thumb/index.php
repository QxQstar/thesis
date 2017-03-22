<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/22
 * Time: 14:33
 */
//点赞或取消点赞
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['email']) && isset($_POST)){
    $zpCode = $_POST['zpCode'];
    $email = $_SESSION['email'];
    $control = $_POST['control'];
    //点赞
    if($control){
        //更新这个作品的被点赞量
        $sql = "update productionmessage set likeNum=likeNum+1 where zpCode = '$zpCode'";
        mysqli_query($conn,$sql);
        //在点赞表里插入一条新数据
        $result = $mysql->insert('good',array('zpCode'=>$zpCode,'email'=>$email),$conn);
        //获得这个作品的点赞数
        $sql = "select likeNum from productionmessage where zpCode='$zpCode'";
        $query = $mysql->query($sql,$conn);
        $num = $mysql->findOne($query);
        if($result){
            echo json_encode(array('status'=>1,'msg'=>'点赞成功','data'=>$num['likeNum']));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'点赞失败'));
        }
    }
    //取消点赞
    else{
        //更新这个作品的被点赞量
        $sql = "update productionmessage set likeNum=likeNum-1 where zpCode = '$zpCode'";
        mysqli_query($conn,$sql);
        //从点赞表中删除一条数据
        $result = $mysql->del('good',"zpCode='$zpCode' and email='$email'",$conn);
        //获得这个作品的点赞数
        $sql = "select likeNum from productionmessage where zpCode='$zpCode'";
        $query = $mysql->query($sql,$conn);
        $num = $mysql->findOne($query);
        if(!$result){
            echo json_encode(array('status'=>1,'msg'=>'取消点赞成功','data'=>$num['likeNum']));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'取消点赞失败'));
        }
    }
}else{
    echo json_encode(array('status'=>0,'msg'=>'没有登录','url'=>'signup.php'));
}