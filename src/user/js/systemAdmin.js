/**
 * Created by star on 2017/3/10.
 */
require('./../css/systemAdmin.css');
var $ = require('jquery');
var spread = require('./spread.js');
var submitForm = require('./submitForm.js')();
var preview = require('./preview.js');
var ajax = require('./ajax.js');
var addSystemImg = $('#addSystemImg');
var spreadBtn = $('#spread');
spread.start(spreadBtn,addSystemImg,spreadBtn.html(),'关闭');
//如果有图片预览
if($('#preview').length > 0){
    preview.start(addSystemImg,addSystemImg,previewCallback.__bind(this,addSystemImg.find('#bottom')));
}
submitForm.start(addSystemImg,'systemAdmin',true,[],[]);
//预览结束的回调函数
function previewCallback(){
    var param1;
    if(arguments.length < 0){
        return this;
    }
    param1 = arguments[0];
    param1.show();
}
/**
 * 删除系统信息
 * @param list 列表
 */
function deleteSystemSet(list){
    var deleteBtn,table,data;
    if(!list || list.lenght <=0) return;
    deleteBtn = list.find('.delete');
    if(deleteBtn.length <=0) return;
    //要删除的系统信息位于哪一张表
    table = list.attr('data-table');

    //给deleteBtn绑定click事件
    deleteBtn
        .on('click',function (event) {
            var $target;
            $target = $(event.target);
            data = {
                code:$target.attr('data-code'),
                table:table
            };
            if(table == 'role'){
                if(confirm('这个权限的用户也会被一起删除，是否确定删除？')){
                    ajax.deleteSysMess(data);
                }
            }else{
                if(confirm('可能会破坏用户数据，是否确定删除？')){
                    ajax.deleteSysMess(data);
                }
            }
        })
}
deleteSystemSet($('#list'));
