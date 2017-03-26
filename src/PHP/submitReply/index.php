<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/26
 * Time: 10:49
 */
//评价
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && !empty($_POST) && isset($_SESSION['email'])){
    $email = $_SESSION['email'];
    $zpCode = $_POST['zpCode'];
    $content = $_POST['content'];
    $toContent = $_POST['toContent'];
    $toEmail = $_POST['toEmail'];
    $time  = date('Y-m-d');
    //将这个作品的评价数量+1
    $sql = "update productionmessage set discussNum=discussNum+1 where zpCode = '$zpCode'";
    mysqli_query($conn,$sql);
    $result = $mysql->insert('discuss',array('email'=>$email,'toEmail'=>$toEmail,'content'=>$content,'toContent'=>$toContent,'time'=>$time,'zpCode'=>$zpCode),$conn);
    if($result){
        echo json_encode(array('status'=>1,'msg'=>'评价成功'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'评价失败'));
    }
}else{
    echo json_encode( array('status'=>0,'msg'=>'未登录','url'=>'signup.php') );
}