/**
 * Created by star on 2017/3/22.
 */
require('./../css/production.css');
var $ = require('jquery');
var checkZp = require('./checkZP.js');
var ajax = require('./ajax.js');
var search = require('./search.js');
var scrollLoading = require('./scrollLoading.js');


var list = $('#list');
checkZp.start(list);
//滚动加载
scrollLoading.start(list,'productionmessage',2,callback);
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
                role:'admin'
            };
            ajax.deleteZP(data,$target.parents('.item'));
        });
}
deleteZP(list);
/**
 * 搜索完作品之后要执行的回调函数
 */
function callback() {
    deleteZP(list);
    checkZp.start(list);
}
//搜索作品
search.getZP($('#searchBox'),list,callback);