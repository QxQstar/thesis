<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/2/21
 * Time: 15:25
 */
function smarty_modifier_test($utime,$formate){
    return date($formate,$utime);
}
?>