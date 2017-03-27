<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/27
 * Time: 16:11
 */
//搜索用户
//连接数据库
require_once ('./../connect.php');
//smarty配置文件
require_once('./../config.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_GET)){
    $table = $_GET['table'];
    $content = $_GET['content'];
    //如果是后台的搜索用户
    if($_GET['status'] === 'admin'){
        //判断是否有管理员登录
        if(isset($_SESSION['code'])){
            $isLog = true;
            $email = '';
            //判断登录的这个管理员的权限
            if($_SESSION['role'] < 2){
                echo json_encode(array('status'=>0,'msg'=>"不具备权限",'url'=>'limit.php'));
            }else {
                if ($table === 'adminmessage') {
                    $sql = "select adminmessage.code,adminmessage.password,adminmessage.time,role.info from " . $table . ",role where adminmessage.code like'" . $content . "' and adminmessage.role < 3 and adminmessage.role = role.code";
                } else {
                    $sql = "select * from " . $table . " where email like'" . $content . "' or nickname like '" . $content . "' order by focus desc,email asc ";
                }
            }
        }else{
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
        }
    }
    //搜索设计师
    else{
        if(isset($_SESSION['email'])){
            $isLog=true;
            $email = $_SESSION['email'];
        }else{
            $isLog = false;
            $email = '';
        }
        $sql = "select * from ".$table." where email like'".$content."' or nickname like '".$content."' order by focus desc,email asc ";
    }
    $query = $mysql->query($sql,$conn);
    $userList = $mysql->findAll($query);
    echo json_encode(array('status'=>1,'msg'=>'搜索成功','length'=>count($userList),'isLog'=>$isLog,'curEmail'=>$email,'data'=>$userList));
}else{
    echo json_encode(array('status'=>0,'msg'=>"发生错误",'url'=>'index.php'));
}