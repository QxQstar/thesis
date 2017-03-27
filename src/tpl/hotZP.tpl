<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>作品列表-热门作品</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">
    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/production.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<!-- 导航条-->
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox" id="searchBox" data-status="hot" data-role="desi">
            <input type="text" placeholder="输入作品标题" class="content f-float-l" id="content">
            <input type="button" value="提交" class="btn f-float-l" id="submit">
        </div>
        <div class="info f-float-l">
            <h1 class="on">
                <a href="/thesis/src/PHP/show/hotZP.php">热门作品</a>
            </h1>
            <h1 >
                <a href="/thesis/src/PHP/show/newZP.php">最新作品</a>
            </h1>
        </div>
    </div>

    <!-- 作品列表-->
    <ul class="m-list f-marTop-30  f-center" id="list" >
        {foreach $list as $item}
            <li class="item f-marTop-20 f-area-bg f-paddTopBtm-20 f-paddLR-30">
                <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}" class="img">
                    <img src="/thesis/src/{$item.img}">
                </a>
                <div class="desc">
                    <p class="title">
                        <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}">{$item.title}</a>
                    </p>
                    <div class="handle">
                        <span class="good">{$item.likeNum}</span>
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
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/production.js"></script>
</body>
</html>