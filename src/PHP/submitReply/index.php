<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/26
 * Time: 10:49
 */
//评价
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
session_start();
if(!empty($_SESSION) && !empty($_POST) && isset($_SESSION['email'])){
    $email = $_SESSION['email'];
    $zpCode = $_POST['zpCode'];
    $content = $_POST['content'];
    $toContent = $_POST['toContent'];
    $toEmail = $_POST['toEmail'];
    $time  = date('Y-m-d');
    //将这个作品的评价数量+1
    $sql = "update productionmessage set discussNum=discussNum+1 where zpCode = '$zpCode'";
    mysqli_query($conn,$sql);
    $result = $mysql->insert('discuss',array('email'=>$email,'toEmail'=>$toEmail,'content'=>$content,'toContent'=>$toContent,'time'=>$time,'zpCode'=>$zpCode),$conn);
    if($result){
        echo json_encode(array('status'=>1,'msg'=>'评价成功'));
        if($toEmail == ''){
            //获得这个作品的设计师
            $sql = "select email from productionmessage where zpCode='$zpCode'";
            $query = $mysql->query($sql,$conn);
            $zpMess = $mysql->findOne($query);
            $beEmail = $zpMess['email'];
            $arr = array('time'=>date('Y-m-d'),'form'=>$email,'email'=>$beEmail,'status'=>0,'content'=>'<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code='.$zpCode.'">作品评价</a> </h2><p class="content">设计师'.$email.'评价了你的作品，ta说'. $content .'</p>');
        }else{
            $arr = array('time'=>date('Y-m-d'),'form'=>$email,'email'=>$toEmail,'status'=>0,'content'=>'<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?code='.$zpCode.'"> 回复:'.$toContent.'</a></h2><p class="content">设计师'.$email.'说：'.$content.'</p>');
        }

        //向消息表中插入一条数据
        $mysql->insert('note',$arr,$conn);
    }else{
        echo json_encode(array('status'=>0,'msg'=>'评价失败'));
    }
}else{
    echo json_encode( array('status'=>0,'msg'=>'未登录','url'=>'signup.php') );
}