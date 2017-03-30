<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/19
 * Time: 9:23
 */
//后台活动管理
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_SESSION) && isset($_SESSION['code'])){
    //根据活动结束的事件升序
    $sql = "select * from activemessage order by status desc,eTime asc";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findAll($query);

    //可以分多少页
    $maxpage = ceil(count($result)/8);
    $result = array_slice($result,0,8);
    for($i = 0,$len=count($result);$i < $len;$i++){
        $curActive = $result[$i];
        $activeCode = $curActive['activeCode'];
        $eTime = $curActive['eTime'];
        $sTime = $curActive['sTime'];
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
        if($status != $curActive['status']){
            $curActive['status'] = $status;
            $mysql->update('activemessage',array('status'=>$status),"activeCode='$activeCode'",$conn);
        }
    }

    $smarty->assign('isLog',true);
    $smarty->assign('result',$result);
    $smarty->assign('role',$_SESSION['role']);
    $smarty->assign('length',count($result));
    $smarty->assign('maxpage',$maxpage);
    $smarty->display('adminActiveList.tpl');
}else{
    $smarty->display('adminSignup.tpl');
}

?>