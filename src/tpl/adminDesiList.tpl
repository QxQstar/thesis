<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>用户管理——设计师列表</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/adminUserList.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
<!-- 导航条-->
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox" id="searchBox" data-role="admin">
            <input type="text" placeholder="输入设计师昵称/账号" class="content f-float-l" id="content">
            <input type="button" value="提交" class="btn f-float-l" id="submit">
            <a id="add" class="btn f-float-l addBtn" href="/thesis/src/PHP/show/adminDesSignin.php">添加设计师</a>
        </div>
        <div class="info f-float-l">
            <h1 class="on">
                <a href="/thesis/src/PHP/show/adminDesiList.php">设计师</a>
            </h1>
            <h1>
                <a href="/thesis/src/PHP/show/adminAdList.php">管理员</a>
            </h1>
        </div>
    </div>
    <!-- 列表-->
    {if $desiList|count gt 0}
        <div class="m-list  f-marTop-30 f-area-bg f-center f-paddTopBtm-20 f-paddLR-30">
            <div class="head f-clearfix ">
                <div class="right f-float-r">
                    <div class="item f-float-l">
                        注册时间
                    </div>
                    <div class="item f-float-r icon">
                        修改
                    </div>
                    <div class="item f-float-r icon">
                        删除
                    </div>
                </div>
                <div class="left f-float-r">
                    <div class="item f-float-l ">
                        账号
                    </div>
                    <div class="item f-float-l">
                        昵称
                    </div>
                    <div class="item f-float-l">
                        密码
                    </div>
                </div>


            </div>
            <ul class="body" id="userList" data-role="admin" data-search="%%" data-maxPage="{$maxpage}">
                {foreach $desiList as $item}
                <li class="items">
                    <div class="f-clearfix">
                        <div class="right f-float-r f-clearfix">
                            <div class="item f-float-l">{$item.time}</div>
                            <div class="item icon f-float-l">
                                <button type="button" class="delete" data-code="{$item.email}"></button>
                            </div>
                            <div class="item icon f-float-l">
                                <a class="edit" href="/thesis/src/PHP/show/adminEditUser.php?email={$item.email}"></a>
                            </div>
                        </div>
                        <div class="left f-float-r f-clearfix">
                            <div class="item f-float-l">
                                <span class="info">账号:</span><a href="/thesis/src/PHP/show/designerHome.php?role=admin&&email={$item.email}">{$item.email}</a>
                            </div>
                            <div class="item f-float-l">
                                <span class="info">昵称:</span>
                                {if $item.nickname eq null}
                                    null
                                    {else}
                                    {$item.nickname}
                                {/if}

                            </div>
                            <div class="item f-float-l">
                                <span class="info">密码:</span>{$item.password}
                            </div>
                        </div>

                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
        <div class="loading f-text-c f-marTop-10" id="loading">
            <img src="/thesis/src/user/css/ajax-loader.gif">
        </div>
        {else}
        <div class="f-noHavef-marTop-40 f-text-c">
            <img src="/thesis/src/user/build/img/nohave.png">
            <p>不存在设计师</p>
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
<script type="text/javascript" src="/thesis/src/user/build/js/userManage.js"></script>
</body>
</html>