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
//找回密码或修改密码
if(!empty($_POST) && isset($_POST['findPW'])){
    //设计师找回密码
    if(isset($_POST['email'])){
        $email = $_POST['email'];
        $sql = "select email from designermessage where email='$email'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        if(!$num){
            echo json_encode(array('status'=>0,'msg'=>'不存在该设计师账号'));
        }else{
            //这个设计师是否设置了安全问题
            $sql = "select * from designermessage where email='$email' and hasQuestion='1'";
            $query = $mysql->query($sql,$conn);
            $num = mysqli_num_rows($query);
            if(!$num){
                echo json_encode(array('status'=>1,'msg'=>'该设计师账号没有安全问题','url'=>'noquestion.php'));
            }else{
                $_SESSION['findPW'] = $email;
                echo json_encode(array('status'=>1,'msg'=>'该设计师账号有安全问题','url'=>'question.php'));

            }
        }
    }
    //管理员找回密码
    if(isset($_POST['code'])){
        $code = $_POST['code'];
        $sql = "select code from adminmessage where code='$code'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        if(!$num){
            echo json_encode(array('status'=>0,'msg'=>'不存在该管理员账号'));
        }else{
            //这个设计师是否设置了安全问题
            $sql = "select * from adminmessage where code='$code' and hasQuestion='1'";
            $query = $mysql->query($sql,$conn);
            $num = mysqli_num_rows($query);
            if(!$num){
                echo json_encode(array('status'=>1,'msg'=>'该管理员账号没有安全问题','url'=>'noquestion.php'));
            }else{
                $_SESSION['findPW'] = $code;
                echo json_encode(array('status'=>1,'msg'=>'该管理员账号有安全问题','url'=>'question.php'));

            }
        }
    }
}
//回答安全问题
if(!empty($_POST) && isset($_POST['check']) && isset($_POST['zhanghu'])){
    $zhanghu = $_POST['zhanghu'];
    $question1 = $_POST['question1'];
    $question2 = $_POST['question2'];
    $answer1 = $_POST['answer1'];
    $answer2 = $_POST['answer2'];
    //先到设计师表中去匹配
    $sql = "select * from designermessage where email='$zhanghu' and question1='$question1' and question2='$question2' and answer1='$answer1' and answer2='$answer2'";
    $query = $mysql->query($sql,$conn);
    $num = mysqli_num_rows($query);
    if($num){
        //设置新密码
        if(isset($_SESSION['findPW'])){
            echo json_encode(array('status'=>1,'msg'=>'验证成功','url'=>'setPW.php'));
        }
    }else{
        //如果设计师表中没有找到到管理员表中去找
        $sql = "select * from adminmessage where code='$zhanghu' and question1='$question1' and question2='$question2' and answer1='$answer1' and answer2='$answer2'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        if($num){
            //设置新密码
            if(isset($_SESSION['findPW'])){
                echo json_encode(array('status'=>1,'msg'=>'验证成功','url'=>'setPW.php'));
            }
        }else{
            echo json_encode(array('status'=>0,'msg'=>'验证失败'));
        }
    }
}
//设置新密码
if(!empty($_POST) && isset($_POST['setPW'])){
    $zhanghu = $_SESSION['findPW'];
    $newPW = $_POST['password'];
    //试图更新设计师表
    if($mysql->update('designermessage',array('password'=>$newPW),"email='$zhanghu'",$conn)){
        echo json_encode(array('status'=>1,'msg'=>'更新成功','url'=>'finish.php'));
    }else{
        if($mysql->update('adminmessage',array('password'=>$newPW),"code='$zhanghu'",$conn)){
            echo json_encode(array('status'=>1,'msg'=>'更新成功','url'=>'finish.php'));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'更新失败'));
        }
    }
}
?>