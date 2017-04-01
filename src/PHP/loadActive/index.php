<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/29
 * Time: 14:09
 */
//加载活动
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
if(!empty($_GET)){
    $table = $_GET['table'];
    $page = $_GET['page'] - 1;
    //每一页显示8条
    $num = 8;
    $role = 0;
    $start = $page*$num;
    if($_GET['role'] === 'admin'){
        if(!empty($_SESSION) && isset($_SESSION['code'])){
            $role = $_SESSION['role'];
        }else{
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
            exit();
        }
    }
    $content = $_GET['search'];
    $sql = "select * from ".$table." where title like '".$content."' order by status desc,eTime asc limit ".$start.",8";
    $query = $mysql->query($sql,$conn);
    $actives = $mysql->findAll($query);
    echo json_encode(array('status'=>1,'msg'=>"搜索成功",'data'=>$actives,'role'=>$role,'length'=>count($actives)));
}else{
    echo json_encode(array('status'=>0,'msg'=>"发生错误",'url'=>'index.php'));
}