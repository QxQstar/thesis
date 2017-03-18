<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/6
 * Time: 17:45
 */
//上传作品
//连接数据库
require_once ('./../connect.php');
//smarty配置文件
require_once('./../config.php');
//数据库操作文件
require_once ('./../common/mysql.class.php');
//移动图片的文件
require_once ('./../common/upload.func.php');
$mysql = new mysql();
session_start();
if(!empty($_POST) && isset($_SESSION['email'])){
    $title = $_POST['title'];
    $intro = $_POST['intro'];
    $fileInfo = $_FILES['img'];
    $email = $_SESSION['email'];
    $allowExt=array('jpeg','jpg','png');
    $time=date('Y-m-d');
    $result=uploadFile($fileInfo,'./../../uploads',false,$allowExt);
    if($result['status']){
        $path = $result['path'];
        $name = explode('uploads',$path);
        $arr = array('img'=>'uploads'.$name[1],'title'=>$title,'desc'=>$intro,'email'=>$email,'time'=>$time,'status'=>'0');
        $inseresult = $mysql->insert('productionmessage',$arr,$conn);
        if(!$inseresult){
            $result['status'] = 0;
            $result['msg'] = '数据库更新失败';
        }else{
            $result['status'] = 1;
            $result['msg'] = '上传成功，等待管理员审核';
            $result['url'] = 'zpList0.php';
        }
    }
    echo json_encode($result);
    exit();
}
 ?>