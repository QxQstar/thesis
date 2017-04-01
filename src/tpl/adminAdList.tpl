<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>用户管理——管理员列表</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/adminUserList.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<!-- 导航条-->
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <!-- 搜索框-->
    <div class="m-search f-marTop-30 f-area-bg f-center f-clearfix">
        <div class="searchBox" id="searchBox" data-role="admin">
            <input type="text" placeholder="输入管理员账号" class="content f-float-l" id="content">
            <input type="button" value="提交" class="btn f-float-l" id="submit">
            <a href="/thesis/src/PHP/show/adminSignin.php" id="add" class="btn f-float-l addBtn">添加管理员</a>
        </div>
        <div class="info f-float-l">
            <h1 >
                <a href="/thesis/src/PHP/show/adminDesiList.php">设计师</a>
            </h1>
            <h1 class="on">
                <a href="/thesis/src/PHP/show/adminAdList.php">管理员</a>
            </h1>
        </div>
    </div>
    <!-- 列表-->
    {if $adminList|count gt 0}
        <div class="m-list  f-marTop-30 f-area-bg f-center f-paddTopBtm-20 f-paddLR-30" id="admin">
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
                        角色
                    </div>
                    <div class="item f-float-l">
                        密码
                    </div>
                </div>


            </div>
            <ul class="body" id="userList" data-maxPage="{$maxpage}" data-role="admin" data-search="%%">
                {foreach $adminList as $item}
                    <li class="items">
                        <div class="f-clearfix">
                            <div class="right f-float-r f-clearfix">
                                <div class="item f-float-l">{$item.time}</div>
                                <div class="item icon f-float-l">
                                    <button type="button" class="delete" data-code="{$item.code}"></button>
                                </div>
                                <div class="item icon f-float-l">
                                    <a class="edit" href="/thesis/src/PHP/show/adminEditAd.php?code={$item.code}"></a>
                                </div>
                            </div>
                            <div class="left f-float-r f-clearfix">
                                <div class="item f-float-l">
                                    <span class="info">账号:</span>{$item.code}
                                </div>
                                <div class="item f-float-l">
                                    <span class="info">角色:</span>{$item.info}
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
        <p> 不存在设计师</p>
    {/if}
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/userManage.js"></script>
</body>
</html>