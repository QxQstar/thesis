<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/8
 * Time: 18:31
 */
//引入连接数据库的文件
require_once ('./../connect.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//选择的是系统头像
if(!empty($_POST) && isset($_SESSION['email']) && isset($_SESSION['role']) && $_SESSION['role'] <= 1){
    $arr = array();
    $email = $_SESSION['email'];
    if(isset($_POST['img'])){
        $arr['img'] = $_POST['img'];
    }
    if(isset($_POST['nickname'])){
        $arr['nickname'] = $_POST['nickname'];
    }
    if(isset($_POST['intro'])){
        $arr['intro'] = $_POST['intro'];
    }
    $result = $mysql->update('designermessage',$arr,"email='$email'",$conn);
    if($result){
        echo json_encode(array('status'=>1,'msg'=>"修改成功"));
    }else{
        echo json_encode(array('status'=>0,'msg'=>"修改失败"));
    }
}
//自定义头像
if(!empty($_FILES) && isset($_FILES['img']) && isset($_SESSION['email']) && isset($_SESSION['role']) && $_SESSION['role'] <= 1){
    $fileInfo = $_FILES['img'];
    echo json_encode($fileInfo);
    $allowExt=array('jpeg','jpg','png');
    $email = $_SESSION['email'];
    require_once ('./../common/upload.func.php');
    $result=uploadFile($fileInfo,'./../../uploads',false,$allowExt);
    if($result['status']){
        $path = $result['path'];
        $name = explode('uploads',$path);
        $arr = array('img'=>'uploads'.$name[1]);
        $upresult = $mysql->update('designermessage',$arr,"email='$email'",$conn);
        if(!$upresult){
            $result['status'] = 0;
            $result['msg'] = '上传失败';
        }
    }
    echo json_encode($result);
}
?>