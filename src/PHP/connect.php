<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/13
 * Time: 10:54
 */
define('HOST','localhost:3306');
define('USERNAME','root');
define('PASSWORD','qxqdzh0102!');
define('DBNAME','thesis');
header('Content-type:text/html;charset=utf-8');
$conn = mysqli_connect(HOST,USERNAME,PASSWORD);
if(!$conn){
    die('连接错误'.mysqli_connect_error());
}
mysqli_select_db($conn,DBNAME);
mysqli_query($conn,'set names utf8');

?>