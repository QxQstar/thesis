<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>权限管理</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/systemAdmin.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<!-- 导航条-->
<header class="g-header" id="header">
    <div class="m-content f-clearfix">
        <img src="/thesis/src/user/img/adminlogo.png" class="logo">
        <div class="control" id="control">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <ul class="navList adminNav f-clearfix" id="navList">
            <li class="item f-float-l">
                <a href="#">作品管理</a>
            </li>
            <li class="item f-float-l">
                <a href="#">用户管理</a>
            </li>
            <li class="item f-float-l">
                <a href="#">活动管理</a>
            </li>
            <li class="item f-float-l">
                <a href="#">上传作品</a>
            </li>
            <li class="item f-float-l">
                <a href="#">系统管理</a>
            </li>
            <!-- 在手机上显示,登录之后将改成个人中心和退出登录-->
            <li class="item f-float-l phone">
                <a href="#">登录</a>
            </li>
        </ul>

        <!-- 在手机上这块区域不存在-->
        <ul class="rightNav f-clearfix">
            <!--<li class="item f-float-r">-->
            <!--<a href="#">个人中心</a>-->
            <!--</li>-->
            <!--<li class="item f-text-r">-->
            <!--<a href="#">退出登录</a>-->
            <!--</li>-->
            <li class="item f-float-r">
                <a href="#" class="signup">
                    <span class="icon"></span>登录
                </a>
            </li>
            <li class="item f-float-r">
                <a href="#" class="signin">
                    <span class="icon"></span>注册
                </a>
            </li>
        </ul>
    </div>
    <div class="mask"></div>
</header>
<!--主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60">
    <!-- 管理的类型-->
    <ul class="m-type f-clearfix f-marTop-30 f-area-bg f-center">
        <li class="item  f-float-l">
            <a href="/thesis/src/PHP/show/adminHeadImg.php">头像管理</a>
        </li>
        <li class="item f-float-l">
            <a href="/thesis/src/PHP/show/adminSafeQues.php">安全问题管理</a>
        </li>
        <li class="item f-float-l on">
            <a href="/thesis/src/PHP/show/adminRole.php">权限管理</a>
        </li>
    </ul>
    <!-- 表单-->
    <div class="m-handle f-center f-area-bg f-paddLR-30 f-paddTopBtm-20 f-marTop-10">
        <p class="head f-text-r">
            <button type="button" class="addRole on" id="spread">添加权限</button>
        </p>
        <form class="body" id="addSystemImg" action="./../PHP/systemAdmin/index.php" method="post" enctype="multipart/form-data">
            <div class="item f-marBtm-10">
                权限代号:<input type="text" name="roleCode" id="roleCode" class="role" data-info="权限代码" placeholder="如：1"/>
            </div>
            <div class="item f-marBtm-10">
                权限描述:<input type="text" name="roleInfo" id="roleInfo" class="role" data-info="权限描述" placeholder="如：高级管理员"/>
            </div>
            <div class="item" id="bottom">
                <button type="button" id="submit" class="submit roleBtn">提交</button>
            </div>
        </form>

    </div>
    <!-- 头像列表-->
    <ul class="m-list m-roles f-center f-area-bg f-paddLR-30 f-paddTopBtm-20">
        {foreach $list as $item}
            <li class="item" data-code="{$item.id}">
                <span class="code">
                    <strong>权限代码:</strong>{$item.code}
                </span>
                <span class="info">
                    <strong>权限描述:</strong>{$item.info}
                </span>
                <span class="delete"></span>
            </li>
            {foreachelse}
            没有权限
        {/foreach}
    </ul>

</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/systemAdmin.js"></script>
</body>
</html>