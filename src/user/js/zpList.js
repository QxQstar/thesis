/**
 * Created by star on 2017/3/22.
 */
require('./../css/production.css');
var $ = require('jquery');
var checkZp = require('./checkZP.js');
var ajax = require('./ajax.js');
checkZp.start($('#list'));
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
            ajax.deleteZP(data);
        });
}
deleteZP($('#list'));