<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/8
 * Time: 18:31
 */
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//选择的是系统头像或修改基本信息
if(!empty($_POST) && isset($_SESSION['code']) && isset($_SESSION['role']) && $_SESSION['role'] > 1){
    $arr = array();
    //被修改资料的设计师
    $email = $_POST['email'];
    if(isset($_POST['password'])){
        $arr['password'] = $_POST['password'];
    }

    if(isset($_POST['img'])){
        $arr['img'] = $_POST['img'];
    }
    if(isset($_POST['nickname'])){
        $arr['nickname'] = $_POST['nickname'];
    }
    if(isset($_POST['intro'])){
        $arr['intro'] = $_POST['intro'];
    }

    $result = $mysql->update('designermessage',$arr,"email='$email'",$conn);
    if($result){
        echo json_encode(array('status'=>1,'msg'=>"修改成功",'url'=>'adminDesiList.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>"修改失败"));
    }
    exit();
}
?>