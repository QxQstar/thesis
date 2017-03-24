<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/24
 * Time: 8:47
 */
//删除作品
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
/**
 * @param $zpCode 要删除的作品的编号
 * @param $mysql 数据库操作对象
 * @param $conn 数据库连接标识
 * @param $role 标识删除作品的角色，是设计师还是管理员
 */
function deteleZP($zpCode,$mysql,$conn,$role){
    //获得这个作品的状态和所属活动
    $sql = "select status,activeCode,email from productionmessage where zpCode='$zpCode'";
    $query = $mysql->query($sql,$conn);
    $zpMess = $mysql->findOne($query);
    if($zpMess){
        //如果是设计师在删除作品，设计师只能删除自己的作品
        if($role =='desi' && $_SESSION['email'] != $zpMess['email']){
            echo json_encode(array('status'=>0,'msg'=>'设计师只能删除自己的作品','url'=>'limit.php'));
            exit();
        }
        if($zpMess['status'] != '2'){
            $mysql->del('productionmessage',"zpCode='$zpCode'",$conn);
            echo json_encode(array('status'=>1,'msg'=>'删除成功'));
            exit();
        }else{
            //如果这个作品是一个活动作品,将这个活动的作品数-1；
            $activeCode = $zpMess['activeCode'];
            $sql = "select activeCode from activemessage where activeCode='$activeCode'";
            $query = $mysql->query($sql,$conn);
            if(mysqli_num_rows($query) > 0){
                $activeCode = $zpMess['activeCode'];
                $sql = "update activemessage set zpNum=zpNum-1 where activeCode = '$activeCode'";
                mysqli_query($conn,$sql);
            }
            $mysql->del('productionmessage',"zpCode='$zpCode'",$conn);
            echo json_encode(array('status'=>1,'msg'=>'删除成功'));
            exit();
        }
    }
}
//判断是否有管理员或者设计师登录
if(!empty($_SESSION) && (isset($_SESSION['email']) || isset($_SESSION['code'])) && !empty($_GET)){
    $role = $_GET['role'];
    $zpCode = $_GET['zpCode'];
    if($role == 'admin' && isset($_SESSION['code'])){
        if($_SESSION['role'] < 2){
            echo json_encode(array('status'=>0,'msg'=>'不具备权限','url'=>'limit.php'));
        }else{
            deteleZP($zpCode,$mysql,$conn,$role);
        }
    }
    if($role == 'desi' && isset($_SESSION['email'])){
        deteleZP($zpCode,$mysql,$conn,$role);
    }
}else{
    if(!empty($_GET) && $_GET['role'] == 'desi'){
        echo json_encode(array('status'=>0,'msg'=>'未登录','url'=>'signup.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'未登录','url'=>'adminSignup.php'));
    }
}