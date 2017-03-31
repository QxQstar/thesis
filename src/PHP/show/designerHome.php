<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/21
 * Time: 14:36
 */
//设计师主页
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_GET) && isset($_GET['email'])){
    if(isset($_GET['role']) && !isset($_SESSION['code'])){
        $smarty->display('adminSignup.tpl');
        exit();
    }
    if(isset($_GET['role'])){
        $smarty->assign('admin',true);
        $smarty->assign('role',$_SESSION['role']);
        $smarty->assign('isLog',true);
    }else{
        $smarty->assign('admin',false);
        if(isset($_SESSION['email'])){
            $smarty->assign('isLog',true);
        }else{
            $smarty->assign('isLog',false);
        }
    }
    $email = $_GET['email'];
    //获得这个设计师的信息
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $desigerMess = $mysql->findOne($query);
    //获得这个设计师已经上线的作品数量和作品信息
    $sql = "select * from productionmessage where email='$email' and status='2' order by likeNum desc,discussNum desc,time desc";
    $query=$mysql->query($sql,$conn);
    $zpNum = mysqli_num_rows($query);
    //最多分多少页
    $maxpage = ceil($zpNum/6);
    if($zpNum > 0){
        $zpMessage = $mysql->findAll($query);
        $zpMessage = array_slice($zpMessage,0,6);
    }else{
        $zpMessage = array();
    }

    //得到这个设计师的粉丝
    $sql = "select * from focus where beEmail='$email'";
    $query=$mysql->query($sql,$conn);
    $fenNum = mysqli_num_rows($query);
    if($desigerMess['nickname']){
        $desigerMess['name'] = $desigerMess['nickname'];
    }else{
        $desigerMess['name'] = $email;
    }
    $smarty->assign('desigerMess',$desigerMess);

    $smarty->assign('zpNum',$zpNum);
    $smarty->assign('maxpage',$maxpage);
    $smarty->assign('zpMessage',$zpMessage);
    $smarty->assign('fenNum',$fenNum);
    $smarty->display('desiginerHome.tpl');
}else{

}