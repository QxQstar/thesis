<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/22
 * Time: 10:04
 */
//管理员审核作品
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
if(isset($_SESSION['code']) && !empty($_POST)){
    $zpCode = $_POST['zpCode'];
    $control = $_POST['control'];
    //找到这个作品的活动编号,作品标题和设计师
    $sql = "select activeCode,email,title from productionmessage where zpCode='$zpCode'";
    $query = $mysql->query($sql,$conn);
    $zpMess = $mysql->findOne($query);
    $email = $zpMess['email'];
    $title = $zpMess['title'];
    //更新该作品的状态
    if($control == 1){
        $status = '2';
        //如果这个活动存在，就让这个活动的作品数加一
        if($zpMess['activeCode'] != 0 ){
            $activeCode = $zpMess['activeCode'];
            $sql = "update activemessage set zpNum=zpNum+1 where activeCode = '$activeCode'";
            mysqli_query($conn,$sql);
        }
        $arr = array('time'=>date('Y-m-d'),'form'=>'system','email'=>$email,'status'=>0,'content'=>'<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code='.$zpCode.'">'. $title .'</a> </h2><p class="content">你的作品'.$title.' 通过了管理员的审核</p>');
        //向消息表中插入一条新消息
        $inseresult = $mysql->insert('note',$arr,$conn);
    }else{
        $status = '1';
        $arr = array('time'=>date('Y-m-d'),'form'=>'system','email'=>$email,'status'=>0,'content'=>'<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code='.$zpCode.'">'. $title .'</a> </h2><p class="content">你的作品'.$title.'没有通过管理员审核</p>');
        //向消息表中插入一条新消息
        $inseresult = $mysql->insert('note',$arr,$conn);
    }
    $arr = array('status'=>$status);
    $mysql->update('productionmessage',$arr,"zpCode='$zpCode'",$conn);
    echo json_encode(array('status'=>1,'msg'=>'成功'));

}else{

}