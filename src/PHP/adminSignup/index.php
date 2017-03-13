<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/7
 * Time: 14:30
 */
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
if(!empty($_POST) && isset($_POST['code']) && isset($_POST['password'])){
    $code = $_POST['code'];
    $password = $_POST['password'];
    //判断账号是否存在
    $sql = "select * from adminmessage where code='$code'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        $sql = "select * from adminmessage where code ='$code' and password='$password'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        if($num){
            session_start();
            $row = $mysql->findOne($query);
            $_SESSION['code'] = $row['code'];
            $_SESSION['role'] = $row['role'];
            echo json_encode(array('status'=>1,'msg'=>'登录成功'));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'登录密码错误'));
        }
    }else{
        echo json_encode(array('status'=>0,'msg'=>'该账户不存在'));
    }
}
?>
