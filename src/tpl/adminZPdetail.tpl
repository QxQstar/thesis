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
    <div class="m-curZp f-area-bg f-center f-marTop-30 f-paddLR-30 f-paddTopBtm-20" id="curZP">
        <div class="zpBox item f-text-c" data-code="{$zpMessage.zpCode}">
            <img src="/thesis/src/{$zpMessage.img}">
            <div class="desc f-text-l">
                <p class="title">{$zpMessage.title}</p>
                <p class="detail">{$zpMessage.desc}</p>
                <div class="handle">
                    {if $zpMessage.status eq '2'}
                        <span class="mark on"></span>
                    {elseif $zpMessage.status eq '1'}
                        <span class="mark off"></span>
                    {else}
                        <span class="mark wait"></span>
                    {/if}
                    <span class="like" title="已赞">{$zpMessage.likeNum}</span>
                    <span class="time">{$zpMessage.time}</span>
                    {if $zpMessage.status eq '0'}
                        <span class="agree" title="通过"></span>
                        <span class="limit" title="不通过"></span>
                    {/if}
                    {if $role gt 1}
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
        {/if}
    </div>

    <!-- 评价-->
    <div class="m-discuss f-marTop-30 f-center">
        <h1 class="title f-marBtm-10">
            评论
            <span class="num">{$zpMessage.discussNum}</span>
        </h1>
        <!-- 评价列表-->
        {if $discussList|count gt 0}
            <!-- 评价列表-->
            <ul class="m-discList f-marTop-30" id="discList">
                {foreach $discussList as $item}
                    <li class="item f-clearfix f-paddTopBtm-20">
                        <!-- 头像-->
                        <div class="img f-float-l">
                            <img src="/thesis/src/{$item.img}">
                        </div>
                        <!-- 内容-->
                        <div class="rightBox f-float-l">
                            <div class="innerBox">
                                <div class="info">
                                    <span class="name">{$item.email}</span>
                                    <span class="time">{$item.time}</span>
                                </div>
                                <p class="content">
                                    {$item.content|nl2br}
                                </p>
                                {if $item.toEmail neq ''}
                                    <div class="toContent f-marBtm-10 f-marTop-10">
                                        <span class="toname">{$item.toEmail}</span>说:
                                        <p class="reply">{$item.toContent}</p>
                                    </div>
                                {/if}
                            </div>

                        </div>
                    </li>
                {/foreach}
            </ul>
        {else}
            <div class="f-noHave f-marTop-40 f-text-c">
                <img src="/thesis/src/user/build/img/nohave.png">
                <p>暂无评价</p>
            </div>
        {/if}
    </div>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/zpDetail.js"></script>
</body>
</html>