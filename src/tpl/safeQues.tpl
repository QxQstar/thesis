<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>安全问题管理</title>
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
        <li class="item  f-float-l">
            <a href="/thesis/src/PHP/show/adminHeadImg.php">头像管理</a>
        </li>
        <li class="item f-float-l on">
            <a href="/thesis/src/PHP/show/adminSafeQues.php">安全问题管理</a>
        </li>
        <li class="item f-float-l">
            <a href="/thesis/src/PHP/show/adminRole.php">权限管理</a>
        </li>
    </ul>
    <!-- 表单-->
    <div class="m-handle f-center f-area-bg f-paddLR-30 f-paddTopBtm-20 f-marTop-10">
        <p class="head f-text-r">
            <button type="button" class="addSafe on" id="spread">添加安全问题</button>
        </p>
        <form class="body" id="addSystemImg" action="./../PHP/systemAdmin/index.php" method="post" enctype="multipart/form-data">
            <div class="item f-marBtm-10">
                安全问题:<input type="text" name="question" id="question" class="question" data-info="问题" placeholder="如：小学班主任的姓名"/>
                <button type="button" id="submit" class="submit">提交</button>
            </div>
            <div class="item" id="bottom">

            </div>
        </form>

    </div>
    <!-- 头像列表-->
    <ul class="m-list m-questions f-center f-area-bg f-paddLR-30 f-paddTopBtm-20" id="list" data-table="questions">
        {foreach $list as $item}
            <li class="item" >
                {$item.question}
                <span class="delete" data-code="{$item.id}"></span>
            </li>
            {foreachelse}
            没有安全问题
        {/foreach}
    </ul>

</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/systemAdmin.js"></script>

</body>
</html>