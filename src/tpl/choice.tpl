<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>选择修改校验方式</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/modify.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <div class="m-form f-marTop-30 f-center">
        <h1 class="f-marBtm-20 f-marTop-60">你正在为账号<span>{$name}</span>重置{$info}，请选择重置方式</h1>
        <ul class="list">
            <li class="item f-clearfix f-area-bg f-marBtm-20 f-paddLR-30 item_1 f-text-r">
                <a href="/thesis/src/PHP/show/PW.php">
                    <p class="f-float-l f-text-l">通过登录密码重置</p>
                    <span>立即重置</span>
                </a>

            </li>
            <li class="item f-clearfix f-area-bg f-marBtm-20 f-paddLR-30 item_2 f-text-r">
                <a href="/thesis/src/PHP/show/question.php">
                    <p class="f-float-l f-text-l">通过安全问题重置</p>
                    <span>立即重置</span>
                </a>

            </li>
        </ul>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>