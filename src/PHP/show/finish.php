<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/14
 * Time: 21:06
 */
//smarty配置文件
require_once ('./../config.php');
if(isset($_SESSION['findPW'])){
    unset($_SESSION['findPW']);
}
if(isset($_SESSION['question'])){
    unset($_SESSION['question']);
}
$smarty->display('finish.tpl');
?>