<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>作品详情页</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/zpDetail.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 当前作品-->
    <div class="m-curZp f-area-bg f-center f-marTop-30 f-paddLR-30 f-paddTopBtm-20">
        <div class="zpBox">
            <img src="/thesis/src/{$zpMessage.img}">
            <div class="desc">
                <p class="title">{$zpMessage.title}</p>
                <p class="detail">{$zpMessage.desc}</p>
                <div class="handle">
                    <span class="good" title="已赞">12</span>
                    <span class="time">{$zpMessage.time}</span>
                    {if $zpMessage.status eq '0'}
                        <span class="agree" title="通过"></span>
                        <span class="limit" title="不通过"></span>
                    {/if}
                    {if $role gt 1}
                        <span class="delete"></span>
                        <a href="/thesis/src/PHP/show/adminEditZP.php?zpCode={$zpMessage.zpCode}" class="link">
                            <span class="edit"></span>
                        </a>
                    {/if}
                </div>
            </div>
        </div>
        <div class="authorBox">
            <div class="interBox f-text-c">
                <a href="/thesis/src/PHP/show/designerHome.php?role=admin&&email={$designMess.email}">
                    <img src="/thesis/src/{$designMess.img}" alt="设计师头像">
                </a>
                <p class="name f-text-c">{$designMess.name}</p>
                {*<button class="focus f-text-c" type="button">关注</button>*}
            </div>
        </div>
    </div>

    <!-- 其他作品-->
    <div class="m-otherZp f-area-bg f-center f-paddLR-30 f-paddTopBtm-20 f-clearfix" id="otherZP">
        {if $otherZP|count gt 0}
        <ul class="list">
            {foreach $otherZP as $item}
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/adminZPdetail.php?code={$item.zpCode}" class="img">
                    <img src="/thesis/src/{$item.img}">
                </a>
            </li>
            {/foreach}
        </ul>
            {else}
            <p>改设计师还没有其他作品</p>
        {/if}
    </div>

    <!-- 评价-->
    <div class="m-discuss f-marTop-30 f-center">
        <h1 class="title f-marBtm-10">
            评论
            <span class="num">22</span>
        </h1>
        <!-- 评论框-->
        {*<div class="discBox">*}
            {*<div>*}
                {*<label for="import">*}
                    {*<textarea class="import" id='import' placeholder="扯淡，吐槽，表扬，鼓励...想说啥就说啥！"></textarea>*}

                {*</label>*}
                {*<span class="notice" id="notice">0/300</span>*}
            {*</div>*}
            {*<div class="f-text-r">*}
                {*<button class="discBtn f-marTop-20" id="submit">发表评价</button>*}
            {*</div>*}
        {*</div>*}
        <!-- 评价列表-->
        <ul class="discList f-marTop-30 ">
            <li class="item f-clearfix f-paddTopBtm-20">
                <!-- 头像-->
                <a href="#">
                    <img src="./../user/img/header.jpg" class="f-float-l">
                </a>
                <!-- 内容-->
                <div class="rightBox f-float-l">
                    <div class="info">
                        <span class="name">昵称</span>
                        <span class="time">2017-1-2</span>
                    </div>
                    <p class="content">
                        内容内容
                    </p>
                </div>
            </li>
            <li class="item f-clearfix f-paddTopBtm-20">
                <!-- 头像-->
                <a href="#">
                    <img src="./../user/img/header.jpg" class="f-float-l">
                </a>
                <!-- 内容-->
                <div class="rightBox f-float-l">
                    <div class="info">
                        <span class="name">昵称</span>
                        <span class="time">2017-1-2</span>
                    </div>
                    <p class="content">
                        内容内容
                    </p>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/zpDetail.js"></script>
</body>
</html>