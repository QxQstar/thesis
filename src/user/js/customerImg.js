/**
 * Created by star on 2017/3/9.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
var preview = require('./preview.js');
var shear = require('./shear.js');
/**
 * 自定义头像
 * @constructor
 */
function CustomerImg() {
    this.isSupport = null;
    this.file = null;
    this.previewBox = null;
    this.warp = null;
    this.url = null;
}
/**
 * 入口
 * @param warp 自定义按钮的父元素，jquery节点
 * @param previewBox 预览的父元素，jquery节点
 * @param url 提交的地址
 */
CustomerImg.prototype.start = function (warp,previewBox,url) {
    var addButton,me,warpBox;
    me = this;
    this.isSupport = this.__isSupport();
    if(!this.isSupport) return this;
    //如果支持自定义就添加自定义按钮
    addButton = $('<p class="addItem f-float-l f-text-c">' +
            '<label for="addImg">+</label>'+
            '<input type="file" name="addImg" id="addImg" hidden>'+
        '</p>');
    warpBox = warp.parent();
    this.warp = warp;
    warpBox.append(addButton);
    if(url){
        this.url = url;
    }
    //预览
    preview.start(previewBox,warpBox,shear.start.bind(shear,previewBox));
    this.previewBox = previewBox;

    //绑定事件，确定和取消
    //1.取消
    previewBox
        .find('#reset')
        .unbind('click')
        .on('click',me.__dispose.bind(me));
    //2.确定
    previewBox
        .find('#submit')
        .unbind('click')
        .on('click',me.__submit.bind(me));
};
/**
 * 清理
 * @private
 */
CustomerImg.prototype.__dispose = function () {
    var preImg,thum;
    preImg = this.previewBox.find('#preImg');
    thum = this.previewBox.find('#thume');
    preImg.attr('src','');
    thum.attr('src','');
    this.previewBox.hide();
    this.warp.show();
};
/**
 * 提交
 * @private
 */
CustomerImg.prototype.__submit = function () {
    var cvsMove,data,ia,blob,fd;
    cvsMove = this.previewBox.find('#cvsMove');
    data = cvsMove[0].toDataURL('image/jpeg',1);
    data = data.split(',')[1];
    ia = new Uint8Array(data.length);
    for (var i = 0; i < data.length; i++) {
        ia[i] = data.charCodeAt(i);
    }
    blob=new Blob([ia], {type:'image/jpeg'});
    fd=new FormData();

    fd.append('img',blob);
    ajax.submitForm(this.url,fd,true);
};
/**
 * 判断是否支持自定义头像
 * @returns {boolean}
 * @private
 */
CustomerImg.prototype.__isSupport = function () {
    if(typeof Blob === 'function' && typeof FormData === 'function' && typeof FileReader && typeof window.atob === 'function'){
        return true;
    }else{
        return false;
    }
};
var customerImg = new CustomerImg();
module.exports = customerImg;