<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/8
 * Time: 9:37
 */
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
if(!empty($_POST) && isset($_POST['password']) && isset($_POST['email'])){
    $email = $_POST['email'];
    $password = $_POST['password'];
    $role = 0;
    //判断这个邮箱是否存在
    $sql = "select * from designermessage where email = '$email'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    //如此不存在
    if(!$num){
        //获取默认图像
        $sql = "select img from headimg";
        $query = $mysql->query($sql,$conn);
        $row = $mysql->findOne($query);
        $time = date('Y-m-d');
        $arr = array('email'=>$email,'password'=>$password,'role'=>$role,'img'=>$row['img'],'hasQuestion'=>'0','focus'=>0,'time'=>$time);
        $insertresult = $mysql->insert('designermessage',$arr,$conn);
        if($insertresult){
            echo json_encode(array('status'=>1,'msg'=>'注册成功','role'=>$role));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'注册失败'));
        }

    }else{
        echo json_encode(array('status'=>0,'msg'=>'这个邮箱已经被注册'));
        exit();
    }

}
?>