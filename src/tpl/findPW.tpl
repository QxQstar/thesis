<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>找回密码</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/verify.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>

<!-- 主要内容-->
<div class="g-main f-show f-sign-bg f-paddBtm-60 " style="margin-top: 0">
    <form class="m-form f-marTop-60 f-area-bg f-center" name="verify" id="verify">
        <h1 class="head f-paddTopBtm-20">
            请输入你需要找回登录密码的账户名
        </h1>
        <div class="body f-marTop-30">
            <input type="text" hidden name="findPW" id="findPW" value="findPW"/>
            <p class="item f-marBtm-10">
                <span class="info  f-text-r">账号名</span>
                <span class="col2">
                    <input type="text" class="answer" id="email" name="email" />
                </span>
            </p>
            <p class="item f-marBtm-10">
                <span class="info f-text-r">验证码</span>
                <span class="col2">
                    <input type="text" data-info="验证码" id="yzm" name="yzm" class="yzm">
                    <a class="num" id="yzmNum"></a>
                </span>

            </p>
        </div>
        <div class="footer f-martop-20">
            <span class="info"></span>
            <button class="next" type="button" id="submit">下一步</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/verify.js"></script>
</body>
</html>