<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 18:09
 */
//管理员找回密码
//引入smarty配置文件
require_once('./../config.php');
if(isset($_SESSION['code'])){
    unset($_SESSION['code']);
}
$smarty->display('adminFindPW.tpl');
?>