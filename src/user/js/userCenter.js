/**
 * Created by star on 2017/3/23.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
function focus(focusList) {
    var deleteIcons;
    if(focusList && focusList.length > 0){
        deleteIcons = focusList.find('.delete');
        deleteIcons
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
    data.control = 0;
    data.loadimg = true;
    ajax.focus(data,$target);
}
focus($('#focusList'));