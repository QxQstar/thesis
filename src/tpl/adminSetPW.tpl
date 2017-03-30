<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>设置新密码</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/verify.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{if $isLog eq true}
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60" id="admin">
    <!--进度条-->
    <ul class="m-process f-clearfix f-center f-marTop-60">
        <li class="item f-float-l on">
            <div class="info f-float-l f-text-c">
                <span>1</span>
                验证身份
            </div>
            <div class="bar f-float-l on"></div>
        </li>
        <li class="item f-float-l on">
            <div class="info f-float-l f-text-c">
                <span>2</span>
                修改信息
            </div>
            <div class="bar f-float-l"></div>
        </li>
        <li class="f-float-l last">
            <div class="info  f-text-c">
                <span>3</span>
                修改完成
            </div>
        </li>
    </ul>
    {else}
    <!-- 主要内容-->
    <div class="g-main f-show f-sign-bg f-paddBtm-60" id="admin">
        <!--进度条-->
        <ul class="m-process f-clearfix f-center f-marTop-60">
            <li class="item f-float-l on">
                <div class="info f-float-l f-text-c white">
                    <span>1</span>
                    验证身份
                </div>
                <div class="bar f-float-l on white"></div>
            </li>
            <li class="item f-float-l on">
                <div class="info f-float-l f-text-c white">
                    <span>2</span>
                    修改信息
                </div>
                <div class="bar f-float-l white"></div>
            </li>
            <li class="f-float-l last">
                <div class="info  f-text-c white">
                    <span>3</span>
                    修改完成
                </div>
            </li>
        </ul>
        {/if}
        <form class="m-form f-marTop-30 f-area-bg f-center" name="verify" id="verify">
            <h1 class="head f-paddTopBtm-20">
                你正在重置登录密码
            </h1>
            <div class="body f-marTop-30">
                <p class="item f-marBtm-10">
                    <input type="text" name="setPW" id="setPW" value="setPW" hidden>
                    <span class="info  f-text-r">账号</span>
                    <input type="text" name="code" id="code" value="{$name}" hidden>
                    <span class="col2">{$name}</span>
                </p>
                <p class="item f-marBtm-20">
                    <span class="info  f-text-r">新密码</span>
                    <span class="col2 f-text-r">
                    <input type="password" class="answer" id="password" name="password"/>
                        <br>
                    <span class="notice">至少6个字符</span>
                </span>
                </p>
                <p class="item f-marBtm-20">
                    <span class="info  f-text-r">确认新密码</span>
                    <span class="col2">
                     <input type="password" class="answer" id="surePW" name="surePW"/>
                </span>
                </p>
            </div>
            <div class="footer f-martop-20">
                <span class="info"></span>
                <button type="button" class="next" id="submit">下一步</button>
            </div>
        </form>
    </div>
    {if $isLog eq true}
        <!--页脚-->
        <div class="f-footer"></div>
    {/if}
    <script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
    <script type="text/javascript" src="/thesis/src/user/build/js/verify.js"></script>
</body>
</html>