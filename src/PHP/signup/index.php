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
if(!empty($_POST) && isset($_POST['email']) && isset($_POST['password'])){
    $email = $_POST['email'];
    $password = $_POST['password'];
    //判断账号是否存在
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        $sql = "select * from designermessage where email ='$email' and password='$password'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        if($num){
            session_start();
            $row = $mysql->findOne($query);
            $_SESSION['email'] = $row['email'];
//            $_SESSION['role'] = $row['role'];
            $_SESSION['nickname'] = $row['nickname'];
            echo json_encode(array('status'=>1,'msg'=>'登录成功'));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'登录密码错误'));
        }
    }else{
        echo json_encode(array('status'=>0,'msg'=>'该账户不存在'));
    }
}
?>
