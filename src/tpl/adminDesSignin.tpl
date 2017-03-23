<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>添加设计师</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/signin.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<div class="g-main">
    <h1 class="m-head f-text-c f-marBtm-20">
        <img src="/thesis/src/user/img/logo.png">
        后台管理
    </h1>
    <form class="m-fromBox f-area-bg f-paddLR-30 f-paddTopBtm-20 f-center" id="formBox">
        <h2 class="title f-marBtm-10">
            添加设计师
        </h2>
        <!-- 基本信息-->
        <div class="baseMess">
                <span class="info f-marBtm-10">
                    基本信息
                    <span class="icon">*</span>
                </span>
            <div class="userName f-marBtm-10">
                <input type="text" placeholder="电子邮箱" id="email" name="email">
            </div>
            <div class="userName f-marBtm-10">
                <input type="password" placeholder="登录密码" id="password" name="password">
            </div>
            <div class="yzm f-marBtm-10">
                <input type="text" placeholder="验证码" id="yzm" name="yzm" data-info="验证码">
                <a class="num f-float-r" id="yzmNum"></a>
            </div>
            <div class="surePW f-marBtm-10">
                <input type="password" placeholder="确认密码" id="surePW" name="surePW">
            </div>
        </div>
        <div class="bottom ">
            <div class=" f-marTop-10">
                <input type="button" id="submit" value="提交" class="submit">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/thesis/src/user/build/js/adminDesSignin.js"></script>
</body>
</html>