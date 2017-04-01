<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/27
 * Time: 14:21
 */
//搜索作品
//连接数据库
require_once ('./../connect.php');
//smarty配置文件
require_once('./../config.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_GET)){
        $content = $_GET['content'];
        //前台搜索作品
        if($_GET['role'] == 'desi'){
            $role = 0;
            //按事件排序
            if($_GET['status'] =='new'){
                $sql = "select * from productionmessage where title like '".$content."' and status= '2' order by time desc,likeNum desc";
            }else{
                $sql = "select * from productionmessage where title like '".$content."' and status= '2' order by likeNum desc,discussNum desc";
            }
        }
        //后台搜索作品
        else{
            //判断是否有管理员登录
            if(!empty($_SESSION) && isset($_SESSION['code'])){
                $role = $_SESSION['role'];
                $sql = "select * from productionmessage where title like '".$content."' order by likeNum desc,time asc";
            }else{
                echo json_encode(array('status'=>0,'msg'=>"没有管理员登录",'url'=>'adminSignup.php'));
            }
        }

    $query = $mysql->query($sql,$conn);
   $zpList = $mysql->findAll($query);
    //最多可以分多少页
    $maxpage = ceil(count($zpList)/6);
    $zpList = array_slice($zpList,0,6);
   echo json_encode(array('status'=>1,'data'=>$zpList,'role'=>$role,'msg'=>'搜索成功','length'=>count($zpList),'maxpage'=>$maxpage));
}else{
    echo json_encode(array('status'=>0,'msg'=>"发生错误",'url'=>'index.php'));
}