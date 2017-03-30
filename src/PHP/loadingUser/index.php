<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/30
 * Time: 14:37
 */
//加载用户
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
    if($_GET['role'] === 'admin'){
        if(empty($_SESSION) || !isset($_SESSION['code'])){
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
            exit();
        }
        if($_SESSION['role'] < 2){
            echo json_encode(array('status'=>0,'msg'=>"不具备权限",'url'=>'limit.php'));
            exit();
        }
        $curEmail = null;
        $page = $_GET['page'] - 1;
        $num = 40;
        $start = $page*$num;
        if($table === 'designermessage'){
            $sql = "select * from ".$table." order by focus desc,email asc limit ".$start.",40";
        }else{
            $sql = "select adminmessage.code,adminmessage.password,adminmessage.time,role.info from adminmessage,role where adminmessage.role < 3 and adminmessage.role = role.code limit ".$start.",40";
        }
    }else{
        if(!empty($_SESSION) &&isset($_SESSION['email'])){
            $curEmail = $_SESSION['email'];
        }else{
            $curEmail = null;
        }
        $page = $_GET['page'] - 1;
        $num = 24;
        $start = $page*$num;
        $sql = "select * from ".$table." order by focus desc,email asc limit ".$start.",24";
    }
    $query = $mysql->query($sql,$conn);
    $data = $mysql->findAll($query);
    echo json_encode(array('status'=>1,'msg'=>"成功",'curEmail'=>$curEmail,'data'=>$data));

}else{
    echo json_encode(array('status'=>0,'msg'=>"发生错误",'url'=>'index.php'));
}