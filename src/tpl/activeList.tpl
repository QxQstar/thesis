<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>活动列表</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/activeList.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox" id="searchBox" data-role="desi">
            <input type="text" placeholder="输入活动标题" class="content f-float-l" id="content">
            <input type="button" value="提交" class="btn f-float-l" id="submit">
        </div>

    </div>
    {if $length gt 0}
    <!-- 活动列表-->
    <ul class="m-list f-marTop-30 f-center" id="activeList" data-maxPage="{$maxpage}" data-role="desi" data-search="%%">
        {foreach $result as $item}
        <li class="item f-paddTopBtm-20 f-paddLR-30 f-area-bg f-marTop-20" data-code="{$item.activeCode}">
            <div class="head f-marBtm-10">
                <h1 class="title">
                    <a href="/thesis/src/PHP/show/activeDetail.php?code={$item.activeCode}">{$item.title}</a>

                    {if $item.status eq '2'}
                        <span class="status">(进行中)</span>
                        {elseif $item.status eq '1'}
                        <span class="status">(即将开始)</span>
                        {else}
                        <span class="status">(已结束)</span>
                    {/if}
                </h1>
                <div class="desc">
                    <div class="handle">
                        <span class="time">{$item.sTime}-{$item.eTime}</span>
                        <span class="zp">{$item.zpNum}</span>
                    </div>
                </div>
            </div>
            <div class="imgBox">
                <a class="img" href="/thesis/src/PHP/show/activeDetail.php?code={$item.activeCode}">
                    <img src="/thesis/src/{$item.img}">
                </a>
            </div>
        </li>
        {/foreach}
    </ul>
        <div class="loading f-text-c f-marTop-10" id="loading">
            <img src="/thesis/src/user/css/ajax-loader.gif">
        </div>
        {else}
        <div class="f-noHave f-marTop-40 f-text-c">
            <img src="/thesis/src/user/build/img/nohave.png">
            <p>还没有活动</p>
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
<script type="text/javascript" src="/thesis/src/user/build/js/activeList.js"></script>
</body>
</html>