<!-- 导航条-->
<div class="g-header" id="header">
    <div class="m-content f-clearfix">
        <img src="/thesis/src/user/img/logo.png" class="logo">
        <div class="control" id="control">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <ul class="navList f-clearfix" id="navList">
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/index.php">首页</a>
            </li>
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/hotZP.php">作品</a>
            </li>
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/desiginerList.php">设计师</a>
            </li>
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/activeList.php">活动</a>
            </li>
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/upload.php">投稿</a>
            </li>
            <!-- 在手机上显示,登录之后将改成个人中心-->
            {if $isLog eq false}
                <li class="item f-float-l phone">
                    <a href="/thesis/src/PHP/show/signup.php">登录</a>
                </li>
                <li class="item f-float-l phone">
                    <a href="/thesis/src/PHP/show/signin.php">注册</a>
                </li>
                {else}
                <li class="item f-float-l phone">
                    <a href="/thesis/src/PHP/show/userCenter.php">个人中心</a>
                </li>
                <li class="item f-float-l phone">
                    <a class="signout">退出登录</a>
                </li>
            {/if}
        </ul>

        <!-- 在手机上这块区域不存在-->
        <ul class="rightNav f-clearfix">

            {if $isLog eq false}
                <li class="item f-float-r">
                    <a href="/thesis/src/PHP/show/signup.php" class="signup">
                        <span class="icon"></span>登录
                    </a>
                </li>
                <li class="item f-float-r">
                    <a href="/thesis/src/PHP/show/signin.php" class="signin">
                        <span class="icon"></span>注册
                    </a>
                </li>
                {else}
                <li class="item f-float-r">
                    <a href="/thesis/src/PHP/show/userCenter.php">个人中心</a>
                </li>
                <li class="item f-float-r">
                    <a class="signout">退出登录</a>
                </li>
            {/if}
        </ul>
    </div>
    <div class="mask"></div>
</div>