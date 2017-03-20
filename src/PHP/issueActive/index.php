<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/18
 * Time: 10:39
 */
//发布活动
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
//新活动
if(!empty($_SESSION) && isset($_SESSION['code']) && !empty($_POST) && !empty($_FILES)){
    $title = $_POST['title'];
    $sTime = $_POST['sTime'];
    $eTime = $_POST['eTime'];
    $desc = $_POST['desc'];
    $fileInfo = $_FILES['img'];
    $allowExt=array('jpeg','jpg','png');

    if(strtotime($sTime) > time()){
        $status = '2';
    }else{
        $status = '1';
    }
    $result=uploadFile($fileInfo,'./../../uploads',false,$allowExt);
    if($result['status']){
        $path = $result['path'];
        $name = explode('uploads',$path);
        //活动正在进行为‘1’，即将进行为‘2’，已结束为‘0’
        $arr = array('img'=>'uploads'.$name[1],'sTime'=>$sTime,'eTime'=>$eTime,'title'=>$title,'intro'=>$desc,'status'=>$status);
        $inseresult = $mysql->insert('activemessage',$arr,$conn);
        if(!$inseresult){
            $result['status'] = 0;
            $result['msg'] = '上传失败';
        }else{
            $arr = array('time'=>date('Y-m-d'),'form'=>'system','email'=>'all','status'=>0,'content'=>'又有一个新的活动发布了,快去看看吧！活动有效时间：'.$sTime.'至'.$eTime.'。活动标题：'.$title);
            $inseresult = $mysql->insert('note',$arr,$conn);
            if(!$inseresult){
                $result['status'] = 0;
                $result['msg'] = '上传失败';
            }else{
                $result['status'] = 1;
                $result['msg'] = '添加成功';
                $result['url'] = 'adminActiveList.php';
            }

        }
    }
    echo json_encode($result);
    exit();

}
//修改活动信息
if(!empty($_SESSION) && isset($_SESSION['code']) && !empty($_POST) && isset($_POST['activeCode'])){
    $activeCode = $_POST['activeCode'];
    $title = $_POST['title'];
    $sTime = $_POST['sTime'];
    $eTime = $_POST['eTime'];
    $desc = $_POST['desc'];
    if(strtotime($sTime) > time()){
        $status = '2';
    }else{
        $status = '1';
    }
    $arr = array('sTime'=>$sTime,'eTime'=>$eTime,'title'=>$title,'intro'=>$desc,'status'=>$status);
    $inseresult = $mysql->update('activemessage',$arr,"activeCode='$activeCode'",$conn);
    if($inseresult){
        $result['status'] = 1;
        $result['msg'] = '更新成功';
        $result['url'] = 'adminActiveList.php';
    }else{
        $result['status'] = 0;
        $result['msg'] = '更新失败';
    }
    echo json_encode($result);
    exit();
}
?>