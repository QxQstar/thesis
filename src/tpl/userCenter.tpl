<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>个人中心</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/css/desiginerHome.css">
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
        {if $zpNum gt 0}
            <!-- 类型-->
            <ul class="m-type f-clearfix f-area-bg">
                <li class="item f-float-l on">已上线</li>
                <li class="item f-float-l">待审核</li>
                <li class="item f-float-l">未通过</li>
            </ul>
        {/if}
        <!-- 作品列表-->
        <ul class="m-zpList zpList" id="zpList">
            {*{$zpList[0]}*}
        {foreach $zpList as $zpItem}
            <li class="item f-area-bg f-marTop-20 f-paddTopBtm-20 f-paddLR-30">
                <a href="#" class="img">
                    <img src="./../user/img/produce.jpg">
                </a>
                <div class="desc">
                    <p class="title">{$zpItem.title}</p>
                    <div class="handel">
                        <span class="time">2012-3-4</span>
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
            {foreachelse}
            没有这种类型的作品
        {/foreach}
        </ul>
        <!-- 翻页-->
        {if $zpList|count gt 0 }
            <div class="m-page f-area-bg f-marTop-30 f-text-r f-center f-paddTopBtm-20 f-paddLR-30">
                <button type="button" class="page" id="prev">上一页</button>
                <button type="button" class="page" id="next">下一页</button>
            </div>
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
</body>
</html>