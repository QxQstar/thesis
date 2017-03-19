<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>个人中心</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/css/desiginerHome.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file='header.tpl'}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <div class="m-header f-marTop-40 f-center f-text-c">
        <img src="/thesis/src/{$message.img}">
        <p class="name">{$message.name}</p>
        <div class="desc f-text-l">
            <div class="title f-marBtm-10">{$message.intro}</div>
            <div class="handle">
                <span class="zp" title="我的作品">{$zpNum}</span>
                <span class="fen" title="我的粉丝">{$focusNum}</span>
                <a href="#" class="link">
                    <span class="message" title="未读的消息">{$noteNum}</span>
                </a>
                <a href="/thesis/src/PHP/show/setMessage.php" class="link" title="编辑个人信息">
                    <span class="edit"></span>
                </a>

            </div>
        </div>
    </div>
    <div class="m-zpListBox f-center f-marTop-30">
        <!-- 类型-->
        <ul class="m-type f-clearfix f-area-bg">
            <li class="item f-float-l on"><a href="/thesis/src/PHP/show/userCenter.php">已上线</a> </li>
            <li class="item f-float-l"><a href="/thesis/src/PHP/show/zpList0.php">待审核</a> </li>
            <li class="item f-float-l"><a href="/thesis/src/PHP/show/zpList1.php">未通过</a></li>
        </ul>
        {if $zpNum gt 0}
            <!-- 作品列表-->
            <ul class="m-zpList zpList" id="zpList">
                {foreach $zpList as $zpItem}
                    <li class="item f-area-bg f-marTop-20 f-paddTopBtm-20 f-paddLR-30" data-code="{$zpItem.zpCode}">
                        <a href="/thesis/src/PHP/show/zpDetail.php?code={$item.zpCode}" class="img">
                            <img src="/thesis/src/{$zpItem.img}">
                        </a>
                        <div class="desc">
                            <p class="title">{$zpItem.title}</p>
                            <div class="handel">
                                <span class="time">{$zpItem.time}</span>
                                <span class="good">34</span>
                                <span class="discuss">34</span>
                                <a href="#" class="link">
                                    <span class="delete"></span>
                                </a>
                                <a href="#" class="link">
                                    <span class="edit"></span>
                                </a>

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
            <p>没有该类型的作品</p>
        {/if}

        <!-- 关注-->
        <div class="m-focus">
            <h2 class="title">关注的设计师</h2>
            <ul class="list f-clearfix">
                {foreach $focusList as $focusItem}
                    <li class="item f-float-l">
                        <span class="delete"></span>
                        <a class="#">
                            <img src="./../user/img/header.jpg">
                        </a>
                        <p class="name">设计师昵称</p>
                    </li>
                    {foreachelse}
                    还没有关注的设计师
                {/foreach}
            </ul>
        </div>

    </div>


</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>