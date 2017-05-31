<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/8
 * Time: 9:37
 */
 //管理员添加另外的管理员
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
session_start();
$mysql = new mysql();
if(!empty($_POST) && !isset($_POST['edit']) && isset($_POST['password']) &&  isset($_POST['code']) ){
        $code = $_POST['code'];
        $role = $_POST['role'];
        $password = $_POST['password'];
        //判断这个管理员账号是否存在
        $sql = "select * from adminmessage where code = '$code'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        //如果不存在
        if(!$num){
            $time = date('Y-m-d');
            $arr = array('code'=>$code,'password'=>$password,'role'=>$role,'hasQuestion'=>'0','time'=>$time,'question1'=>"",'question2'=>"",'answer1'=>"",'answer2'=>"");
            $insertresult = $mysql->insert('adminmessage',$arr,$conn);
            if($insertresult){
                echo json_encode(array('status'=>1,'msg'=>'添加成功','role'=>$role));
            }else{
                echo json_encode(array('status'=>0,'msg'=>'添加失败'));
            }

        }else{
            echo json_encode(array('status'=>0,'msg'=>'这个管理员账号已经存在'));
        }
        exit();
}
//修改管理员资料
if(!empty($_POST) && isset($_POST['edit']) && isset($_SESSION['code'])){
    $code = $_POST['code'];
    $arr = array('password'=>$_POST['password'],'role'=>$_POST['role']);
    $result = $mysql->update('adminmessage',$arr,"code='$code'",$conn);
    if($result){
        echo json_encode(array('status'=>1,'msg'=>"修改成功"));
    }else{
        echo json_encode(array('status'=>0,'msg'=>"修改失败"));
    }
}
?>
