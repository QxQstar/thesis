<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">
    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/index.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<!-- 导航条-->
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60">
    <!-- 轮播-->
    {if $activeList|count gt 0}
        <div class="m-carousel f-marTop-20 f-center">
            <div class="owl-carousel owl-theme" id="carousel">
                {foreach $activeList as $active}
                    <div class="item">
                        <a href="/thesis/src/PHP/show/activeDetail.php?code={$active.activeCode}">
                            <img src="/thesis/src/{$active.img}">
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>
    {/if}
    <!-- 热门作品-->
    <div class="m-hotProduce f-marTop-30 f-area-bg f-center">
        <div class="header f-clearfix">
            <h1 class="title f-float-l">
                热门作品
            </h1>
            <a class="more f-float-r" href="/thesis/src/PHP/show/hotZP.php"></a>
        </div>
        <ul class="list f-clearfix" id="hotPro">
            {foreach $hotZPs as $item}
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}" class="img">
                    <img src="/thesis/src/{$item.img}">
                </a>
                <div class="desc">
                    <p class="title">
                        <a href="#">{$item.title}</a>
                    </p>
                    <p class="handel">
                        <span class="good">{$item.likeNum}</span>
                        <span class="discuss">{$item.discussNum}</span>
                    </p>
                </div>
            </li>
            {/foreach}
        </ul>
    </div>
    <!-- 热门设计师-->
    <div class="m-hotDesigner f-marTop-30 f-area-bg f-center">
        <div class="header f-clearfix">
            <h1 class="title f-float-l">
                热门设计师
            </h1>
            <a class="more f-float-r" href="/thesis/src/PHP/show/desiginerList.php"></a>
        </div>
        <ul class="list f-clearfix" id="hotDes">
            {foreach $hotDesi as $item}
            <li class="item f-float-l padItem">
                <a href="/thesis/src/PHP/show/designerHome.php?email={$item.email}" class="img">
                    <img src="/thesis/src/{$item.img}">
                </a>
                <div class="desc">
                    <p class="title">
                        {if $item.nickname eq null}
                            <a href="#">{$item.email}</a>
                            {else}
                            <a href="#">{$item.nickname}</a>
                        {/if}
                    </p>
                    <p class="handel">
                        <span class="fen">{$item.focus}</span>
                    </p>
                </div>
            </li>
            {/foreach}
        </ul>
    </div>
    <!-- 最新作品-->
    <div class="m-newProduce f-marTop-30 f-area-bg f-center">
        <div class="header f-clearfix">
            <h1 class="title f-float-l">
                最新作品
            </h1>
            <a class="more f-float-r" href="/thesis/src/PHP/show/newZP.php"></a>
        </div>
        <ul class="list f-clearfix" id="newPro">
            {foreach $newZPs as $item}
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}" class="img">
                    <img src="/thesis/src/{$item.img}">
                </a>
                <div class="desc">
                    <p class="title">
                        <a href="#">{$item.title}</a>
                    </p>
                    <p class="handel">
                        <span class="time">{$item.time}</span>
                    </p>
                </div>
            </li>
            {/foreach}
        </ul>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/index.js"></script>
</body>
</html>