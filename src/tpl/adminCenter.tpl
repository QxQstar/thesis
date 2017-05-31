<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>管理员的个人中心</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">
    <!--页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/setMessage.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file='adminHeader.tpl'}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <div class="m-adminCenter f-marTop-30 f-center f-paddLR-30 f-paddTopBtm-20 f-area-bg">
        <div class="head f-clearfix f-marBtm-10">
            <h1 class="f-float-l">我的资料</h1>
        </div>
        <ul class="body">
            <li class="item">
                <span>账号:</span>
                <span class="zhanghao">{$message.code}</span>
            </li>
            <li class="item">
                <span>角色:</span>
                <span class="role">{$message.roleInfo}</span>
            </li>
        </ul>
        <div class="footer link">
            <a href="/thesis/src/PHP/show/adminModifyPW.php?code={$message.code}">修改密码</a>
            {if $message.hasQuestion eq '1'}
            <a href="/thesis/src/PHP/show/adminModifyQU.php?code={$message.code}">修改安全问题</a>
                {else}
                <a href="/thesis/src/PHP/show/adminModifyQU.php?code={$message.code}">设置安全问题</a>
            {/if}
        </div>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer f-text-c">
    <p>基于PHP技术的平面设计师站</p>
    <p>指导老师：罗佳</p>
    <p>组员：骞敬棠，秦小倩，贾从有，杨帆</p>
</div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>