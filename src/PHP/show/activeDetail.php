<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/19
 * Time: 13:08
 */
//前台活动详情
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_GET) && isset($_GET['code'])){
    $code = $_GET['code'];
    //获取活动的信息
    $sql = "select * from activemessage where activeCode='$code'";
    $query = $mysql->query($sql,$conn);
    $activeMess = $mysql->findOne($query);
    //检查这个活动的状态
    $sTime = $activeMess['sTime'];
    $eTime = $activeMess['eTime'];
    //如果活动开始时间小于现在的时间，结束的时间大于现在的时间，则说明当前的活动处于进行中
    if(strtotime($sTime) < time() && strtotime($eTime) > time()){
        $status = '2';
    }
    //活动已经结束
    elseif (strtotime($sTime) < time() && strtotime($eTime) < time()){
        $status = '0';
    }
    //活动即将开始
    elseif (strtotime($sTime) > time() && strtotime($eTime) > time()){
        $status = '1';
    }
    if($activeMess['status'] != $status){
        $mysql->update('acticemessage',"activeCode='$code'",$conn);
        $query = $mysql->query($sql,$conn);
        $activeMess = $mysql->findOne($query);
    }

    $smarty->assign('activeMess',$activeMess);
    $smarty->assign('isLog',true);
    //获得这个活动的作品
    $sql = "select * from productionmessage where activeCode='$code'and status='2' limit 8";
    $query = $mysql->query($sql,$conn);
    $zpList = $mysql->findAll($query);
    $smarty->assign('zpList',$zpList);
    $smarty->assign('num',count($zpList));
    if(!empty($_SESSION) && isset($_SESSION['email'])){
        $smarty->assign('isLog',true);
    }else{
        $smarty->assign('isLog',false);
    }
    $smarty->display('activeDetail.tpl');
}

else{
}