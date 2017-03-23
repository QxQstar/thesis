<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/20
 * Time: 15:58
 */
//管理员修改作品
//引入smarty配置文件
require_once('./../config.php');
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['code']) && isset($_SESSION['role']) && $_SESSION['role'] > 1){
    $smarty->assign('isLog',true);
    if(!empty($_GET) && isset($_GET['zpCode'])){
        $zpCode = $_GET['zpCode'];
        //获得这个作品的信息
        $sql = "select * from productionmessage where zpCode='$zpCode'";
        $query = $mysql->query($sql,$conn);
        $zpMessage = $mysql->findOne($query);
        $smarty->assign('zpMessage',$zpMessage);
        //获得这个作品的活动信息
        $activeCode = $zpMessage['activeCode'];
        $sql = "select * from activemessage where activeCode='$activeCode'";
        $query=$mysql->query($sql,$conn);
        if(mysqli_num_rows($query)){
            $arr = $mysql->findOne($query);
            $smarty->assign('activeCode',$arr['activeCode']);
            $smarty->assign('name',$arr['title']);
        }else{
            $smarty->assign('activeCode',false);
        }
        $smarty->assign('role',$_SESSION['role']);
        $smarty->display('adminEditZP.tpl');
    }else{

    }
}else{
    $smarty->display('adminSignup.tpl');
}
?>