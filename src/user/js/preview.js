/**
 * Created by star on 2017/3/7.
 */
var $ = require('jquery');
/**
 * 预览类
 * @param boxElem
 * @constructor
 */
function Preview(boxElem) {
    this.boxElem = null;
    this.fileParent = null;
    this.callback = null;
}
/**
 * 入口
 * @param boxElem 预览元素的父元素，通常是一个表单
 * @param fileParent file的父元素
 * @param callback 预览结束的回调函数
 */
Preview.prototype.start = function (boxElem,fileParent,callback) {
    this.boxElem = boxElem;
    fileParent ? this.fileParent = fileParent : this.fileParent = boxElem;
    if(typeof callback === 'function'){
        this.callback = callback;
    }
    var chooseFile,me;
    me = this;
    if(this.__isSupport() && this.boxElem){
        chooseFile = this.fileParent.find('input[type="file"]');
        chooseFile
            .on('change',me.fileChange.bind(me))
    }
};
/**
 * 选择图片的事件处理程序
 * @param event
 */
Preview.prototype.fileChange = function (event) {
    var target,reader,file,me,type;
    target =  event.target;
    me = this;
    file = target.files[0];
    type = file.type;
    if(type !== 'image/png' && type !== 'image/jpg' && type !== 'image/jpeg'){
        alert('文件格式不正确');
        if(this.boxElem.attr('id') !== this.fileParent.attr('id')){
            this.fileParent.find('#warp').show();
        }
        return this;
    }

    reader = new FileReader();
    if(file){
        reader.readAsDataURL(file);
    }
    reader.onload = function () {
        me.show(reader);
    }
};
/**
 * 显示
 * @param reader fileReader对象
 */
Preview.prototype.show = function (reader) {
    var preView,img;
    this.boxElem.show();
    if(this.fileParent.attr('id') !== this.boxElem.attr('id')){
        this.fileParent.find('#warp').hide();
    }
    preView = this.boxElem.find('#preview');
    img = preView.find('#preImg');
    if(img.length > 0 ){
        img.attr('src',reader.result);
    }else{
        preView.append($('<img id="preImg" src="'+ reader.result +'"/>'));
    }
    if(this.callback){
        this.callback();
    }

};
/**
 * 是否支持预览
 * @returns {boolean}
 * @private
 */
Preview.prototype.__isSupport = function () {
    return typeof FileReader === 'function';
}
var preview = new Preview();
module.exports = preview;