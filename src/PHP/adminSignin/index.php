<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/8
 * Time: 9:37
 */
require_once ('./../connect.php');
require_once('./../config.php');
require_once ('./../common/mysql.class.php');
$mysql = new mysql();
if(!empty($_POST) && isset($_POST['password']) &&  isset($_POST['code'])){
        $code = $_POST['code'];
        $role = $_POST['role'];
        $password = $_POST['password'];
        //判断这个管理员账号是否存在
        $sql = "select * from adminmessage where code = '$code'";
        $query = $mysql->query($sql,$conn);
        $num = mysqli_num_rows($query);
        //如果不存在
        if(!$num){
            $arr = array('code'=>$code,'password'=>$password,'role'=>$role);
            $insertresult = $mysql->insert('adminmessage',$arr,$conn);
            if($insertresult){
                echo json_encode(array('status'=>1,'msg'=>'添加成功','role'=>$role));
            }else{
                echo json_encode(array('status'=>0,'msg'=>'添加失败'));
            }

        }else{
            echo json_encode(array('status'=>0,'msg'=>'这个管理员账号已经存在'));
            exit();
        }


}
?>
