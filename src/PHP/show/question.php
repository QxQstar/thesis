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
if(!empty($_SESSION) && ( isset($_SESSION['findPW']) || isset($_SESSION['question']) )){
    if(isset($_SESSION['findPW'])){
        $findPW = $_SESSION['findPW'];
    }else{
        $findPW = $_SESSION['question'];
    }

    //判断当前是否登录状态
    if(isset($_SESSION['email']) && $_SESSION['email'] == $findPW){
        $isLog = true;
    }else{
        $isLog = false;
    }
    //先在设计师表中去查找
    $sql = "select * from designermessage where email='$findPW' and hasQuestion='1'";
    $query  = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        $result = $mysql->findOne($query);
        $smarty->assign('name',$findPW);
        $smarty->assign('result',$result);
        $smarty->assign('isLog',$isLog);
        $smarty->display('question.tpl');
    }else {
        $smarty->display('noquestion.tpl');
    }
}else{
    $smarty->display('signup.tpl');
}
?>