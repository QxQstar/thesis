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
if(!empty($_SESSION) && isset($_SESSION['findPW'])){
    $findPW = $_SESSION['findPW'];
    //先在设计师表中去查找
    $sql = "select * from designermessage where email='$findPW' and hasQuestion='1'";
    $query  = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        $result = $mysql->findOne($query);
        $smarty->assign('name',$findPW);
        $smarty->assign('result',$result);
        $smarty->display('question.tpl');
    }else {
        //如果在设计师表中没有找到，就在管理员表中去找
        $sql = "select * from adminmessage where code='$findPW' and hasQuestion='1'";
        $query = $mysql->query($sql, $conn);
        $num = mysqli_num_rows($query);
        if ($num) {
            $result = $mysql->findOne($query);
            $smarty->assign('name',$findPW);
            $smarty->assign('result', $result);
            $smarty->display('question.tpl');
        }
    }
}
?>