<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/22
 * Time: 14:33
 */
//点赞或取消点赞
//smarty配置文件
require_once ('./../config.php');
//数据库连接
require_once ('./../connect.php');
//数据库操作类
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && isset($_SESSION['email']) && isset($_POST)){
    $beEmail = $_POST['beEmail'];
    $email = $_SESSION['email'];
    $control = $_POST['control'];
    //关注
    if($control){
        //更新这个设计师的粉丝数量
        $sql = "update  designermessage set focus=focus+1 where email = '$beEmail'";
        mysqli_query($conn,$sql);
        //向关注表中插入一条数据
        $result = $mysql->insert('focus',array('beEmail'=>$beEmail,'email'=>$email),$conn);
        if($result){
            $arr = array('time'=>date('Y-m-d'),'form'=>$email,'email'=>$beEmail,'status'=>0,'content'=>'<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email='.$email.'">设计师'.$email.'</a>关注了你！ </h2><p class="content">设计师'.$email.'关注了你！</p>');
            //向消息表中插入一条数据
            $mysql->insert('note',$arr,$conn);
            echo json_encode(array('status'=>1,'msg'=>'关注成功','data'=>'取消关注'));
        }else{
            echo json_encode(array('status'=>0,'msg'=>'关注失败'));
        }
    }
    //取消关注
    else{
        //更新这个设计师的粉丝数量
        $sql = "update  designermessage set focus=focus-1 where email = '$beEmail'";
        mysqli_query($conn,$sql);
        $result = $mysql->del('focus',"beEmail='$beEmail' and email='$email'",$conn);

        if(!$result){
            $arr = array('time'=>date('Y-m-d'),'form'=>$email,'email'=>$beEmail,'status'=>0,'content'=>'<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email='.$email.'">设计师'.$email.'</a>取消了对你的关注！ </h2><p class="content">设计师'.$email.'取消了对你的关注！</p>');
            //向消息表中插入一条数据
            $mysql->insert('note',$arr,$conn);
            echo json_encode(array('status'=>1,'msg'=>'取消关注成功','data'=>'关注'));

        }else{
            echo json_encode(array('status'=>0,'msg'=>'取消关注失败'));
        }
    }
}else{
    echo json_encode(array('status'=>0,'msg'=>'没有登录','url'=>'signup.php'));
}