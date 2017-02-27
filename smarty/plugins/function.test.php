<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/2/21
 * Time: 15:14
 */
function smarty_function_test($params){
    //$params是一个关联数组
    $w = $params['w'];
    $h = $params['h'];
    return $w * $h;
}
?>