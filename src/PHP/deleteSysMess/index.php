<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/25
 * Time: 9:41
 */
//删除系统设置
//引入smarty配置文件
require_once('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
//移动图片的文件
require_once ('./../common/upload.func.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['code']) && !empty($_GET)){
    if($_SESSION['role'] < 3){
        echo json_encode(array('status'=>0,'msg'=>'你不具备这个权限','url'=>'limit.php'));
    }else{
        $table = $_GET['table'];
        $id = $_GET['code'];
        //删除这个表中的相关数据
        $mysql->del($table,"id=$id",$conn);
        if($table=='role'){
            //找出这个权限对应的权限代码
            $sql = "select code from $table where id=$id";
            $query = $mysql->query($sql,$conn);
            $role = $mysql->findOne($query);
            $code = $role['code'];
            //删除这个权限代码对应的用户
            if($code > 0){
                $mysql->del('adminmessage',"role='$code'",$conn);
            }else{
                $mysql->del('designermessage',"role='$code'",$conn);
                //设计师删除后还有删除所有作品，
                $mysql->del('productionmessage',"",$conn);
                //从点赞表中删除所有的记录
                $mysql->del('good',"",$conn);
                //关注表中删除所有的记录
                $mysql->del('focus',"",$conn);
                //评价表中删除所有的记录
                $mysql->del('discuss',"",$conn);
                //活动表中活动的作品设置为0
                $mysql->update('activemessage',array('zpNum'=>0),"",$conn);
            }
        }
        echo json_encode(array('status'=>1,'msg'=>'删除成功'));
    }
}else{
    echo json_encode(array('status'=>0,'msg'=>'未登录','url'=>'adminSignup.php'));
}