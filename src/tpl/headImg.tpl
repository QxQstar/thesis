<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>头像管理</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/systemAdmin.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{include file="adminHeader.tpl"}
<!--主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60">
    <!-- 管理的类型-->
    <ul class="m-type f-clearfix f-marTop-30 f-area-bg f-center">
        <li class="item  f-float-l on">
            <a href="/thesis/src/PHP/show/adminHeadImg.php">头像管理</a>
        </li>
        <li class="item f-float-l">
            <a href="/thesis/src/PHP/show/adminSafeQues.php">安全问题管理</a>
        </li>
        <li class="item f-float-l">
            <a href="/thesis/src/PHP/show/adminRole.php">权限管理</a>
        </li>
    </ul>
    <!-- 表单-->
    <div class="m-handle f-center f-area-bg f-paddLR-30 f-paddTopBtm-20 f-marTop-10">
        <p class="head f-text-r">
            <button type="button" class="addImg on" id="spread">添加系统头像</button>
            <span class="noSupport">在电脑上操作可上传头像</span>
        </p>
        <form class="body" id="addSystemImg" action="/thesis/src/PHP/addHeadImg/index.php" method="post" enctype="multipart/form-data">
            <div class="item f-marBtm-10">
                <label for="img">
                    选择图片
                </label>
                <input type="file" name="img" id="img" hidden>
                <span class="info">图片尺寸:200px * 200px</span>
            </div>
            <div class="item f-marBtm-10">
                <div class="preview" id="preview" data-width="200" data-height="200"></div>
            </div>
            <div class="item bottom" id="bottom">
                <button type="button" id="submit" class="submit">提交</button>
            </div>
        </form>

    </div>
    <!-- 头像列表-->
    <div  class="m-list f-center f-area-bg f-paddLR-30 f-paddTopBtm-20">
        <ul class="f-clearfix" id="list" data-table="headimg">
            {foreach $list as $item}
                <li class="item f-float-l">
                    <img src="/thesis/src/{$item.img}">
                    <p class="bottom f-text-r">
                        <button class="delete"  data-code="{$item.id}"></button>
                    </p>
                </li>
                {foreachelse}
                没有系统头像
            {/foreach}
        </ul>
    </div>

</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/systemAdmin.js"></script>

</body>
</html>