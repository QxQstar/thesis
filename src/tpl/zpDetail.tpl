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
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 当前作品-->
    <div class="m-curZp f-area-bg f-center f-marTop-30 f-paddLR-30 f-paddTopBtm-20">
        <div class="zpBox" id="zpBox" >
            <img src="/thesis/src/{$zpMessage.img}">
            <div class="desc">
                <p class="title">{$zpMessage.title}</p>
                <p class="detail">{$zpMessage.desc}</p>
                <div class="handle">
                    {if $me eq true}
                        {if $zpMessage.status eq '2'}
                            <span class="mark on"></span>
                            {elseif $zpMessage.status eq '1'}
                            <span class="mark off"></span>
                            {else}
                            <span class="mark wait"></span>
                        {/if}
                    {/if}
                    {if $zpMessage.status eq '2'}
                        {if $like eq true}
                            <span class="good on" title="取消点赞" status="gooded" data-code="{$zpMessage.zpCode}">{$zpMessage.likeNum}</span>
                            {else}
                            <span class="good" title="点赞" status="good" data-code="{$zpMessage.zpCode}">{$zpMessage.likeNum}</span>
                        {/if}
                    {/if}
                    <span class="time">{$zpMessage.time}</span>
                </div>
            </div>
        </div>
        <div class="authorBox">
            <div class="interBox f-text-c">
                {if $curEmail eq false}
                    <a href="/thesis/src/PHP/show/designerHome.php?email={$designMess.email}">
                        {else}
                        {if $curEmail eq $designMess.email}
                            <a href="/thesis/src/PHP/show/userCenter.php">
                                {else}
                                <a href="/thesis/src/PHP/show/designerHome.php?email={$designMess.email}">
                        {/if}
                {/if}
                    <img src="/thesis/src/{$designMess.img}" alt="设计师头像">
                </a>

                <p class="name f-text-c">{$designMess.name}</p>
                {if $curEmail neq $designMess.email}
                    {if $focus eq true}
                        <button class="focus f-text-c" id='focus' status="focused" type="button" data-code="{$designMess.email}">取消关注</button>
                        {else}
                        <button class="focus f-text-c" id='focus' status="focus" type="button" data-code="{$designMess.email}">关注</button>
                    {/if}
                {/if}

            </div>
        </div>
    </div>

    <!-- 其他作品-->
    <div class="m-otherZp f-area-bg f-center f-paddLR-30 f-paddTopBtm-20 f-clearfix" id="otherZP">
        {if $otherZP|count gt 0}
            <ul class="list">
                {foreach $otherZP as $item}
                    <li class="item f-float-l">
                        <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}" class="img">
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
            <span class="num">{$zpMessage.discussNum}</span>
        </h1>
        <!-- 评论框-->
        <div class="discBox">
            <div>
                <label for="import">
                    <textarea class="import" id='import' placeholder="扯淡，吐槽，表扬，鼓励...想说啥就说啥！"></textarea>

                </label>
                <span class="notice" id="notice">0/300</span>
            </div>
            <div class="f-text-r">
                <button class="discBtn f-marTop-20" id="submit">发表评价</button>
            </div>
        </div>
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