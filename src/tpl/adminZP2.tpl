<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>作品管理——已上线的作品</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/zpList.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox" data-role="admin" id="searchBox">
            <input type="text" placeholder="输入作品标题" class="content f-float-l" id="content">
            <input type="button" value="提交" class="btn f-float-l" id="submit">
        </div>
        <div class="info f-float-l">
            <h1 ><a href="/thesis/src/PHP/show/adminZP0.php">待审核</a> </h1>
            <h1 class="on"><a href="/thesis/src/PHP/show/adminZP2.php">已上线</a> </h1>
            <h1><a href="/thesis/src/PHP/show/adminZPall.php">全部作品</a> </h1>
        </div>
    </div>

    <!-- 作品列表-->
    {if $length gt 0}
        <ul class="m-list f-marTop-30  f-center" id="list">
            {foreach $result as $item}
                <li class="item f-marTop-20 f-area-bg f-paddTopBtm-20 f-paddLR-30" data-code="{$item.zpCode}">
                    <a href="/thesis/src/PHP/show/adminZPdetail.php?code={$item.zpCode}" class="img">
                        <img src="/thesis/src/{$item.img}">
                    </a>
                    <div class="desc">
                        <p class="title">
                            <a href="/thesis/src/PHP/show/adminZPdetail.php?code={$item.zpCode}">{$item.title}</a>
                        </p>
                        <div class="handle">
                            <span class="time">{$item.time}</span>
                            <span class="good">{$item.likeNum}</span>
                            {if $role gt 1}
                                <span class="delete" data-code="{$item.zpCode}"></span>
                                <a href="/thesis/src/PHP/show/adminEditZP.php?zpCode={$item.zpCode}" class="link">
                                    <span class="edit"></span>
                                </a>
                            {/if}
                        </div>
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
        <p>没有改类型的作品</p>
    {/if}
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/zpList.js"></script>
</body>
</html>