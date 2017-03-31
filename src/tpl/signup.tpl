<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>设计师登录</title>

    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/signup.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
<div class="g-main f-center" >
    <h1 class="m-head f-text-c f-marBtm-20">
        <img src="/thesis/src/user/img/logo.png">
        平面设计师站
    </h1>
    <form class="m-fromBox f-center f-area-bg f-martop-20 f-paddLR-30 f-paddTopBtm-20" id="formBox">
        <div class="title f-marBtm-10">
            <h2>会员登录</h2>
        </div>
        <div class="userName f-marBtm-10">
            <input type="text" placeholder="输入电子邮箱" id="email" name="email">
        </div>
        <div class="password f-marBtm-10">
            <input type="password" placeholder="输入登录密码" id="password" name="password">
        </div>
        <div class="submit f-marBtm-10">
            <input type="button" id="submit" value="登录">
        </div>
        <div class="info f-text-c">
            <a href="/thesis/src/PHP/show/signin.php">立即注册</a>
            <a href="/thesis/src/PHP/show/findPW.php">忘记密码?</a>
        </div>
    </form>

</div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/signup.js"></script>
</body>
</html>