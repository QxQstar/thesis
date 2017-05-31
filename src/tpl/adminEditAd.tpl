<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>管理员的个人中心</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">
    <!--页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/setMessage.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{include file='adminHeader.tpl'}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <div class="m-adminCenter f-marTop-30 f-center f-paddLR-30 f-paddTopBtm-20 f-area-bg">
        <div class="head f-clearfix f-marBtm-10">
            <h1 class="f-float-l">{$message.code}的资料</h1>
        </div>
        <form id="formBox" class="m-editAdmin">
            <ul class="body">
                <li class="item">
                    <span>账号:</span>
                    <input type="text" name="code" id="code" value="{$message.code}" hidden>
                    <input type="text" name="edit" id="edit" value="edit" hidden>
                    <span class="zhanghao">{$message.code}</span>
                </li>
                <li class="item">
                    <span>角色:</span>
                    <select class="role" name="role" id="role">
                        <option value="default"> 选择权限</option>
                        {foreach $roles as $role}
                            {if $role.code eq $message.role}
                                <option value="{$role.code}" selected>{$role.info}</option>
                                {else}
                                <option value="{$role.code}">{$role.info}</option>
                            {/if}
                        {/foreach}
                    </select>
                </li>
                <li class="item">
                    <span>密码:</span>
                    <input type="password" name="password" id="password" value="{$message.password}">
                </li>
                <li class="item">
                    <span></span>
                    <button type="button" name="submit" id="submit" class="submit">提交</button>
                </li>
            </ul>
        </form>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer f-text-c">
    <p>基于PHP技术的平面设计师站</p>
    <p>指导老师：罗佳</p>
    <p>组员：骞敬棠，秦小倩，贾从有，杨帆</p>
</div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/adminSignin.js"></script>
</body>
</html>