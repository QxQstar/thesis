/**
 * Created by star on 2017/3/5.
 */
require('./../css/zpdetail.css');
require('./list.js');
var $ = require('jquery');
var ajax = require('./ajax.js');
var checkZp = require('./checkZP.js');
var controlNum = require('./controlNum.js');
controlNum.start($('#import'),$('#notice'),300);
var controlReplyNum = $.extend(true,{},controlNum);
//是否登录
var isLog = $('#discuss').attr('data-isLog') | 0;
checkZp.start($('#curZP'));
/**
 * 对作品点赞或取消点赞
 * @param zpBox 包含作品信息的元素，jquery对象
 */
function thumb (zpBox) {
    var good;
    if(zpBox && zpBox.length > 0){
        good = zpBox.find('.good');
        good
            .unbind('click')
            .on('click',thumbUp)
    }else{
        return ;
    }
}
thumb($('#zpBox'));
/**
 * 点赞
 * @param event 事件对象
 */
function thumbUp(event) {
    var $target,data;
    $target = $(event.target);
    data = {};
    data.zpCode = $target.attr('data-code');
    //0表示取消点赞，1表示点赞
    if($target.attr('status') =='gooded'){
        data.control = 0;
    }else{
        data.control = 1;
    }
    ajax.thumb(data,$target);
}
/**
 * 关注或取消关注
 * @param focusBtn 按钮
 */
function focus(focusBtn) {
    if(focusBtn && focusBtn.length > 0){
        focusBtn
            .unbind('click')
            .on('click',focusHandle);
    }else{
        return;
    }
}
/**
 * 关注
 * @param event 事件对象
 */
function focusHandle(event) {
    var $target,data;
    data = {};
    $target = $(event.target);
    data.beEmail = $target.attr('data-code');
    //0表示取消关注，1表示关注
    if($target.attr('status') == 'focused'){
        data.control = 0;
    }else{
        data.control = 1;
    }
    data.loadimg = false;
    ajax.focus(data,$target);
}
focus($('#focus'));
/**
 * 生成回复框
 */
function createReplyBox(list) {
    var replyBtn,replyBox;
    replyBox = function (event) {
        var zpCode,toEmail,toContent,$target,innerBox,strDiscBox,discBox;
        //判断是否登录
        checkLog();

        $target = $(event.target);
        zpCode = $target.attr('data-code');
        toEmail = $target.attr('data-toEmail');
        toContent = $target.attr('data-toContent');
        innerBox = $target.parents('.innerBox');
        //如果还没有一个回复框就生成一个回复框
        if(innerBox.find('.discBox').length <= 0){
            $target.html('取消回复');
            discBox = $('<div class="discBox f-marTop-10"></div>');
            strDiscBox = '<div>'+
                    '<label for="import">'+
                        '<textarea class="import" id="reply" placeholder="回复'+ toEmail +'"></textarea>'+
                    '</label>'+
                    '<span class="notice" id="noticeReply">0/300</span>'+
                '</div>'+
                '<div class="f-text-r">'+
                    '<button class="discBtn f-marTop-20" id="submitReply" data-code="'+ zpCode +'" data-toEmail="'+ toEmail +'" data-toContent="'+ toContent +'">发表评价</button>'+
                '</div>';
            discBox.html(strDiscBox);
            innerBox.append(discBox);
            controlReplyNum.start(discBox.find('#reply'),discBox.find('#noticeReply'),300);
            userDiscuss(discBox.find('#submitReply'));
        }else{
            $target.html('回复');
            innerBox.find('.discBox').remove();
        }

    };
    if(!list || list.length <= 0) return;
    replyBtn = list.find('.replyBtn');
    if(replyBtn.length <= 0) return;
    //给回复按钮绑定click事件
    replyBtn
        .unbind('click')
        .on('click',replyBox)
}
createReplyBox($('#discList'));
/**
 * 用户评价
 * @param btn 评价按钮
 */
function userDiscuss(btn) {
    var content,discBox,submitContent;
    if(!btn || btn.length <=0) return;
    discBox = btn.parents('.discBox');
    if(discBox.length <= 0 || discBox.find('textarea') <= 0) return;
    submitContent = function (event) {
        var $target,toEmail,toContent,zpCode;
        $target = $(event.target);
        content = discBox.find('textarea').val().trim();
        //只有当评价的内容长度大于0的情况下才能发表评价
        if(content.length > 0){
            zpCode = $target.attr('data-code');
            toEmail = $target.attr('data-toEmail');
            toContent = $target.attr('data-toContent');
            ajax.submitReply({
                zpCode:zpCode,
                toContent:toContent,
                content:content,
                toEmail:toEmail
            });
        }
    };
    //给提交按钮绑定事件
    btn
        .unbind('click')
        .on('click',submitContent);

}
userDiscuss($('#submit'));
/**
 * 在输入框取得焦点的时候判断是否登录了
 * @param input 输入框，jquery对象
 */

function willInput(input) {
    if(!input || input.length <= 0) return;
    input.on('click',checkLog);
}
willInput($('#import'));
/**
 * 检查是否登录
 */
function checkLog() {
    if(!isLog){
        location.href = "/thesis/src/PHP/show/signup.php#nextUrl="+location.href;
        return;
    }
}


