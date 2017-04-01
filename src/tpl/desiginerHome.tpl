<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>设计师主页</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/css/desiginerHome.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{if $admin eq true}
    {include file="adminHeader.tpl"}
    {else}
    {include file="header.tpl"}
{/if}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <div class="m-header f-marTop-40 f-center f-text-c">
        <img src="/thesis/src/{$desigerMess.img}">
        <p class="name">{$desigerMess.name}</p>
        <div class="desc f-text-l">
            <div class="title f-marBtm-10">{$desigerMess.intro}</div>
            <div class="handle">
                <span class="zp">{$zpNum}</span>
                <span class="fen">{$fenNum}</span>
            </div>
        </div>
    </div>
    <!-- 作品列表-->
    {if $zpNum gt 0}
        {if $admin eq true }
            <ul class="m-zpList f-center f-marTop-30" data-search="%%" data-role="admin" data-maxPage="{$maxpage}" data-status="home" data-email="{$desigerMess.email}" id="list">
            {else}
            <ul class="m-zpList f-center f-marTop-30" data-search="%%" data-role="desi" data-maxPage="{$maxpage}" data-status="home" data-email="{$desigerMess.email}" id="list">
        {/if}
                {foreach $zpMessage as $item}
                <li class="item f-area-bg f-marTop-20 f-paddTopBtm-20 f-paddLR-30">
                    {if $admin eq true}
                        <a href="/thesis/src/PHP/show/adminZPdetail.php?code={$item.zpCode}" class="img">
                        {else}
                            <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}" class="img">
                    {/if}
                        <img src="/thesis/src/{$item.img}">
                    </a>
                    <div class="desc">
                        <p class="title">
                            {if $admin eq true}
                            <a href="/thesis/src/PHP/show/adminZPdetail.php?code={$item.zpCode}">
                            {else}
                            <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}">
                            {/if}
                                {$item.title}
                            </a>
                        </p>
                        <div class="handel">
                            <span class="time">{$item.time}</span>
                            <span class="good">{$item.likeNum}</span>
                            <span class="discuss">{$item.discussNum}</span>
                        </div>
                    </div>
                </li>
                {/foreach}
            </ul>
                <div class="loading f-text-c f-marTop-10" id="loading">
                    <img src="/thesis/src/user/css/ajax-loader.gif">
                </div>
        {else}
        <p>该设计师还没有作品</p>
    {/if}
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/production.js"></script>
</body>
</html>