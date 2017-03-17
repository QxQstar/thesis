/**
 * Created by star on 2017/3/6.
 */
var $ = require('jquery');
function Ajax(){

}
/**
 * 提交表单数据
 * @param url 提交到的url
 * @param data 提交的数据
 * @param haveFile 是否要上传文件
 * @param prevUrl 提交时的url地址
 */
Ajax.prototype.submitForm = function(url,data,haveFile,prevUrl){
    if(haveFile){
        $.ajax({
            type:'POST',
            url:'/thesis/src/PHP/'+url+'/index.php',
            data:data,
            cache: false,
            contentType: false,
            processData: false,
            dataType:'json',
            success:function(result){
                //系统上传头像
                if(url === 'systemAdmin'){
                    alert(result.msg);
                    location.reload();
                }
                //自定义头像
                if(url === 'setMessage'){
                    if(result.status){
                        location.reload();
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
            }
        });
    }else{
        $.ajax({
            type:'POST',
            url:'/thesis/src/PHP/'+url+'/index.php',
            data:data,
            cache: false,
            dataType:'json',
            success:function(result){

                //系统添加权限和安全问题
                if(url === 'systemAdmin'){
                    alert(result.msg);
                    location.reload();
                }
                //设计师注册
                if(url ==='signin'){
                    if(result.status){
                        alert(result.msg);
                        location.href='/thesis/src/PHP/show/signup.php';
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //添加设计师
                if(url ==='adminDesSignin'){
                    if(result.status){
                        alert(result.msg);
                        location.href = '/thesis/src/html/adminUserList.html';
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //添加管理员
                if(url ==='adminSignin'){
                    if(result.status){
                        alert(result.msg);
                        location.href = '/thesis/src/html/adminUserList.html';
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //设计师登录
                if(url === 'signup'){
                    if(result.status){
                        if(prevUrl.indexOf('signup') > 0){
                            location.href = '/thesis/src/html/index.html';
                        }else{
                            location.href = prevUrl;
                        }
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //管理员登录
                if(url === 'adminSignup'){
                    if(result.status){
                        if(prevUrl.indexOf('adminSignup') >= 0){
                            location.href = '/thesis/src/html/adminUserList.html';
                        }else{
                            location.href = prevUrl;
                        }
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //修改头像——系统提供的头像 和基本信息
                if(url === 'setMessage'){
                    if(result.status){
                        location.reload();
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //设计师|| 管理员修改密码，找回密码，修改安全问题
                if(url === 'verify' || url === 'adminVerify'){
                    if(result.status){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }else{
                        alert(result.msg);
                        if(result.url){
                            location.href = '/thesis/src/PHP/show/'+result.url;
                        }else{
                            location.reload();
                        }

                    }
                }
            }
        });
    }

};
/**
 * 退出登录
 * @param url 请求的地址
 * @param role 角色 admin or user
 */
Ajax.prototype.signout = function (url,role) {
    $.ajax({
        type:'GET',
        data:{role:role},
        url:'/thesis/src/PHP/'+url+'/index.php',
        dataType:'json',
        success:function (result) {
            if(result.status){
                if(role == 'admin'){
                    location.href = '/thesis/src/PHP/show/adminSignup.php';
                }else{
                    location.href = '/thesis/src/html/index.html';
                }
            }
        }
    });
};
var ajax = new Ajax();
module.exports = ajax;