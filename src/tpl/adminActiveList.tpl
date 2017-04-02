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
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox" id="searchBox" data-role="admin">
            <input type="text" placeholder="输入活动标题" class="content f-float-l" id="content">
            <input type="button" value="提交" class="btn f-float-l" id="submit">
            <a href="/thesis/src/PHP/show/adminAddActive.php" class="btn f-float-l addBtn">添加活动</a>
        </div>

    </div>
    {if $length gt 0}
        <!-- 活动列表-->
        <ul class="m-list f-marTop-30 f-center" id="activeList" data-search="%%" data-maxPage="{$maxpage}" data-role="admin">
            {foreach $result as $item}
                <li class="item f-paddTopBtm-20 f-paddLR-30 f-area-bg f-marTop-20" data-code="{$item.activeCode}">
                    <div class="head f-marBtm-10">
                        <h1 class="title">
                            <a href="/thesis/src/PHP/show/adminActivedetail.php?code={$item.activeCode}">{$item.title}</a>

                            {if $item.status eq '2'}
                                <span class="status">(进行中)</span>
                            {elseif $item.status eq '1'}
                                <span class="status">(即将进行)</span>
                            {else}
                                <span class="status">(已结束)</span>
                            {/if}
                        </h1>
                        <div class="desc">
                            <div class="handle f-clearfix">
                                <span class="time f-float-l">{$item.sTime}-{$item.eTime}</span>
                                <div class="f-float-l right">
                                    <span class="zp">{$item.zpNum}</span>
                                    <a href="/thesis/src/PHP/show/adminEditActive.php?code={$item.activeCode}" class="link">
                                        <span class="edit"></span>
                                    </a>
                                    {if $role gt 1}
                                        <span class="delete" data-code="{$item.activeCode}"></span>
                                    {/if}
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="imgBox">
                        <a class="img" href="/thesis/src/PHP/show/adminActivedetail.php?code={$item.activeCode}">
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
        <div class="f-noHave  f-marTop-40 f-text-c">
            <img src="/thesis/src/user/build/img/nohave.png">
            <p>还没有活动</p>
        </div>
    {/if}
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/activeList.js"></script>
</body>
</html>