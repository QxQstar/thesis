<?php
header("content-type:text/html;charset=utf-8");
//引入核心文件并实例化
require ('/WWW/thesis/smarty/Smarty.class.php');
$smarty = new Smarty();

//配置
//模板文件的路径
$smarty->template_dir = '/WWW/thesis/src/tpl';
//模板文件编译后得到的文件的路径
$smarty->compile_dir = '/WWW/thesis/src/template_c';
//缓冲文件的路径
$smarty->cache_dir = '/WWW/thesis/src/cache';
//开启缓冲，缓冲默认是关闭的
//$smarty->caching = true;
//缓冲的保留时间
//$smarty->cache_lifetime = 120;

?>