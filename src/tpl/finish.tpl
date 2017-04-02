<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>重置完成</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{if $isLog eq true}
{include file="header.tpl"}
<!-- 主要内容-->
    <div class="g-main f-show f-main-bg f-paddBtm-60 ">
        <div class="m-finish f-text-c f-marTop-60">
            <img src="/thesis/src/user/build/img/ok.png">
            <span>重置完成</span>
            <a href="/thesis/src/PHP/show/userCenter.php" style="color: #ff3300;text-decoration: underline">返回个人中心</a>
        </div>
    </div>
    {else}
    <!-- 主要内容-->
    <div class="g-main f-show f-sign-bg f-paddBtm-60" style="margin-top: 0">
        <div class="m-finish f-text-c f-marTop-60">
            <img src="/thesis/src/user/build/img/ok.png">
            <span>重置完成</span>
            <a href="/thesis/src/PHP/show/signup.php" style="color: #ff3300;text-decoration: underline">去登录</a>
        </div>
    </div>
{/if}


{if $isLog eq true}
    <!--页脚-->
    <div class="f-footer"></div>
{/if}
    <script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>