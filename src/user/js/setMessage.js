/**
 * Created by star on 2017/3/8.
 */
require('./../css/setMessage.css');
var $ = require('jquery');
var submitForm1 = require('./submitForm.js')();
var submitForm2 = $.extend(true,{},submitForm1);
var editHeadImg = $('#editHeadImg');
//基本信息
submitForm1.start($('#baseMessage'),'setMessage',false,['nickname','intro']);
var customerImg = require('./customerImg');
customerImg.start($('#warp'),$('#customer'),'setMessage');

//给’编辑头像‘绑定事件
editHeadImg
    .unbind('click')
    .on('click',editHIHandler);

function  editHIHandler(event) {
    var previewImg,close;
    previewImg = $('#previewImg');
    close = previewImg.find('#close');
    close
        .unbind('click')
        .on('click',function () {
            previewImg.hide();
            previewImg.find('.on').removeClass('on');
            previewImg.find('#img').val('');
            //移除为提交按钮绑定的click事件
            previewImg.find('#submit').unbind('click');
        });
    previewImg.show();

}

//选择头像
var imgList;
imgList = $('#imgList');
imgList.find('.item').each(function (index,img) {
    var $img;
    $img = $(img);
    $img
        .unbind('click')
        .on('click',choiceImg)
});
function choiceImg(event) {
    var $this,info,warp;
    warp = $('#warp');
    $this = $(this);
    info = $this.find('span');
    imgList
        .find('span.on')
        .removeClass('on');
    info.addClass('on');
    warp.find('#img').val($this.attr('data-img'));
    warp.find('#submit').addClass('on');
    //系统提供的头像
    submitForm2.start($('#warp'),'setMessage',false,[],['addImg']);
}