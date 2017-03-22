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
//新的作品
if(!empty($_POST) && isset($_SESSION['email']) && !isset($_POST['zpCode'])){
    $title = $_POST['title'];
    $intro = $_POST['intro'];
    $fileInfo = $_FILES['img'];
    $email = $_SESSION['email'];
    $allowExt=array('jpeg','jpg','png');
    $time=date('Y-m-d');
    $result=uploadFile($fileInfo,'./../../uploads',false,$allowExt);
    if(isset($_POST['activeCode'])){
        $activeCode = $_POST['activeCode'];
    }else{
        $activeCode = "";
    }
    if($result['status']){
        $path = $result['path'];
        $name = explode('uploads',$path);
        $arr = array('img'=>'uploads'.$name[1],'title'=>$title,'desc'=>$intro,'email'=>$email,'activeCode'=>$activeCode,'time'=>$time,'status'=>'0','likeNum'=>0,'discussNum'=>0);
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
//修改作品信息
if(!empty($_POST) && (isset($_SESSION['email']) || isset($_SESSION['code'])) && isset($_POST['zpCode'])){
    $zpCode = $_POST['zpCode'];
    $arr = array('title'=>$_POST['title'],'desc'=>$_POST['intro']);
    if(isset($_POST['admin'])){
        $arr['status'] = '2';
        //获得这个作品的活动编号
        $sql = "select activeCode ,status from productionmessage where zpCode='$zpCode'";
        $query = $mysql->query($sql,$conn);
        $zpMess = $mysql->findOne($query);
        //如果这个活动存在，就让这个活动的作品数加一
        if($zpMess['activeCode'] != 0 && $zpMess['status'] != '2'){
            $activeCode = $zpMess['activeCode'];
            $sql = "update activemessage set zpNum=zpNum+1 where activeCode = '$activeCode'";
            mysqli_query($conn,$sql);
        }
    }
    if(!empty($_FILES) && isset($_FILES['img'])){
        //如果是设计师修改了图片就需要重新审核
        if(!isset($_POST['admin'])){
            $arr['status'] = '0';
        }
        $allowExt=array('jpeg','jpg','png');
        $fileInfo = $_FILES['img'];
        $result=uploadFile($fileInfo,'./../../uploads',false,$allowExt);
        if($result['status']){
            $path = $result['path'];
            $name = explode('uploads',$path);
            $arr['img'] = 'uploads'.$name[1];
            $updateresult = $mysql->update('productionmessage',$arr,"zpCode='$zpCode'",$conn);
            if($updateresult){
                $result['status'] = 1;
                $result['msg'] = '修改成功，等待管理员审核';
                $result['url'] = 'zpList0.php';
                if(isset($_POST['admin'])){
                    $result['msg'] = '修改成功';
                    $result['url'] = 'adminZPdetail.php?code='.$zpCode;
                }

            }else{
                $result['status'] = 0;
                $result['msg'] = '修改失败';
            }
        }
    }else{
        $updateresult = $mysql->update('productionmessage',$arr,"zpCode='$zpCode'",$conn);
        if($updateresult){
            $result['status'] = 1;
            $result['msg'] = '修改成功';
            $result['url'] = 'userCenter.php';
            if(isset($_POST['admin'])){
                $result['msg'] = '修改成功';
                $result['url'] = 'adminZPdetail.php?code='.$zpCode;
            }
        }else{
            $result['status'] = 0;
            $result['msg'] = '修改失败';
        }
    }
    echo json_encode($result);
    exit();
}
 ?>