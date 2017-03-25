<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/25
 * Time: 8:43
 */
//删除活动
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
//移动图片的文件
require_once ('./../common/upload.func.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['code']) && !empty($_GET)){
    if($_SESSION['role'] < 2){
        echo json_encode(array('status'=>0,'msg'=>'你不具备删除活动的权限！','url'=>'limit.php'));
    }else{
        $activeCode = $_GET['activeCode'];
        //从活动表中删除这个活动
        $mysql->del('activemessage',"activeCode='$activeCode'",$conn);
        //从作品表中删除这个活动的作品
        $mysql->del('productionmessage',"activeCode='$activeCode'",$conn);
        echo json_encode(array('status'=>1,'msg'=>'删除成功'));
    }
}else{
    echo json_encode(array('status'=>0,'msg'=>'你还没有登录，请登录！','url'=>'adminSignup.php'));
}