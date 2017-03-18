<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>活动列表</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/activeList.css">
</head>
<body>
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    {if $length gt 0}
    <!-- 活动列表-->
    <ul class="m-list f-marTop-30 f-center">
        {foreach $result as $item}
        <li class="item f-paddTopBtm-20 f-paddLR-30 f-area-bg f-marTop-20" data-code="{$item.activeCode}">
            <div class="head f-marBtm-10">
                <h1 class="title">
                    <a href="/thesis/src/PHP/show/activeDetail/php?code={$item.activeCode}">{$item.title}</a>

                    {if $item.status eq '1'}
                        <span class="status">(进行中)</span>
                        {else}
                        <span class="status">(已结束)</span>
                    {/if}
                </h1>
                <div class="desc">
                    <div class="handle">
                        <span class="time">{$item.sTime}-{$item.eTime}</span>
                        <span class="zp">20</span>
                    </div>
                </div>
            </div>
            <div class="imgBox">
                <a class="img" href="/thesis/src/PHP/show/activeDetail/php?code={$item.activeCode}">
                    <img src="/thesis/src/{$item.img}">
                </a>
            </div>
        </li>
        {/foreach}
    </ul>
    <!-- 翻页-->
    <div class="m-page f-area-bg f-marTop-30 f-text-r f-center f-paddTopBtm-20 f-paddLR-30">
        <button type="button" class="page" id="prev">上一页</button>
        <button type="button" class="page" id="next">下一页</button>
    </div>
        {else}
        <p>不存在活动</p>
    {/if}
</div>
<!-- 页脚-->
<div class="g-footer"></div>
</body>
</html>