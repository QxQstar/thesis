<!-- 导航条-->
<header class="g-header admin" id="header">
    <div class="m-content f-clearfix">
        <img src="/thesis/src/user/img/adminlogo.png" class="logo">
        <div class="control" id="control">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <ul class="navList adminNav f-clearfix" id="navList">
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/adminZP0.php">作品管理</a>
            </li>
            {if $role gt 1}
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/adminDesiList.php">用户管理</a>
            </li>
            {/if}
            <li class="item f-float-l">
                <a href="/thesis/src/PHP/show/adminActiveList.php">活动管理</a>
            </li>
            {if $role gt 2}
                <li class="item f-float-l">
                    <a href="/thesis/src/PHP/show/adminHeadImg.php">系统管理</a>
                </li>
            {/if}
            <!-- 在手机上显示,登录之后将改成个人中心和退出登录-->
            {if $isLog eq false}
                <li class="item f-float-l phone">
                    <a href="/thesis/src/PHP/show/adminSignup.php">登录</a>
                </li>
                {else}
                <li class="item f-float-l phone">
                    <a href="/thesis/src/PHP/show/adminCenter.php">个人中心</a>
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
                    <a href="/thesis/src/PHP/show/adminSignup.php" class="signup">
                        <span class="icon"></span>登录
                    </a>
                </li>
                {else}

                <li class="item f-float-r">
                    <a class="signout">退出登录</a>
                </li>
                <li class="item f-float-r">
                    <a href="/thesis/src/PHP/show/adminCenter.php">个人中心</a>
                </li>
            {/if}
        </ul>
    </div>
    <div class="mask"></div>
</header>