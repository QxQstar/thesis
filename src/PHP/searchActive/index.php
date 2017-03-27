<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/27
 * Time: 19:17
 */
//搜索活动
//连接数据库
require_once ('./../connect.php');
//smarty配置文件
require_once('./../config.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_GET)){
    $status = $_GET['status'];
    $content = $_GET['content'];
    $role = 0;
    //后台搜索活动
    if($status == 'admin'){
        //判断管理员是否登录
        if(empty($_SESSION['code'])){
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
            exit();
        }
        $role = $_SESSION['role'];
    }
    $sql = "select * from activemessage where title like '".$content."' order by status desc,eTime asc";
    $query = $mysql->query($sql,$conn);
    $actives = $mysql->findAll($query);
    echo json_encode(array('status'=>1,'msg'=>"搜索成功",'data'=>$actives,'role'=>$role,'length'=>count($actives)));
}else{
    echo json_encode(array('status'=>0,'msg'=>"发生错误",'url'=>'index.php'));
}