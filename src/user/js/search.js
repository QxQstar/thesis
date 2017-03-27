/**
 * Created by star on 2017/3/27.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
/**
 * 搜索作品
 * @param searchBox 搜索组件，jquery对象
 * @param list 搜索结果的列表
 * @param callback 回调函数
 */
exports.getZP = function (searchBox,list,callback) {
    var content,submitBtn,handle;
    if(!searchBox || searchBox.length <= 0) return;
    if(!list || list.length <= 0) list = $('.g-main');
    submitBtn = searchBox.find('#submit');
    handle = function (event) {
      var data;
      content = searchBox.find('#content').val().trim();
        content = content.split("");
        content = content.join('%');
      data = {
          content:'%'+content+'%',
          status:searchBox.attr('data-status'),
          role:searchBox.attr('data-role')
      };
      ajax.searchZP(data,list,callback);
    };
    //给提交按钮绑定click事件
    submitBtn
        .unbind('click')
        .on('click',handle)
};
/**
 * 搜索用户
 * @param searchBox 搜索组件，jquery对象
 * @param list 搜索结果的列表
 * @param callback 回调函数
 */
exports.getUser = function (searchBox,list,callback) {
    var content,submitBtn,handle,table;
    if(!searchBox || searchBox.length <= 0) return;
    if(!list || list.length <= 0) list = $('.g-main');
    submitBtn = searchBox.find('#submit');
    if($('#admin').length <= 0){
        table =  'designermessage';
    }else{
        table = 'adminmessage';
    }
    handle = function (event) {
        var data;
        content = searchBox.find('#content').val().trim();
        content = content.split("");
        content = content.join('%');
        data = {
            content:'%'+content+'%',
            table:table,
            status:searchBox.attr('data-role')
        };
        ajax.searchUser(data,list,callback);
    };
    //给提交按钮绑定click事件
    submitBtn
        .unbind('click')
        .on('click',handle)
};
/**
 * 搜索活动
 * @param searchBox 搜索组件，jquery对象
 * @param list 搜索结果的列表
 * @param callback 回调函数
 */
exports.getActive = function (searchBox,list,callback) {
    var content,submitBtn,handle;
    if(!searchBox || searchBox.length <= 0) return;
    if(!list || list.length <= 0) list = $('.g-main');
    submitBtn = searchBox.find('#submit');
    handle = function (event) {
        var data;
        content = searchBox.find('#content').val().trim();
        content = content.split("");
        content = content.join('%');
        data = {
            content:'%'+content+'%',
            status:searchBox.attr('data-role')
        };
        ajax.searchActive(data,list,callback);
    };
    //给提交按钮绑定click事件
    submitBtn
        .unbind('click')
        .on('click',handle)
};