<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 20:39
 */
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(isset($_SESSION['question']) && isset($_SESSION['email']) && $_SESSION['question'] == $_SESSION['email']){
    $smarty->assign('name',$_SESSION['question']);
    $smarty->assign('isLog',true);
    //从安全问题表中查询出所有的安全问题
    $sql = "select * from questions";
    $query = $mysql->query($sql,$conn);
    $result = $mysql->findAll($query);

    $smarty->assign('list',$result);
    $smarty->display('setQuestion.tpl');
}else{
    $smarty->display('signup.tpl');
}
?>