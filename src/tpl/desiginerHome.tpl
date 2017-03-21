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
        <ul class="m-zpList f-center f-marTop-30">
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
                    <p class="title">{$item.title}</p>
                    <div class="handel">
                        <span class="time">{$item.time}</span>
                        <span class="good">34</span>
                        <span class="discuss">34</span>
                    </div>
                </div>
            </li>
            {/foreach}
        </ul>
        {else}
        <p>该设计师还没有作品</p>
    {/if}

    <!-- 翻页-->
    <div class="m-page f-area-bg f-marTop-30 f-text-r f-center f-paddTopBtm-20 f-paddLR-30">
        <button type="button" class="page" id="prev">上一页</button>
        <button type="button" class="page" id="next">下一页</button>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>