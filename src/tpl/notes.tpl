<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>消息列表</title>
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/build/css/common.css">
    <link type="text/css" rel="stylesheet" href="/thesis/src/user/css/notes.css">
    <script type="text/javascript" src="/thesis/src/user/build/js/jquery.js"></script>
</head>
<body>
<!-- 导航条-->
{include file="header.tpl"}
<!-- 主要内容-->
<div class="g-main f-show f-main-bg f-paddBtm-60">
    {if $notes|count gt 0}
    <ul class="m-noteList f-marTop-30 f-area-bg f-center f-paddTopBtm-20 f-paddLR-30" id="notes">
        {foreach $notes as $note}
        <li class="item f-marBtm-20">
            {$note.content}
            <div class="desc f-text-r">
                <div class="handle">
                    <span class="time">{$note.time}</span>
                    <span class="delete" data-code="{$note.id}"></span>
                </div>
            </div>
        </li>
        {/foreach}
    </ul>
        {else}
        <p>没有消息</p>
    {/if}
</div>
<div class="g-footer"></div>
<script type="text/javascript" src="/thesis/src/user/build/js/common.js"></script>
<script type="text/javascript" src="/thesis/src/user/build/js/notes.js"></script>
</body>
</html>