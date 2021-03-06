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
                    layer.alert(result.msg,function () {
                        location.reload();
                    });

                }
                //上传作品
                if(url === 'issueZP'){
                    if(result.status){
                        layer.alert(result.msg,function () {
                            if(result.url){
                                location.href='/thesis/src/PHP/show/'+result.url;
                            }
                        });
                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

                    }
                }
                if(url === 'issueActive'){
                    if(result.status){
                        layer.alert(result.msg,function () {
                            if(result.url){
                                location.href='/thesis/src/PHP/show/'+result.url;
                            }
                        });

                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

                    }
                }
            }
        });
    }else{
        $.ajax({
            type:'POST',
            url:'/thesis/src/PHP/'+url+'/index.php',
            data:data,
            dataType:'json',
            success:function(result){
                //系统添加权限和安全问题
                if(url === 'systemAdmin'){
                    layer.alert(result.msg,function () {
                        location.reload();
                    });

                }
                //设计师注册
                if(url ==='signin'){
                    if(result.status){
                        layer.alert(result.msg,function () {
                            location.href='/thesis/src/PHP/show/signup.php';
                        });

                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

                    }
                }
                //添加设计师
                if(url ==='adminDesSignin'){
                    if(result.status){
                        layer.alert(result.msg,function () {
                            location.href = '/thesis/src/PHP/show/adminDesiList.php';
                        });

                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

                    }
                }
                //添加管理员
                if(url ==='adminSignin'){
                    if(result.status){
                        layer.alert(result.msg,function () {
                            location.href = '/thesis/src/PHP/show/adminAdList.php';
                        });


                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

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
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

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
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

                    }
                }
                //设计师修改自己的资料
                if(url === 'setMessage'){
                    if(result.status){
                        if(result.url){
                            location.href = '/thesis/src/PHP/show/'+result.url;
                        }else{
                            location.reload(true);
                        }

                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });
                    }
                }
                //设计师|| 管理员修改密码，找回密码，修改安全问题
                if(url === 'verify' || url === 'adminVerify'){
                    if(result.status){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }else{
                        layer.alert(result.msg,function () {
                            if(result.url){
                                location.href = '/thesis/src/PHP/show/'+result.url;
                            }else{
                                location.reload();
                            }
                        });


                    }
                }
                //管理员修改设计师的资料
                if(url === 'adminSetMessage'){
                    if(result.status && result.url){
                        layer.alert(result.msg,function () {
                            location.href = '/thesis/src/PHP/show/'+result.url;
                        });

                    }else{
                        layer.alert(result.msg,function () {
                            location.reload();
                        });

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
                if(typeof elem.attr('class') === 'string' && elem.attr('class').indexOf('delete') < 0){
                    elem.text(result.data);
                }

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
 * * @param elem 要删除的节点
 */
Ajax.prototype.deleteZP = function (data,elem) {
    $.ajax({
        type:'GET',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/deleteZP/index.php',
        success:function (result) {
            if(!result.status){
              if(result.url){
                  location.href = '/thesis/src/PHP/show/'+result.url;
              }
            }else{
                elem.remove();
            }
        }
    });
};
/**
 * 删除用户
 * @param data 要删除用户的编号。对象
 * * @param elem 要删除的节点
 */
Ajax.prototype.deleteUser = function (data,elem) {
    $.ajax({
        type:'GET',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/deleteUser/index.php',
        success:function (result) {
            if(!result.status){
                layer.alert(result.msg,function () {
                    if(result.url){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }
                });
            }else{
                elem.remove();
            }
        }
    });
};
/**
 * 删除活动
 * @param data 发送的数据，对象。活动编号
 * @param elem 要删除的节点
 */
Ajax.prototype.deleteActive = function (data,elem) {
    $.ajax({
        data:data,
        type:"GET",
        url:'/thesis/src/PHP/deleteActive/index.php',
        dataType:'json',
        success:function (result) {
            if(result.status){
                layer.alert(result.msg,function (index) {
                    layer.close(index);
                    elem.remove();
                });

            }else{
                layer.alert(result.msg,function () {
                    if(result.url){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }
                });

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
                layer.alert(result.msg,function () {
                    location.reload();
                });

            }else{
                layer.alert(result.msg,function () {
                    if(result.url){
                        location.href = '/thesis/src/PHP/show/'+result.url;
                    }
                });

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
                    layer.alert(result.msg,function () {
                        if(result.url){
                            location.href = '/thesis/src/PHP/show/'+result.url;
                        }
                    });

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
                    layer.alert(result.msg,function () {
                        if(result.url){
                            location.href = '/thesis/src/PHP/show/'+result.url;
                        }
                    });

                }
            }
        }
    });
};
/**
 * 搜索作品
 * @param data 发送的数据，对象，作品标题
 * @param list 容纳搜索结果的元素
 * @param callback 回调函数
 */
Ajax.prototype.searchZP = function (data,list,callback) {
    $.ajax({
       type:'GET',
        url:'/thesis/src/PHP/searchZP/index.php',
        data:data,
        dataType:'json',
        success:function (result) {
            if(result.status){
                var htmlStr = "";
                if(result.length >0){
                    list.attr({
                        'data-maxPage':result.maxpage,
                        'data-search':data.content
                    });
                    //前台搜索作品
                    if(data.role === 'desi'){
                        var showStr;
                        $.each(result.data,function (index,item) {
                            if(data.status == 'hot'){
                                showStr = '<span class="good">'+ item.likeNum +'</span>';
                            }else{
                                showStr = '<span class="time">'+ item.time +'</span>';
                            }
                            htmlStr +=
                                '<li class="item f-marTop-20 f-text-c f-area-bg f-paddTopBtm-20 f-paddLR-30">' +
                                '<a href="/thesis/src/PHP/show/zpDetail.php?code='+item.zpCode+'" class="img">' +
                                '<img src="/thesis/src/'+item.img+'">'+
                                '</a>'+
                                '<div class="desc f-text-l">' +
                                '<p class="title">' +
                                '<a href="/thesis/src/PHP/show/zpDetail.php?code='+item.zpCode+'">'+item.title+'</a>'+
                                '</p>'+
                                '<div class="handle">' +
                                showStr+
                                '</div>'+
                                '</div>'+
                                '</li>'
                        });
                        list.html(htmlStr);
                    }
                    //后台搜索作品
                    else{
                        var deleteEdit,role,check;
                        role = result.role|0;
                        $.each(result.data,function (index,item) {
                            if(role < 1){
                                deleteEdit = '';
                            }else{
                                deleteEdit =
                                    '<span class="delete" data-code="'+item.zpCode+'"></span>'+
                                    '<a href="/thesis/src/PHP/show/adminEditZP.php?zpCode='+item.zpCode+'" class="link">' +
                                        '<span class="edit"></span>'+
                                    '</a>';
                            }
                            if(item.status === '0'){
                                check =
                                    '<span class="agree" title="通过"></span>'+
                                    ' <span class="limit" title="不通过"></span>';
                            }else if(item.status === '2'){
                                check =
                                    '<span class="good">'+item.likeNum+'</span>';
                            }else{
                                check = '';
                            }
                            htmlStr +=
                                '<li class="item f-marTop-20 f-text-c f-area-bg f-paddTopBtm-20 f-paddLR-30" data-code="'+item.zpCode+'">' +
                                    '<a href="/thesis/src/PHP/show/adminZPdetail.php?code='+item.zpCode+'" class="img">' +
                                        '<img src="/thesis/src/'+item.img+'">'+
                                    '</a>'+
                                    '<div class="desc f-text-l">' +
                                        '<p class="title">' +
                                            '<a href="/thesis/src/PHP/show/adminZPdetail.php?code='+item.zpCode+'">'+item.title+'</a>'+
                                        '</p>'+
                                        '<div class="handle">' +
                                            '<span class="time">'+item.time+'</span>'+
                                            check+
                                            deleteEdit+
                                        '</div>'+
                                    '</div>'+
                                '</li>';
                        });
                        list.html(htmlStr);
                    }
                }else{
                    list.attr({
                        'data-maxPage':0,
                        'data-search':data.content
                    });
                    htmlStr = '<div class="no-result f-text-c">' +
                                    '<img src="/thesis/src/user/build/img/blank2.png" style="width:70%">'+
                                '</div>';
                    list.html(htmlStr);
                }
                if(typeof callback === 'function'){
                    callback();
                }
            }else{
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 搜索用户
 * @param data 发送的数据，对象，账或者昵称
 * @param list 容纳搜索结果的元素
 * @param callback 回调函数
 */
Ajax.prototype.searchUser = function (data,list,callback) {
    $.ajax({
        type:'GET',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/searchUser/index.php',
        success:function (result) {
            if(result.status){
                var htmlStr = '';
                if(result.length > 0){
                    list.attr({
                        'data-maxPage':result.maxpage,
                        'data-search':data.content
                    });
                    //如果在前台搜索设计师
                    if(data.status === 'desi'){
                        var link,name;
                        $.each(result.data,function (index,item) {
                            if(result.isLog && item.email == result.curEmail){
                                link = '<a href="/thesis/src/PHP/show/userCenter.php" class="img">';
                            }else{
                                link = '<a href="/thesis/src/PHP/show/designerHome.php?email='+item.email+'" class="img">';
                            }
                            if(item.nickname){
                                name = item.nickname;
                            }else{
                                name = item.email;
                            }
                            htmlStr +=
                                '<li class="item f-float-l">' +
                                    link+
                                        '<img src="/thesis/src/'+item.img+'">'+
                                    '</a>'+
                                    '<div class="desc">' +
                                        '<p class="title">' +
                                            name+
                                        '</p>'+
                                        '<div class="handle">' +
                                            '<span class="fen">'+item.focus+'</span>'+
                                        '</div>'+
                                    '</div>'+
                                '</li>';
                        });
                        list.html(htmlStr);
                    }
                    //后台搜索设计师
                    else if(data.status === 'admin' && data.table === 'designermessage'){
                        var nickname;
                        $.each(result.data,function (index, item) {
                            if(item.nickname){
                                nickname = item.nickname;
                            }else{
                                nickname = 'null';
                            }
                            htmlStr +=
                                '<li class="items">' +
                                    '<div class="f-clearfix">' +
                                        '<div class="right f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">'+item.time+'</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<button type="button" class="delete" data-code="'+item.email+'"></button>'+
                                            '</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<a class="edit" href="/thesis/src/PHP/show/adminEditUser.php?email='+item.email+'"></a>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class="left f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">' +
                                                '<span class="info">账号:</span><a href="/thesis/src/PHP/show/designerHome.php?role=admin&&email='+item.email+'">'+item.email+'</a>'+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">昵称:</span>'+nickname+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">密码:</span>'+item.password+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</li>';
                        });
                        list.html(htmlStr);
                    }
                    //后台搜索管理员
                    else{
                        $.each(result.data,function (index,item) {
                            htmlStr +=
                                '<li class="items">' +
                                    '<div class="f-clearfix">' +
                                        '<div class="right f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">'+item.time+'</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<button type="button" class="delete" data-code="'+item.code+'"></button>'+
                                            '</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<a class="edit" href="/thesis/src/PHP/show/adminEditAd.php?code='+item.code+'"></a>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class="left f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">' +
                                                '<span class="info">账号:</span>'+item.code+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">角色:</span>'+item.info+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">密码:</span>'+item.password+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</li>';
                        });
                        list.html(htmlStr);
                    }
                    if(typeof callback === 'function'){
                        callback();
                    }
                }else{
                    list.attr({
                        'data-maxPage':0,
                        'data-search':data.content
                    });
                    htmlStr = '<div class="no-result f-text-c">' +
                        '<img src="/thesis/src/user/build/img/blank2.png" style="width:70%">'+
                        '</div>';
                    list.html(htmlStr);
                }
                if(typeof callback === 'function'){
                    callback();
                }
            }else{
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 搜索活动
 * @param data 发送的数据，对象
 * @param list 容纳搜索结果的元素
 * @param callback 回调函数
 */
Ajax.prototype.searchActive = function (data,list,callback) {
    $.ajax({
        type:'GET',
        data:data,
        dataType:'json',
        url:'/thesis/src/PHP/searchActive/index.php',
        success:function (result) {
            if(result.status){
                var htmlStr='';
                if(result.length > 0){
                    list.attr({
                        'data-maxPage':result.maxpage,
                        'data-search':data.content
                    });
                    var right,status,link;
                    if(result.role <= 0){
                        link = 'activeDetail.php';
                    }else{
                        link = 'adminActivedetail.php';
                    }
                    $.each(result.data,function (index,item) {
                        if(item.status == '2'){
                            status = '<span class="status">(进行中)</span>';
                        }else if(item.status == '1'){
                            status ='<span class="status">(即将开始)</span>';
                        }else{
                            status ='<span class="status">(已结束)</span>';
                        }
                        if(result.role <= 0){
                            right = '<span class="zp">'+item.zpNum+'</span>'

                        }else if(result.role <= 1){
                            right =
                                '<div class="f-float-l right">' +
                                    '<span class="zp">'+item.zpNum+'</span>'+
                                    '<a href="/thesis/src/PHP/show/adminEditActive.php?code='+item.activeCode+'" class="link">' +
                                        '<span class="edit"></span>'+
                                    '</a>'+
                                '</div>';
                        }else{
                            right =
                                '<div class="f-float-l right">' +
                                    '<span class="zp">'+item.zpNum+'</span>'+
                                    '<a href="/thesis/src/PHP/show/adminEditActive.php?code='+item.activeCode+'" class="link">' +
                                        '<span class="edit"></span>'+
                                    '</a>'+
                                    '<span class="delete" data-code="'+item.activeCode+'"></span>'+
                                '</div>';
                        }
                        htmlStr +=
                            '<li class="item f-paddTopBtm-20 f-paddLR-30 f-area-bg f-marTop-20" data-code="'+item.activeCode+'">' +
                                '<div class="head f-marBtm-10">' +
                                    '<h1 class="title">' +
                                        '<a href="/thesis/src/PHP/show/'+ link +'?code='+item.activeCode+'">'+item.title+'</a>'+ status+
                                    '</h1>'+
                                    '<div class="desc">' +
                                        '<div class="handle f-clearfix">' +
                                            '<span class="time f-float-l">'+item.sTime+'-'+item.eTime+'</span>'+
                                            right+
                                        '</div>'+
                                    '</div>'+
                                '</div>'+
                                '<div class="imgBox">' +
                                    '<a class="img" href="/thesis/src/PHP/show/'+link+'.php?code='+item.activeCode+'">' +
                                        '<img src="/thesis/src/'+item.img+'">'+
                                    '</a>'+
                                '</div>'+
                            '</li>';
                    });
                    list.html(htmlStr);
                    if(typeof callback === 'function'){
                        callback();
                    }
                }else{
                    list.attr({
                        'data-maxPage':0,
                        'data-search':data.content
                    });
                    htmlStr = '<div class="no-result f-text-c">' +
                        '<img src="/thesis/src/user/build/img/blank2.png" style="width:70%">'+
                        '</div>';
                    list.html(htmlStr);
                }
                if(typeof callback === 'function'){
                    callback();
                }
            }else{
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 加载活动
 * @param data 要发送的数据
 * @param container 容器，jquery对象
 * @param loadAfter  加载结束要执行函数
 * @param loadBefore 加载之前要执行的函数
 */
Ajax.prototype.loadingActive = function (data,container,loadAfter,loadBefore) {
    $.ajax({
        data:data,
        type:'GET',
        dataType:'json',
        url:'/thesis/src/PHP/loadActive/index.php',
        beforeSend:function () {
            loadBefore();
        },
        success:function (result) {
            if(result.status){
                var right,status,htmlStr='',beforeHtml,link;
                if(result.role <= 0){
                    link = 'activeDetail.php';
                }else{
                    link = 'adminActivedetail.php';
                }
                $.each(result.data,function (index,item) {
                    if(item.status == '2'){
                        status = '<span class="status">(进行中)</span>';
                    }else if(item.status == '1'){
                        status ='<span class="status">(即将开始)</span>';
                    }else{
                        status ='<span class="status">(已结束)</span>';
                    }
                    if(result.role <= 0){
                        right = '<span class="zp">'+item.zpNum+'</span>'
                    }else if(result.role <= 1){
                        right =
                            '<div class="f-float-l right">' +
                            '<span class="zp">'+item.zpNum+'</span>'+
                            '<a href="/thesis/src/PHP/show/adminEditActive.php?code='+item.activeCode+'" class="link">' +
                            '<span class="edit"></span>'+
                            '</a>'+
                            '</div>';
                    }else{
                        right =
                            '<div class="f-float-l right">' +
                            '<span class="zp">'+item.zpNum+'</span>'+
                            '<a href="/thesis/src/PHP/show/adminEditActive.php?code='+item.activeCode+'" class="link">' +
                            '<span class="edit"></span>'+
                            '</a>'+
                            '<span class="delete" data-code="'+item.activeCode+'"></span>'+
                            '</div>';
                    }
                    htmlStr +=
                        '<li class="item f-paddTopBtm-20 f-paddLR-30 f-area-bg f-marTop-20" data-code="'+item.activeCode+'">' +
                        '<div class="head f-marBtm-10">' +
                        '<h1 class="title">' +
                        '<a href="/thesis/src/PHP/show/'+link+'?code='+item.activeCode+'">'+item.title+'</a>'+ status+
                        '</h1>'+
                        '<div class="desc">' +
                        '<div class="handle f-clearfix">' +
                        '<span class="time f-float-l">'+item.sTime+'-'+item.eTime+'</span>'+
                        right+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '<div class="imgBox">' +
                        '<a class="img" href="/thesis/src/PHP/show/'+link+'?code='+item.activeCode+'">' +
                        '<img src="/thesis/src/'+item.img+'">'+
                        '</a>'+
                        '</div>'+
                        '</li>';
                });
                beforeHtml = container.html();
                container.html(beforeHtml + htmlStr);
                loadAfter();
            }else{
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 加载作品
 * @param data 要发送的数据
 * @param container 容器，jquery对象
 * @param loadAfter  加载结束要执行函数
 * @param loadBefore 加载之前要执行的函数
 */
Ajax.prototype.loadingZP = function (data, container, loadAfter, loadBefore) {
    $.ajax({
        type:"GET",
        url:'/thesis/src/PHP/loadingZP/index.php',
        dataType:'json',
        data:data,
        beforeSend:function () {
            loadBefore();
        },
        success:function (reslut) {
            if(reslut.status){
                var htmlStr = '',show,delOrEdit,link,beforeHtml;
                if(data.status === 'me0' || data.status === 'me2' || data.status === 'me1'){
                    link = 'zpDetail.php?role=me&&';
                }else if(data.status === 'new' || data.status === 'hot' || (data-status === 'home' && data.role === 'desi')){
                    link ='zpDetail.php?';
                }else{
                    link = 'adminZPdetail.php?';
                }
                $.each(reslut.data,function (index, elem) {
                    show = "";
                    //前台
                    if(data.role === 'desi'){
                        if(data.status === 'me0'){
                            show = '<span class="time">'+elem.time+'</span>';
                            delOrEdit = '<span class="delete" data-code="'+elem.zpCode+'"></span>'+
                                        '<a href="/thesis/src/PHP/show/editZP.php?zpCode='+elem.zpCode+'" class="link">' +
                                            '<span class="edit"></span>'+
                                        '</a>'
                        }else if(data.status ==='me1'){
                            show = '<span class="time">'+elem.time+'</span>';
                            delOrEdit = '<span class="delete" data-code="'+elem.zpCode+'"></span>'+
                                '<a href="/thesis/src/PHP/show/editZP.php?zpCode='+elem.zpCode+'" class="link">' +
                                '<span class="edit"></span>'+
                                '</a>'
                        }else if(data.status === 'me2'){
                            show =
                                '<span class="time">'+elem.time+'</span>'+
                                '<span class="good">'+elem.likeNum+'</span>'+
                                '<span class="discuss">'+elem.discussNum+'</span>';
                            delOrEdit = '<span class="delete" data-code="'+elem.zpCode+'"></span>'+
                                '<a href="/thesis/src/PHP/show/editZP.php?zpCode='+elem.zpCode+'" class="link">' +
                                '<span class="edit"></span>'+
                                '</a>'
                        }else if(data.status === 'new'){
                            show = '<span class="time">'+elem.time+'</span>';
                            delOrEdit ='';
                        }else{
                            if(data.status === 'home'){
                                show = '<span class="time">'+elem.time+'</span>';
                            }else{
                                show = '';
                            }
                            show +=
                                '<span class="good">'+elem.likeNum+'</span>'+
                                '<span class="discuss">'+elem.discussNum+'</span>';
                            delOrEdit ='';
                        }
                    }
                    //后台
                    else{
                        if(elem.status ==='0'){
                            show = '<span class="time">'+elem.time+'</span>'+
                                    '<span class="agree" title="通过"></span>'+
                                    '<span class="limit" title="不通过"></span>';
                        }else if(elem.status ==='2' || data.status === 'home'){
                            show =
                                '<span class="time">'+elem.time+'</span>'+
                                '<span class="good">'+elem.likeNum+'</span>'+
                                '<span class="discuss">'+elem.discussNum+'</span>';
                        }else{
                            show = '<span class="time">'+elem.time+'</span>';
                        }
                        if(reslut.role > 1){
                            delOrEdit = '<span class="delete" data-code="'+elem.zpCode+'"></span>'+
                                        '<a href="/thesis/src/PHP/show/adminEditZP.php?zpCode='+elem.zpCode+'" class="link">' +
                                            '<span class="edit"></span>'+
                                        '</a>'
                        }else{
                            delOrEdit = '';
                        }
                    }
                    htmlStr +=
                        '<li class="item f-marTop-20 f-text-c f-area-bg f-paddTopBtm-20 f-paddLR-30" data-code="'+elem.zpCode+'">' +
                            '<a href="/thesis/src/PHP/show/'+link+'code='+elem.zpCode+'" class="img">' +
                                '<img src="/thesis/src/'+elem.img+'">'+
                            '</a>'+
                            '<div class="desc f-text-l">' +
                                '<p class="title">' +
                                    '<a href="/thesis/src/PHP/show/'+link+'code='+elem.zpCode+'">'+elem.title+'</a>'+
                                '</p>'+
                            '<div class="handle">' +
                                show+
                                delOrEdit+
                            '</div>'+
                        '</li>';
                });
                beforeHtml = container.html();
                container.html(beforeHtml+htmlStr);
                loadAfter();
            }else{
                if(reslut.url){
                    location.href = '/thesis/src/PHP/show/'+reslut.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 加载用户
 * @param data 要发送的数据
 * @param container 容器，jquery对象
 * @param loadAfter  加载结束要执行函数
 * @param loadBefore 加载之前要执行的函数
 */
Ajax.prototype.loadingUser = function (data, container, loadAfter, loadBefore) {
    $.ajax({
        type:"GET",
        url:'/thesis/src/PHP/loadingUser/index.php',
        dataType:'json',
        data:data,
        beforeSend:function () {
            loadBefore();
        },
        success:function (result) {
            if(result.status){
                var htmlStr = '',beforeHtml;
                //前台加载设计师
                if(data.role === 'desi'){
                    var link,name;
                    $.each(result.data,function (index,item) {
                        if(item.email == result.curEmail){
                            link = '<a href="/thesis/src/PHP/show/userCenter.php" class="img">';
                        }else{
                            link = '<a href="/thesis/src/PHP/show/designerHome.php?email='+item.email+'" class="img">';
                        }
                        if(item.nickname){
                            name = item.nickname;
                        }else{
                            name = item.email;
                        }
                        htmlStr +=
                            '<li class="item f-float-l">' +
                                link+
                                    '<img src="/thesis/src/'+item.img+'">'+
                                '</a>'+
                                '<div class="desc">' +
                                    '<p class="title">' +
                                         name+
                                    '</p>'+
                                    '<div class="handle">' +
                                        '<span class="fen">'+item.focus+'</span>'+
                                    '</div>'+
                                '</div>'+
                            '</li>';
                    });
                }
                //后台加载
                else{
                    //设计师
                    if(data.table === 'designermessage'){
                        var nickname;
                        $.each(result.data,function (index, item) {
                            if(item.nickname){
                                nickname = item.nickname;
                            }else{
                                nickname = 'null';
                            }
                            htmlStr +=
                                '<li class="items">' +
                                    '<div class="f-clearfix">' +
                                        '<div class="right f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">'+item.time+'</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<button type="button" class="delete" data-code="'+item.email+'"></button>'+
                                            '</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<a class="edit" href="/thesis/src/PHP/show/adminEditUser.php?email='+item.email+'"></a>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class="left f-float-r f-clearfix">' +
                                             '<div class="item f-float-l">' +
                                                    '<span class="info">账号:</span><a href="/thesis/src/PHP/show/designerHome.php?role=admin&&email='+item.email+'">'+item.email+'</a>'+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">昵称:</span>'+nickname+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">密码:</span>'+item.password+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</li>';
                        });
                    }
                    //管理员
                    else{
                        $.each(result.data,function (index,item) {
                            htmlStr +=
                                '<li class="items">' +
                                    '<div class="f-clearfix">' +
                                        '<div class="right f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">'+item.time+'</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<button type="button" class="delete" data-code="'+item.code+'"></button>'+
                                            '</div>'+
                                            '<div class="item icon f-float-l">' +
                                                '<a class="edit" href="/thesis/src/PHP/show/adminEditAd.php?code='+item.code+'"></a>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class="left f-float-r f-clearfix">' +
                                            '<div class="item f-float-l">' +
                                                '<span class="info">账号:</span>'+item.code+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">角色:</span>'+item.info+
                                            '</div>'+
                                            '<div class="item f-float-l">' +
                                                '<span class="info">密码:</span>'+item.password+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</li>';
                        });
                    }
                }
            beforeHtml = container.html();
            container.html(beforeHtml+htmlStr);
            loadAfter();
            }else{
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
/**
 * 翻页
 * @param data 要发送的数据
 * @param list 容器
 * @param before 请求发送前的回调
 * @param after 请求成功的回调
 */
Ajax.prototype.turnPage = function (data, list, before, after) {
    $.ajax({
        type:'GET',
        data:data,
        url:'/thesis/src/PHP/turnPage/index.php',
        dataType:'json',
        beforeSend:function () {
            before();
        },
        success:function (result) {
            if(result.status){
                var htmlStr = '';
                $.each(result.data,function (index,focusItem) {
                    var name;
                    if(focusItem.nickname){
                        name = focusItem.nickname;
                    }else{
                        name = focusItem.email;
                    }
                    htmlStr +=
                        '<li class="item f-float-l">' +
                            '<span class="delete" data-code="'+focusItem.email+'"></span>'+
                            '<a href="/thesis/src/PHP/show/designerHome.php?email='+focusItem.email+'">' +
                                '<img src="/thesis/src/'+focusItem.img+'">'+
                            '</a>'+
                            '<p class="name">'+name+'</p>'+
                        '</li>';
                });
                list.html(htmlStr);
                after();
            }else{
                if(result.url){
                    location.href = '/thesis/src/PHP/show/'+result.url;
                }else{
                    location.href = '/thesis/src/PHP/show/index.php';
                }
            }
        }
    });
};
var ajax = new Ajax();
module.exports = ajax;