/**
 * Created by star on 2017/3/5.
 */
require('./../css/zpdetail.css');
require('./list.js');
var $ = require('jquery');
var ajax = require('./ajax.js');
var checkZp = require('./checkZP.js');
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

