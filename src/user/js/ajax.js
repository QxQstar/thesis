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
                //上传作品
                if(url === 'issueZP'){
                    if(result.status){
                        alert(result.msg);
                        if(result.url){
                            location.href='/thesis/src/PHP/show/'+result.url;
                        }
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                if(url === 'issueActive'){
                    if(result.status){
                        alert(result.msg);
                        if(result.url){
                            location.href='/thesis/src/PHP/show/'+result.url;
                        }
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
                        location.href = '/thesis/src/PHP/show/adminDesiList.php';
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //添加管理员
                if(url ==='adminSignin'){
                    if(result.status){
                        alert(result.msg);
                        location.href = '/thesis/src/PHP/show/adminAdList.php';

                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //设计师登录
                if(url === 'signup'){
                    if(result.status){
                        var curUrl = location.href;
                        if(curUrl.indexOf('nextUrl') > 0){
                            location.href = location.hash.split('nextUrl=')[1];
                        }else{
                            if(prevUrl.indexOf('signup') > 0){
                                location.href = '/thesis/src/PHP/show/index.php';
                            }else{
                                location.href = prevUrl;
                            }

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
                            location.href = '/thesis/src/PHP/show/adminZP0.php';
                        }else{
                            location.href = prevUrl;
                        }
                    }else{
                        alert(result.msg);
                        location.reload();
                    }
                }
                //设计师修改自己的资料
                if(url === 'setMessage'){
                    if(result.status){
                        if(result.url){
                            location.href = '/thesis/src/PHP/show/'+result.url;
                        }else{
                            location.reload();
                        }
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
                //管理员修改设计师的资料
                if(url === 'adminSetMessage'){
                    if(result.status && result.url){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }else{
                        alert(result.msg);
                        location.reload();
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
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 审核作品
 * @param data 要提交的数据，对象。包括作品编号和是否通过审核
 */
Ajax.prototype.checkZP = function (data) {
    $.ajax({
        type:'POST',
        data:data,
        url:'/thesis/src/PHP/checkZP/index.php',
        dataType:'json',
        success:function (result) {
            location.reload();
        }
    });
};
/**
 * 点赞
 * @param data 要提交的数据
 * @param elem 被点击的元素
 */
Ajax.prototype.thumb = function (data,elem) {
    $.ajax({
        type:'POST',
        data:data,
        url:"/thesis/src/PHP/thumb/index.php",
        dataType:'json',
        success:function (result) {
            if(result.status){
                elem.text(result.data);
                if(data.control){
                    elem
                        .addClass('on')
                        .attr({
                            'status':'gooded',
                            'title':'取消点赞'
                        })
                }else{
                    elem
                        .removeClass('on')
                        .attr({
                            'status':'good',
                            'title':'点赞'
                        })

                }
            }else{
                if(result.url){
                    var curUrl;
                    curUrl = location.href;
                    location.href = '/thesis/src/PHP/show/'+result.url+'#nextUrl='+curUrl;
                }
            }
        }
    });
};
/**
 * 关注
 * @param data 要提交的数据
 * @param elem 按钮
 */
Ajax.prototype.focus = function (data,elem) {
    $.ajax({
        type:'POST',
        data:data,
        url:"/thesis/src/PHP/focus/index.php",
        dataType:'json',
        success:function (result) {
            if(result.status){
                elem.text(result.data);
                if(data.control){
                    elem
                        .attr({
                            'status':'focused'
                        })
                }else{
                    if(data.loadimg){
                        location.reload();
                    }else{
                        elem
                            .attr({
                                'status':'focus'
                            })
                    }
                }
            }else{
                if(result.url){
                    var curUrl;
                    curUrl = location.href;
                    location.href = '/thesis/src/PHP/show/'+result.url+'#nextUrl='+curUrl;
                }
            }
        }
    });
};
/**
 * 删除作品
 * @param data 要删除的作品的编号，对象
 */
Ajax.prototype.deleteZP = function (data) {
    $.ajax({
        type:'GET',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/deleteZP/index.php',
        success:function (result) {
            if(!result.status){
              alert(result.msg);
              if(result.url){
                  location.href = '/thesis/src/PHP/show/'+result.url;
              }
            }else{
                location.reload();
            }
        }
    });
};
/**
 * 删除用户
 * @param data 要删除用户的编号。对象
 */
Ajax.prototype.deleteUser = function (data) {
    $.ajax({
        type:'GET',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/deleteUser/index.php',
        success:function (result) {
            if(!result.status){
                alert(result.msg);
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }
            }else{
                location.reload();
            }
        }
    });
};
/**
 * 删除活动
 * @param data 发送的数据，对象。活动编号
 */
Ajax.prototype.deleteActive = function (data) {
    $.ajax({
        data:data,
        type:"GET",
        url:'/thesis/src/PHP/deleteActive/index.php',
        dataType:'json',
        success:function (result) {
            if(result.status){
                location.reload();
            }else{
                alert(result.msg);
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }
            }
        }
    });
};
/**
 * 删除系统设置
 * @param data 要发送的数据，对象
 */
Ajax.prototype.deleteSysMess = function (data) {
    $.ajax({
        type:"GET",
        data:data,
        url:'/thesis/src/PHP/deleteSysMess/index.php',
        dataType:'json',
        success:function (result) {
            if(result.status){
                location.reload();
            }else{
                alert(result.msg);
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }
            }
        }
    });
};
/**
 * 发表评价
 * @param data 要发送的数据
 */
Ajax.prototype.submitReply = function (data) {
    $.ajax({
       type:'POST',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/submitReply/index.php',
        success:function (result) {
            if(result.status){
                location.reload();
            }else{
                if(result.url){
                    alert(result.msg);
                    if(result.url){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }
                }
            }
        }
    });
};
/**
 * 删除消息
 * @param data 发送的数据，对象。要删除消息的id
 * @param removeElem 要移除的元素
 */
Ajax.prototype.deleteNotes = function (data,removeElem) {
    $.ajax({
       type:'GET',
        data:data,
        url:'/thesis/src/PHP/deleteNotes/index.php',
        dataType:'json',
        success:function (result) {
            if(result.status){
                removeElem.remove();
            }else{
                if(result.url){
                    alert(result.msg);
                    if(result.url){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }
                }
            }
        }
    });
};
var ajax = new Ajax();
module.exports = ajax;