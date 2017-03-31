<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/31
 * Time: 14:37
 */
//关注的设计师翻页
//连接数据库
require_once ('./../connect.php');
//smarty配置文件
require_once('./../config.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_GET)){
    $curEamil = $_GET['curEmail'];
    if(empty($_SESSION) || !isset($_SESSION['email']) || $curEamil != $_SESSION['email']){
        echo json_encode(array('status'=>0,'msg'=>'前往登录','url'=>'signup.php'));
        exit();
    }
    $page = $_GET['nextPage'];
    //每一页显示6个
    $num = 9;
    $start = ($page-1)*$num;
    $email = $_SESSION['email'];
    $sql = "select img,designermessage.email,nickname from  focus,designermessage where  focus.email='$email' and focus.beEmail=designermessage.email order by focus desc,beEmail desc limit ".$start.",9";
    $query = $mysql->query($sql,$conn);
    $data = $mysql->findAll($query);
    echo json_encode(array('status'=>1,'msg'=>'成功','data'=>$data));
}else{
    echo json_encode(array('status'=>0,'msg'=>'出错','url'=>'index.php'));
}