<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>活动详情</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/activeDetail.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 活动介绍-->
    <div class="m-introduce f-marTop-30 f-center f-area-bg f-paddLR-30 f-paddTopBtm-20">
        <!-- 活动头图-->
        <div class="img f-marBtm-10">
            <img src="/thesis/src/{$activeMess.img}">
        </div>
        <!-- 活动介绍-->
        <div class="intro">
            <h1 class="title">
                {$activeMess.title}
                {if $activeMess.status eq '2'}
                    <span class="status">(进行中)</span>
                {elseif $activeMess.status eq '1'}
                    <span class="status">(即将开始)</span>
                {else}
                    <span class="status">(已结束)</span>
                {/if}
            </h1>
            <div class="desc">
                <div class="handle">
                    <span class="time">{$activeMess.sTime}-{$activeMess.eTime}</span>
                    <span class="zp">{$num}</span>
                </div>
                <div class="detail">
                    {$activeMess.intro|nl2br}
                </div>
            </div>
        </div>
    </div>
        <!-- 投稿-->
    {if $activeMess.status eq '2'}
        <div class="m-upload f-center f-text-c f-marTop-30">
            <a href="/thesis/src/PHP/show/upload.php?code={$activeMess.activeCode}" class="submit">参加活动</a>
        </div>
    {/if}
    {if $num gt 0}
        <!-- 推荐作品-->
        <div class="m-recommend f-marTop-30 f-center">
            <h2 class="title f-marBtm-10">推荐作品</h2>
            <!-- 推荐的作品列表-->
            <ul class="list f-clearfix m-otherZp m-otherZp" id="otherZP">
                {foreach $zpList as $item}
                    <li class="item f-float-l f-marBtm-10">
                        <a class="img" href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}">
                            <img src="/thesis/src/{$item.img}">
                        </a>
                        <div class="desc">
                            <p class="title">{$item.title}</p>
                            <div class="desc">
                                <span class="good">{$item.likeNum}</span>
                            </div>
                        </div>
                    </li>
                {/foreach}
            </ul>
        </div>
        {else}
        <div class="f-noHave f-marTop-40 f-text-c">
            <img src="/thesis/src/user/build/img/nohave.png">
            <p>这个活动还没有作品</p>
        </div>
    {/if}

</div>
<!-- 页脚-->
<div class="g-footer f-text-c">
    <p>基于PHP技术的平面设计师站</p>
    <p>指导老师：罗佳</p>
    <p>组员：骞敬棠，秦小倩，贾从有，杨帆</p>
</div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/activeDetail.js"></script>
</body>
</html>