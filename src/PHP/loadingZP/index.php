<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/30
 * Time: 12:20
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
    $status = $_GET['status'];
    $page = $_GET['page'] - 1;
    //每一页显示8条
    $num = 8;
    $role = 0;
    $start = $page*$num;
    $content = $_GET['search'];
    if($status === 'me2'){
        if(empty($_SESSION) || !isset($_SESSION['email'])){
            echo json_encode(array('status'=>0,'msg'=>"设计师没有登录",'url'=>'signup.php'));
            exit();
        }
        $email = $_SESSION['email'];
        $sql = "select *  from ".$table." where email='$email' and status='2' order by likeNum desc,time desc limit ".$start.",8";
    }elseif ($status === 'me0'){
        if(empty($_SESSION) || !isset($_SESSION['email'])){
            echo json_encode(array('status'=>0,'msg'=>"设计师没有登录",'url'=>'signup.php'));
            exit();
        }
        $email = $_SESSION['email'];
        $sql = "select *  from ".$table." where email='$email' and status='0' order by time desc limit ".$start.",8";
    }elseif ($status === 'me1'){
        if(empty($_SESSION) || !isset($_SESSION['email'])){
            echo json_encode(array('status'=>0,'msg'=>"设计师没有登录",'url'=>'signup.php'));
            exit();
        }
        $email = $_SESSION['email'];
        $sql = "select *  from ".$table."where status='1' order by time desc limit ".$start.",8";
    }elseif ($status === 'new'){
        $sql = "select *  from ".$table." where status='2' and title like '".$content."' order by time desc,likeNum desc limit ".$start.",8";
    }elseif ($status === 'hot'){
        $sql = "select *  from ".$table." where status='2' and title like '".$content."' order by likeNum desc,discussNum desc limit ".$start.",8";
    }elseif ($status === 'all'){
        if(empty($_SESSION) || !isset($_SESSION['code'])){
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
            exit();
        }
        $sql = "select *  from ".$table." where title like '".$content."' order by likeNum desc,time asc limit ".$start.",8";
        $role = $_SESSION['role'];
    }elseif ($status === '0'){
        if(empty($_SESSION) || !isset($_SESSION['code'])){
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
            exit();
        }
        $sql = "select *  from ".$table." where status='0' and title like '".$content."' order by time asc limit ".$start.",8";
        $role = $_SESSION['role'];
    }elseif ($status === '2'){
        if(empty($_SESSION) || !isset($_SESSION['code'])){
            echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
            exit();
        }
        $sql = "select *  from ".$table." where status='2' and title like '".$content."' order by likeNum desc ,time desc limit ".$start.",8";
        $role = $_SESSION['role'];
    }elseif ($status === 'home'){
        $email = $_GET['email'];
        if($_GET['role'] === 'admin'){
            if(empty($_SESSION) || !isset($_SESSION['code'])){
                echo json_encode(array('status'=>0,'msg'=>"管理员没有登录",'url'=>'adminSignup.php'));
                exit();
            }
        }
        $sql = "select *  from ".$table." where status='2' and email='".$email."' order by likeNum desc,discussNum desc,time desc limit ".$start.",8";
        $role = 0;
    }
    $query = $mysql->query($sql,$conn);
    $data = $mysql->findAll($query);
    echo json_encode(array('status'=>1,'msg'=>'成功','data'=>$data,'role'=>$role));
}else{
    echo json_encode(array('status'=>0,'msg'=>"发生错误",'url'=>'index.php'));
}