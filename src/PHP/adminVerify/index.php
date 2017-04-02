<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/6
 * Time: 17:45
 */
//找回密码
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
//找回密码
if(!empty($_POST) && isset($_POST['findPW'])){
    //管理员找回密码,code是要找回密码的账号
    if(isset($_POST['code'])){
        $code = $_POST['code'];
        $sql = "select code from adminmessage where code='$code'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        if(!$num){
            echo json_encode(array('status'=>0,'msg'=>'不存在该管理员账号！'));
        }else{
            //这个设计师是否设置了安全问题
            $sql = "select * from adminmessage where code='$code' and hasQuestion='1'";
            $query = $mysql->query($sql,$conn);
            $num = mysqli_num_rows($query);
            if(!$num){
                echo json_encode(array('status'=>1,'msg'=>'该管理员账号没有安全问题','url'=>'adminnoques.php'));
            }else{
                $_SESSION['adminFindPW'] = $code;
                echo json_encode(array('status'=>1,'msg'=>'该管理员账号有安全问题','url'=>'adminQuestion.php'));

            }
        }
    }
    exit();
}
//验证回答的安全问题，修改密码
if(!empty($_POST) && isset($_POST['check']) && isset($_POST['zhanghu']) && isset($_SESSION['adminFindPW'])){
    $zhanghu = $_POST['zhanghu'];
    $question1 = $_POST['question1'];
    $question2 = $_POST['question2'];
    $answer1 = $_POST['answer1'];
    $answer2 = $_POST['answer2'];
    //先到设计师表中去匹配
    $sql = "select * from adminmessage where code='$zhanghu' and question1='$question1' and question2='$question2' and answer1='$answer1' and answer2='$answer2'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        //跳转到设置新密码的页面
        echo json_encode(array('status'=>1,'msg'=>'验证成功','url'=>'adminSetPW.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'验证失败'));
    }
    exit();
}
//验证回答的安全问题，修改安全问题
if(!empty($_POST) && isset($_POST['check']) && isset($_POST['zhanghu']) && isset($_SESSION['adminQuestion'])){
    $zhanghu = $_POST['zhanghu'];
    $question1 = $_POST['question1'];
    $question2 = $_POST['question2'];
    $answer1 = $_POST['answer1'];
    $answer2 = $_POST['answer2'];
    //先到设计师表中去匹配
    $sql = "select * from adminmessage where code='$zhanghu' and question1='$question1' and question2='$question2' and answer1='$answer1' and answer2='$answer2'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        //跳转到设置安全问题的页面
        echo json_encode(array('status'=>1,'msg'=>'验证成功','url'=>'adminSetQuestion.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'验证失败'));
    }
    exit();
}
//验证密码，修改密码
if(!empty($_POST) && isset($_POST['checkPW']) && isset($_SESSION['adminFindPW'])){
    $code = $_POST['code'];
    $password = $_POST['password'];
    $sql = "select * from adminmessage where code='$code' and password='$password'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        echo json_encode(array('status'=>1,'msg'=>'验证成功','url'=>'adminSetPW.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'验证失败'));
    }
    exit();
}
//验证密码，修改安全问题
if(!empty($_POST) && isset($_POST['checkPW']) && isset($_SESSION['adminQuestion'])){
    $code = $_POST['code'];
    $password = $_POST['password'];
    $sql = "select * from adminmessage where code='$code' and password='$password'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        echo json_encode(array('status'=>1,'msg'=>'验证成功','url'=>'adminSetQuestion.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'验证失败'));
    }
    exit();
}
//设置新密码
if(!empty($_POST) && isset($_POST['setPW']) && isset($_POST['code'])){
    $zhanghu = $_POST['code'];
    $newPW = $_POST['password'];
    //试图更新设计师表
    if($mysql->update('adminmessage',array('password'=>$newPW),"code='$zhanghu'",$conn)){
        echo json_encode(array('status'=>1,'msg'=>'更新成功','url'=>'adminFinish.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'更新失败'));
    }
    exit();
}
//设置新的安全问题
if(!empty($_POST) && isset($_POST['setQU']) && isset($_POST['code'])){
    $question1 = $_POST['newQuestion1'];
    $question2 = $_POST['newQuestion2'];
    $answer1 = $_POST['newAnswer1'];
    $answer2 = $_POST['newAnswer2'];
    $zhanghu = $_POST['code'];
    //试图更新设计师表
    if($mysql->update('adminmessage',array('question1'=>$question1,'question2'=>$question2,'answer1'=>$answer1,'answer2'=>$answer2,'hasQuestion'=>1),"code='$zhanghu'",$conn)){
        echo json_encode(array('status'=>1,'msg'=>'更新成功','url'=>'finish.php'));
    }else{
        echo json_encode(array('status'=>0,'msg'=>'更新失败'));
    }
    exit();
}
?>