<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/2/21
 * Time: 15:41
 */
function smarty_block_test2($params ,$content){
    $replace = $params['replace'];
    $maxnum = $params['maxnum'];
    if($replace == 'true'){
        str_replace('，', ',', $content);
        str_replace('。', '.', $content);

    }
    $content = substr($content,0,$maxnum);

    return $content;
}
?>