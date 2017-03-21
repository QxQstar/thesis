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
    warpBox = warp.parent();
    if(!this.isSupport) {
        addButton = $('<p class="addItem f-float-l f-text-c">你的浏览器不支持自定义头像，可更换高版本的浏览器自定义头像</p>');
        warpBox.append(addButton);
        return this;
    }
    //如果支持自定义就添加自定义按钮
    addButton = $('<p class="addItem f-float-l f-text-c">' +
            '<label for="addImg">+</label>'+
            '<input type="file" name="addImg" id="addImg" hidden>'+
        '</p>');

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
    var preImg,thum,cvsMove;
    preImg = this.previewBox.find('#preImg');
    thum = this.previewBox.find('#thume');
    cvsMove =this.previewBox.find('#cvsMove');
    preImg.attr('src','');
    thum.attr('src','');
    cvsMove.css({
        top:0,
        left:0
    });
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
    data = cvsMove[0].toDataURL('image/jpg',1);
    fd=new FormData();

    fd.append('customerImg',data);
    ajax.submitForm(this.url,fd,false);
};
/**
 * 判断是否支持自定义头像
 * @returns {boolean}
 * @private
 */
CustomerImg.prototype.__isSupport = function () {
    if(typeof Blob === 'function' && typeof FormData === 'function' && typeof FileReader ){
        return true;
    }else{
        return false;
    }
};
var customerImg = new CustomerImg();
module.exports = customerImg;