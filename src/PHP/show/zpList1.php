<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/21
 * Time: 15:33
 */
//设计师个人中心
//引入smarty配置文件
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//如果当前有一个设计师账号登录
if(isset($_SESSION['email'])){
    $email = $_SESSION['email'];
    //这个设计师审核未通过的作品列表
    $sql = "select *  from productionmessage where email='$email' and status='1' order by time desc";
    $query = $mysql->query($sql,$conn);
    $zpList = $mysql->findAll($query);
    $zpNum = count($zpList);
    //这个设计师被关注的数量
    $sql = "select * from focus where beEmail='$email'";
    $query = $mysql->query($sql,$conn);
    $focusNum = mysqli_num_rows($query);
    //这个设计师关注的设计师
    $sql = "select img,designermessage.email,nickname from  focus,designermessage where  focus.email='$email' and focus.beEmail=designermessage.email";
    $query = $mysql->query($sql,$conn);
    $focusList = $mysql->findAll($query);
    //该设计师未读的消息
    $sql = "select * from note where email='$email'or email='all' and status=0";
    $query = $mysql->query($sql,$conn);
    $noteNum = mysqli_num_rows($query);
    //这个设计师的头像
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $message = $mysql->findOne($query);
    $arrMessage = array();
    if($message['nickname']){
        $arrMessage['name'] = $message['nickname'];
    }else{
        $arrMessage['name'] = $email;
    }
    $arrMessage['intro'] = $message['intro'];
    $arrMessage['img'] = $message['img'];
    $smarty->assign('isLog',true);
    $smarty->assign('message',$arrMessage);
    $smarty->assign('zpNum',$zpNum);
    $smarty->assign('zpList',$zpList);
    $smarty->assign('noteNum',$noteNum);
    $smarty->assign('focusNum',$focusNum);
    $smarty->assign('focusList',$focusList);
    $smarty->display('zpList1.tpl');
}
//如果当前没有设计师账号登录
else{
    $smarty->display('signup.tpl');
}
?>