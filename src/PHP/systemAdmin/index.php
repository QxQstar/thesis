<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/6
 * Time: 17:45
 */
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
//上传的是头像
if(!empty($_FILES) && isset($_FILES['img'])){
    $fileInfo = $_FILES['img'];
    $allowExt=array('jpeg','jpg','png');
    require_once ('./../common/upload.func.php');
    $result=uploadFile($fileInfo,'./../../uploads',false,$allowExt);
    if($result['status']){
        $path = $result['path'];
        $name = explode('uploads',$path);
        $arr = array('img'=>'uploads'.$name[1]);
        $inseresult = $mysql->insert('headImg',$arr,$conn);
        if(!$inseresult){
            $result['status'] = 0;
            $result['msg'] = '数据库更新失败';
        }
    }
    echo json_encode($result);
}
//添加权限
if(!empty($_POST) && isset($_POST['roleCode']) && isset($_POST['roleInfo'])){
    $roleInfo = $_POST['roleInfo'];
    $roleCode = $_POST['roleCode'];
    $arr = array('code'=>$roleCode,'info'=>$roleInfo);
    $inseresult = $mysql->insert('role',$arr,$conn);
    if($inseresult){
        $result = array('status'=>1,'msg'=>'添加成功');
    }else{
        $result = array('status'=>0,'msg'=>'添加失败');
    }
    echo json_encode($result);
}
//添加安全问题
if(!empty($_POST) && isset($_POST['question'])){
    $question = $_POST['question'];
    $arr = array('question'=>$question);
    $inseresult = $mysql->insert('questions',$arr,$conn);
    if($inseresult){
        $result = array('status'=>1,'msg'=>'添加成功');
    }else{
        $result = array('status'=>0,'msg'=>'添加失败');
    }
    echo json_encode($result);
}

?>