<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/19
 * Time: 10:23
 */
//前台作品详情
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_GET)){
    $code = $_GET['code'];
    //获得作品的信息
    $sql = "select * from productionmessage where zpCode='$code'";
    $query = $mysql->query($sql,$conn);
    $zpMessage = $mysql->findOne($query);
    $email = $zpMessage['email'];
    //这个设计师的其他作品
    $sql = "select * from productionmessage where email='$email'and zpCode != '$code'and status='2' limit 6";
    $query = $mysql->query($sql,$conn);
    $otherZP = $mysql->findAll($query);
    //这个设计师的信息
    $sql = "select * from designermessage where email='$email'";
    $query = $mysql->query($sql,$conn);
    $designMess = $mysql->findOne($query);
    if($designMess['nickname']){
        $designMess['name'] = $designMess['nickname'];
    }else{
        $designMess['name'] = $designMess['email'];
    }
    $smarty->assign('designMess',$designMess);
    $smarty->assign('zpMessage',$zpMessage);
    $smarty->assign('otherZP',$otherZP);
    if(isset($_GET['role'])){
        $smarty->assign('me',true);
    }else{
        $smarty->assign('me',false);
    }
    //判断设计师是否登录
    if(!empty($_SESSION) && isset($_SESSION['email'])){
        $smarty->assign('isLog',true);
        $email = $_SESSION['email'];
        $smarty->assign('curEmail',$email);
        //判断当前登录的设计师是否对这个作品进行的点赞
        $sql ="select id from good where email='$email'and zpCode='$code'";
        $query=$mysql->query($sql,$conn);
        if(mysqli_num_rows($query)){
            $smarty->assign('like',true);
        }else{
            $smarty->assign('like',false);
        }
        //判断当前登录的设计师是否关注了这个作品的设计师
        $zpAuthor = $zpMessage['email'];
        $sql ="select id from focus where email='$email'and beEmail='$zpAuthor'";
        $query=$mysql->query($sql,$conn);
        if(mysqli_num_rows($query)){
            $smarty->assign('focus',true);
        }else{
            $smarty->assign('focus',false);
        }
    }else{
        $smarty->assign('curEmail',false);
        $smarty->assign('isLog',false);
        $smarty->assign('like',false);
        $smarty->assign('focus',false);
    }
    //获取这个作品的所有评价
    $sql = "select designermessage.email,designermessage.img,discuss.time,discuss.toEmail,discuss.toContent,discuss.content,discuss.zpCode from designermessage,discuss where discuss.zpCode='$code' and discuss.email=designermessage.email order by time desc";
    $query = $mysql->query($sql,$conn);
    $discussList = $mysql->findAll($query);
    $smarty->assign('discussList',$discussList);
    $smarty->display('zpDetail.tpl');

}else{

}
?>