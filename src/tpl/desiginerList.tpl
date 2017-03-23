<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>设计师列表</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/desiginerList.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<!-- 导航条-->
{include file='header.tpl'}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox">
            <input type="text" placeholder="输入作品标题" class="content f-float-l" id="content">
            <input type="button" value="体检" class="btn f-float-l" id="submit">
        </div>
        <div class="info f-float-l">
            <h1 class="on">热门设计师</h1>
        </div>
    </div>
    {if $desiMess|count gt 0}
        <!-- 设计师列表-->
        <div class="m-listBox f-area-bg f-center f-marTop-30 f-paddTopBtm-20 f-paddLR-30">
            <ul class="m-list f-clearfix">
                {foreach $desiMess as $item}
                <li class="item f-float-l">
                    {if $isLog eq true and $curEmail eq $item.email}
                        <a href="/thesis/src/PHP/show/userCenter.php" class="img">
                            {else}
                            <a href="/thesis/src/PHP/show/designerHome.php?email={$item.email}">
                    {/if}
                        <img src="/thesis/src/{$item.img}">
                    </a>
                    <div class="desc">
                        <p class="title">
                            {if $item.nickname eq null}
                                {$item.email}
                                {else}
                                {$item.nickname}
                            {/if}
                        </p>
                        <div class="handle">
                            <span class="fen">{$item.focus}</span>
                        </div>
                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
        <!-- 翻页-->
        <div class="m-page f-area-bg f-marTop-30 f-text-r f-center f-paddTopBtm-20 f-paddLR-30">
            <button type="button" class="page" id="prev">上一页</button>
            <button type="button" class="page" id="next">下一页</button>
        </div>
        {else}
        <p>还没有设计师</p>
    {/if}
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>