/**
 * Created by star on 2017/3/25.
 */
require('./../css/activeList.css');
var $ = require('jquery');
var ajax = require('./ajax.js');
var activeList = $('#activeList');
var search = require('./search.js');
var scrollLoading = require('./scrollLoading.js');

//滚动加载
scrollLoading.start(activeList,'activemessage',2,callback);
/**
 * 删除活动
 * @param activeList 活动列表
 */
function deleteActive(activeList){
    var deleteBtn;
    if(!activeList || activeList.length <= 0) return;
    deleteBtn = activeList.find('.delete');
    if(deleteBtn.length <=0 ) return;

    //给deleteBtn绑定click事件
    deleteBtn
        .on('click',function (event) {
            var target,data;
            target = $(event.target);
            data = {
                activeCode:target.attr('data-code')
            };
            layer.confirm('活动删除之后，该活动的作品也会一并删除，是否确定删除？',function (index) {
                layer.close(index);
                ajax.deleteActive(data,target.parents('.item'));
            })
        })

}
deleteActive(activeList);
/**
 * 回调函数
 */
function callback() {
    deleteActive(activeList);
}
//搜索活动
search.getActive($('#searchBox'),activeList,callback);
