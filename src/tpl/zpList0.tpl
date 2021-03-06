<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>个人中心——待审核作品</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/css/desiginerHome.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{include file='header.tpl'}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 " data-hasQues="{$hasQues}" data-email="{$message.email}" id="main">
    <div class="m-header f-marTop-40 f-center f-text-c">
        <img src="/thesis/src/{$message.img}">
        <p class="name">{$message.name}</p>
        <div class="desc f-text-l">
            <div class="title f-marBtm-10">{$message.intro}</div>
            <div class="handle">
                <span class="zp" title="我的作品">{$zpNum}</span>
                <span class="fen" title="我的粉丝">{$focusNum}</span>
                <a href="/thesis/src/PHP/show/notes.php" class="link">
                    {if $noteNum gt 0}
                        <span class="message on" title="未读的消息">未读消息{$noteNum}</span>
                    {else}
                        <span class="message" title="未读的消息">未读消息{$noteNum}</span>
                    {/if}
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
            <li class="item f-float-l"><a href="/thesis/src/PHP/show/userCenter.php">已上线</a> </li>
            <li class="item f-float-l on"><a href="/thesis/src/PHP/show/zpList0.php">待审核</a> </li>
            <li class="item f-float-l"><a href="/thesis/src/PHP/show/zpList1.php">未通过</a></li>
        </ul>
        {if $zpNum gt 0}
            <!-- 待审核作品列表-->
            <ul class="m-zpList zpList" id="zpList" data-status="me0" data-maxPage="{$maxpage}" data-role="desi">
                {foreach $zpList as $zpItem}
                    <li class="item f-text-c f-area-bg f-marTop-20 f-paddTopBtm-20 f-paddLR-30" data-code="{$zpItem.zpCode}">
                        <a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code={$zpItem.zpCode}" class="img">
                            <img src="/thesis/src/{$zpItem.img}">
                        </a>
                        <div class="desc f-text-l">
                            <p class="title">
                                <a href="/thesis/src/PHP/show/zpDetail.php?code={$zpItem.zpCode}">{$zpItem.title}</a>
                            </p>
                            <div class="handel">
                                <span class="time">{$zpItem.time}</span>
                                <span class="delete" data-code="{$zpItem.zpCode}"></span>
                                <a href="/thesis/src/PHP/show/editZP.php?zpCode={$zpItem.zpCode}" class="link">
                                    <span class="edit"></span>
                                </a>

                            </div>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <div class="loading f-text-c f-marTop-10" id="loading">
                <img src="/thesis/src/user/css/ajax-loader.gif">
            </div>
            {else}
            <div class="f-noHave f-marTop-40 f-text-c m-zpList zpList">
                <img src="/thesis/src/user/build/img/nohave.png">
                <p>没有数据</p>
            </div>
        {/if}
        <!-- 关注-->
        <div class="m-focus">
            <h2 class="title">关注的设计师</h2>
            {if $focusList|count gt 0}
                <ul class="list f-clearfix" id="focusList" data-search="%%" data-maxPage="{$focuspage}">
                    {foreach $focusList as $focusItem}
                        <li class="item f-float-l">
                            <span class="delete" data-code="{$focusItem.email}"></span>
                            <a href="/thesis/src/PHP/show/designerHome.php?email={$focusItem.email}">
                                <img src="/thesis/src/{$focusItem.img}">
                            </a>
                            {if $focusItem.nickname neq null}
                                <p class="name">{$focusItem.nickname}</p>
                            {else}
                                <p class="name">{$focusItem.email}</p>
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            {else}
                没有关注设计师
            {/if}
            {if $focuspage gt 1}
                <div class="turnPage f-marTop-10" id="turnPage" data-curEmail="{$message.email}">
                    <button type="button" id="prevPage" class="off prevPage"></button>
                    <button type="button" id="nextPage" class="nextPage"></button>
                </div>
            {/if}
        </div>

    </div>


</div>
<!-- 页脚-->
<div class="g-footer f-text-c">
    <p>基于PHP技术的平面设计师站</p>
    <p>指导老师：罗佳</p>
    <p>组员：骞敬棠，秦小倩，贾从有，杨帆</p>
</div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/userCenter.js"></script>
</body>
</html>