<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>发布活动</title>

    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/addActive.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 ">
    <form class="m-addActive f-marTop-30 f-center f-area-bg f-paddTopBtm-20 f-paddLR-30" id="addActive" method="post" action="/thesis/src/PHP/issueActive/ingex.php">
        <h1 class="head f-marBtm-10">发布活动</h1>
        <div class="body">
            <div class="item f-marBtm-20 f-clearfix">
                <label class="info f-float-l" for="title">活动标题</label>
                <span class="insert f-float-l">
                    <em>
                        <input type="text" id="title" name="title" data-info="活动标题">
                    </em>
                </span>

            </div>
            <div class="item f-marBtm-20 f-clearfix">
                <label class="info f-float-l" for="sTime">活动时间</label>
                <span class="insert f-float-l f-text-c">
                    <em>
                        <input type="text" id="sTime" class="time f-float-l" name="sTime" data-info="活动开始时间">
                        <span class="gap">至</span>
                        <input type="text" id="eTime" class="time f-float-r" name="eTime" data-info="活动结束时间">
                    </em>
                    <p class="f-text-l f-marTop-20 geshi">格式：1997-01-01</p>
                </span>
            </div>
            <div class="item f-marBtm-20 f-clearfix">
                <span class="info f-float-l">活动头图</span>
                <span class="insert f-float-l">
                    <em>
                        <label for="img" class="choice f-text-c">选择图片</label>
                        <input type="file" id="img" name="img" hidden>
                    </em>

                </span>
            </div>
            <div class="item f-marBtm-20 f-clearfix">
                <span class="info f-float-l"></span>
                <div class="preview f-float-l insert" id="preview"></div>
            </div>
            <div class="item f-marBtm-20 f-clearfix">
                <span class="info f-float-l">活动介绍</span>
                <span class="insert f-float-l">
                    <em>
                        <textarea id="desc" name="desc" data-info="活动介绍"></textarea>
                    </em>
                    <span class="num" id="num"></span>
                </span>

            </div>
        </div>
        <div class="footer f-text-r">
            <button type="button" id="submit">发布</button>
        </div>
    </form>
</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/addActive.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
</body>
</html>