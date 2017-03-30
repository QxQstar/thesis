<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>修改设计师资料</title>
    <link type="text/css" href="/thesis/src/user/build/css/common.css" rel="stylesheet">

    <!-- 页面样式-->
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/setMessage.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
    <script type="text/javascript" src="/thesis/layer/layer.js"></script>
</head>
<body>
<!-- 导航条-->
{include file="adminHeader.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60 " id="admin">
    <!--文字信息的表单-->
    <div class="m-setMessage f-marTop-30 f-center f-paddLR-30 f-paddTopBtm-20 f-area-bg" id="setMessage">
        <div class="head f-clearfix f-marBtm-10">
            <h1 class="f-float-l">{$message.email}的资料</h1>

        </div>
        <div class="body f-clearfix">
            <!--上传头像的表单-->
            <div id="setImg">
                <div class="img f-float-l f-text-c">
                    <img src="/thesis/src/{$message.img}"/>
                    <label class="f-text-c upload" id="editHeadImg">
                        [修改头像]
                    </label>
                </div>
                <!--头像的预览区域-->
                <div class="m-Img" id="previewImg">
                    <div class="warpBox f-paddLR-30 f-paddTopBtm-20" id="warpBox">
                        <span class="close" id="close"></span>
                        <!--//系统头像-->
                        <form class="warp f-marTop-30" id="warp">
                            <div class="imgListBox f-float-l">
                                <ul class="imgList f-clearfix" id="imgList">
                                    {foreach $imgList as $img}
                                        <li class="item f-float-l" data-img="{$img.img}">
                                            <img  src="/thesis/src/{$img.img}"/>
                                            <span></span>
                                        </li>
                                        {foreachelse}
                                        没有系统头像
                                    {/foreach}
                                </ul>
                            </div>
                            <div class="sure f-float-l">
                                <input type="text" id="img" name="img" hidden>
                                <input type="text" name="email" id="email" value="{$message.email}" hidden>
                                <button type="button" id="submit" class="systemBtn">确定</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

            <!--基本信息表单-->
            <form class="form f-float-l" id="baseMessage">
                <p class="item ">
                    <span>账号：</span>
                    <span class="zhanghao">{$message.email}</span>
                    <input type="text" name="email" id="email" value="{$message.email}" hidden>
                </p>
                <p class="item ">
                    <span>密码：</span>
                    <input type="password" class="data" placeholder="密码" name="password" id="password" value="{$message.password}"/>
                    <span class="info" id="nickNum">0/15</span>
                </p>
                <p class="item ">
                    <span>昵称：</span>
                    <input type="text" class="data" placeholder="昵称" name="nickname" id="nickname" value="{$message.nickname}"/>
                    <span class="info" id="nickNum">0/15</span>
                </p>
                <p class="item ">
                    <span>简介：</span>
                    <textarea class="value" placeholder="个人简介" id="intro" name="intro" >{$message.intro}</textarea>
                    <span class="info" id="showNum">0/300</span>
                </p>
                <button class="save f-float-r" id="submit">保存</button>
            </form>
        </div>
    </div>

</div>
<!-- 页脚-->
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/setMessage.js"></script>
</body>
</html>