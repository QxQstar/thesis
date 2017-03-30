<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>通过安全问题确认身份</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/verify.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{if $isLog eq true}
    {include file="header.tpl"}
    <!-- 主要内容-->
    <div class="g-main f-show f-main-bg f-paddBtm-60 ">
        <!--进度条-->
        <ul class="m-process f-clearfix f-center f-marTop-60">
            <li class="item f-float-l on">
                <div class="info f-float-l f-text-c">
                    <span>1</span>
                    验证身份
                </div>
                <div class="bar f-float-l"></div>
            </li>
            <li class="item f-float-l">
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
    <div class="g-main f-show f-sign-bg f-paddBtm-60 ">
        <!--进度条-->
        <ul class="m-process f-clearfix f-center f-marTop-60">
            <li class="item f-float-l on">
                <div class="info f-float-l f-text-c white">
                    <span>1</span>
                    验证身份
                </div>
                <div class="bar f-float-l white"></div>
            </li>
            <li class="item f-float-l">
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
            你正在回答安全问题进行校验
        </h1>
        <div class="body f-marTop-30">
            <input type="text" name="zhanghu" id="zhanghu" value="{$name}" hidden>
            <input type="text" name="check" id="check" value="check" hidden>
            <p class="item f-marBtm-10">
                <span class="info f-text-r">账号</span>
                <span class="col2">{$name}</span>
            </p>
            <p class="item f-marBtm-10">
                <span class="info  f-text-r">安全问题一</span>
                <span class="col2">{$result.question1}</span>
                <input type="text" name="question1" id="question1" hidden value="{$result.question1}">
            </p>
            <p class="item f-marBtm-20">
                <span class="info  f-text-r">答案</span>
                <span class="col2">
                    <input type="text" class="answer" id="answer1" name="answer1" data-info="第一个安全问题的答案"/>
                </span>
            </p>
            <p class="item f-marBtm-10">
                <span class="info  f-text-r">安全问题二</span>
                <span class="col2">{$result.question2}</span>
                <input type="text" name="question2" id="question2" value="{$result.question2}" hidden>
            </p>
            <p class="item f-marBtm-20">
                <span class="info  f-text-r">答案</span>
                <span class="col2">
                     <input type="text" class="answer" id="answer2" name="answer2" data-info="第二个安全问题的答案"/>
                </span>
            </p>
        </div>
        <div class="footer f-martop-20">
            <span class="info"></span>
            <button type="button" class="next" id="submit">下一步</button>
        </div>
    </form>
</div>
<!-- 页脚-->
{if $isLog eq true}
    <div class="g-footer"></div>
{/if}
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/verify.js"></script>
</body>
</html>