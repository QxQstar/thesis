/**
 * Created by star on 2017/3/23.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
var scrollLoading = require('./scrollLoading.js');
var zpList = $('#zpList');
//滚动加载
scrollLoading.start(zpList,'productionmessage',2,callback);

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

/**
 * 删除作品
 * @param zpList 作品列表
 */
function deleteZP(zpList) {
    var deleteBtn;
    if(!zpList || zpList.length <= 0) return ;
    //获取delete元素
    deleteBtn = zpList.find('.delete');
    if(deleteBtn.length <= 0) return;
    //给delete元素绑定click事件
    deleteBtn
        .on('click',function (event) {
            var $target,data;
            $target = $(event.target);
            data = {
                zpCode:$target.attr('data-code'),
                role:'desi'
            };
            ajax.deleteZP(data,$target.parents('.item'));
        });
}
deleteZP(zpList);
/**
 * 回调函数
 */
function callback() {
    deleteZP(zpList);
    focus($('#focusList'));
}