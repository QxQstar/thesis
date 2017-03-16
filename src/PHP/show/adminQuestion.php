<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 19:20
 */
//通过问题进行校验
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && ( isset($_SESSION['adminFindPW']) || isset($_SESSION['adminQuestion']) )){
    if(isset($_SESSION['adminFindPW'])){
        $findPW = $_SESSION['adminFindPW'];
    }else{
        $findPW = $_SESSION['adminQuestion'];
    }

    //判断当前是否登录状态
    if(isset($_SESSION['code']) && $_SESSION['code'] == $findPW){
        $isLog = true;
    }else{
        $isLog = false;
    }
    //先在设计师表中去查找
    $sql = "select * from adminmessage where code='$findPW' and hasQuestion='1'";
    $query  = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        $result = $mysql->findOne($query);
        $smarty->assign('name',$findPW);
        $smarty->assign('result',$result);
        $smarty->assign('isLog',$isLog);
        $smarty->display('adminQuestion.tpl');
    }else {
        $smarty->display('noquestion.tpl');
    }
}else{
    $smarty->display('adminSignup.tpl');
}
?>