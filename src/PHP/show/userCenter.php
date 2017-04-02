<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 10:38
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
    //这个设计师已经上线作品列表
    $sql = "select *  from productionmessage where email='$email' and status='2' order by likeNum desc,time desc";
    $query = $mysql->query($sql,$conn);
    $zpList = $mysql->findAll($query);
    //可以分多少页
    $maxpage = ceil(count($zpList)/8);
    $zpList = array_slice($zpList,0,8);
    $zpNum = count($zpList);
    //这个设计师被关注的数量
    $sql = "select * from focus where beEmail='$email'";
    $query = $mysql->query($sql,$conn);
    $focusNum = mysqli_num_rows($query);
    //这个设计师关注的设计师
    $sql = "select img,designermessage.email,nickname from  focus,designermessage where  focus.email='$email' and focus.beEmail=designermessage.email order by focus desc,beEmail desc";
    $query = $mysql->query($sql,$conn);
    $focusList = $mysql->findAll($query);
    //可以分多少页
    $focuspage  = ceil(count($focusList)/9);
    $focusList = array_slice($focusList,0,9);
    //该设计师未读的消息
    $sql = "select * from note where email='$email' and status=0";
    $query = $mysql->query($sql,$conn);
    $noteNum = mysqli_num_rows($query);
    //这个设计师的资料
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $message = $mysql->findOne($query);
    $arrMessage = array();
    if($message['nickname']){
        $arrMessage['name'] = $message['nickname'];
    }else{
        $arrMessage['name'] = $email;
    }
    if($message['hasQuestion'] == '1'){
        $smarty->assign('hasQues',1);
    }else{
        $smarty->assign('hasQues',0);
    }
    $arrMessage['intro'] = $message['intro'];
    $arrMessage['img'] = $message['img'];
    $arrMessage['email'] = $message['email'];
    $smarty->assign('isLog',true);
    $smarty->assign('message',$arrMessage);
    $smarty->assign('zpNum',$zpNum);
    $smarty->assign('zpList',$zpList);
    $smarty->assign('noteNum',$noteNum);
    $smarty->assign('focusNum',$focusNum);
    $smarty->assign('maxpage',$maxpage);
    $smarty->assign('focuspage',$focuspage);
    $smarty->assign('focusList',$focusList);
    $smarty->display('userCenter.tpl');
}
//如果当前没有设计师账号登录
else{
    $smarty->display('signup.tpl');
}
?>