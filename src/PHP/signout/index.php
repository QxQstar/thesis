<?php
/**
 * Created by PhpStorm.
 * User: star
 * Date: 2017/3/16
 * Time: 15:38
 */
session_start();
if(!empty($_GET) && isset($_GET['role'])){
    $role = $_GET['role'];
    if($role == 'admin'){
        if(isset($_SESSION['code'])){
            unset($_SESSION['code']);
        }
        if(isset($_SESSION['adminFindPW'])){
            unset($_SESSION['adminFindPW']);
        }
        if(isset($_SESSION['adminQuestion'])){
            unset($_SESSION['adminQuestion']);
        }

    }else{
        if(isset($_SESSION['email'])){
            unset($_SESSION['email']);
        }
        if(isset($_SESSION['findPW'])){
            unset($_SESSION['findPW']);
        }
        if(isset($_SESSION['question'])){
            unset($_SESSION['question']);
        }
    }
    echo json_encode(array('status'=>1,'msg'=>'退出成功！','role'=>$role));
}
?>