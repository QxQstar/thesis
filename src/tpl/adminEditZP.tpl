<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>上传作品</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/upload.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 " id="editZP">
    <div class="m-upload f-marTop-30 f-center f-area-bg f-paddTopBtm-20 f-paddLR-30">
        {if $activeCode neq false}
            <h1 class="title">修改作品信息</h1>
            <p class="info f-marBtm-10">该作品属于活动：{$name}</p>
        {else}
            <h1 class="title f-marBtm-10">修改作品信息</h1>
        {/if}
        <form id="upload" method="post" action="/thesis/src/PHP/issueZP/index.php" enctype="multipart/form-data">
            <div class="formBox">
                <div class="inputTitle">
                    <input type="text" name="zpCode" id="zpCode" value="{$zpMessage.zpCode}" hidden>
                    <input type="text" name="status" id="status" value="{$zpMessage.status}" hidden>
                    <input type="text" name="admin" id="admin" value="admin" hidden>
                    <input type="text" placeholder="输入作品标题" id="title" name="title" data-info="标题" value="{$zpMessage.title}">
                </div>
                <div class="choiceImg f-marTop-20 f-marBtm-20">
                    <label for="img">
                        选择图片
                        <input type="file" id="img" name="img" hidden>
                    </label>
                </div>
                <!-- 图片预览-->
                <div class="preview" id="preview">
                    <img src="/thesis/src/{$zpMessage.img}" id="preImg">
                </div>
                <div class="intro f-marBtm-20 f-marTop-10">
                    <textarea id="intro" placeholder="图片介绍" name="intro" data-info="作品的描述">{$zpMessage.desc}</textarea>
                    <span class="num" id="num"></span>
                </div>
                <div class="upload f-text-r ">
                    <button type="button" id="submit" class="f-marTop-10">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/upload.js"></script>
</body>
</html>