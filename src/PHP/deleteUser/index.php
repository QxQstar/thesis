<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/24
 * Time: 10:05
 */
//删除用户
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
/** 删除设计师
 * @param $email 设计师的账号
 * @param $mysql 数据库操作类
 * @param $conn 数据库连接标志
 */
function deleteDesi($email,$mysql,$conn){
    //1.被这个设计师关注的设计师的粉丝-1
    //获得被这个设计师关注的设计师
    $sql = "select beEmail from focus where email='$email'";
    $query = $mysql->query($sql,$conn);
    if(mysqli_num_rows($query) > 0){
        $desiList = $mysql->findAll($query);
        for($i = 0,$len=count($desiList);$i<$len;$i++){
            $curDesi = $desiList[$i];
            $curEmail = $curDesi['beEmail'];
            $sql = "update designermessage set focus=focus-1 where email = '$curEmail'";
            mysqli_query($conn,$sql);
        }
    }
    //2.从关注表示删除这个设计师记录
    $mysql->del('focus',"email='$email'or beEmail='$email'",$conn);
    //3.修改活动作品的数量
    //获得这个设计师所有通过审核的活动作品
    $sql = "select activemessage.activeCode from activemessage,productionmessage where productionmessage.status='2'and productionmessage.email='$email' and productionmessage.activeCode = activemessage.activeCode";
    $query = $mysql->query($sql,$conn);
    $activeList = $mysql->findAll($query);
    for($i=0,$len=count($activeList);$i<$len;$i++){
        $curActiveCode = $activeList[$i]['activeCode'];
        $sql = "update activemessage set zpNum=zpNum-1 where activeCode = '$curActiveCode'";
        mysqli_query($conn,$sql);
    }
    //4.从作品表中删除这个设计师作品
    $mysql->del('productionmessage',"email='$email'",$conn);
    //5.从设计师表中删除这个设计师的信息
    $mysql->del('designermessage',"email='$email'",$conn);
    $result = array('status'=>1,'msg'=>'删除成功');
    echo json_encode($result);
    exit();
}
//判断是否有管理员登录
if(!empty($_SESSION) && isset($_SESSION['code']) && !empty($_GET)){
    //判断该管理员是否具备删除用户的权限
    if($_SESSION['role'] < 2){
        echo json_encode(array('status'=>0,'msg'=>'不具备权限','url'=>'limit.php'));
    }else{
        //判断是删除管理员还是设计师
        if($_GET['role'] == 'admin'){
            $code = $_GET['code'];
            $mysql->del('adminmessage',"code='$code'",$conn);
            echo json_encode(array('status'=>1,'msg'=>'删除成功'));
        }else{
            deleteDesi($_GET['code'],$mysql,$conn);
        }
    }
}else{
    echo json_encode(array('status'=>0,'msg'=>'未登录','url'=>'adminSignup.php'));
}