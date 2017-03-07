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
}
/**
 * 入口
 * @param boxElem 父元素，通常是一个表单
 */
Preview.prototype.start = function (boxElem) {
    this.boxElem = boxElem;
    var chooseFile,me;
    me = this;
    if(this.__isSupport() && this.boxElem){
        chooseFile = boxElem.find('input[type="file"]');
        chooseFile
            .on('change',me.fileChange.bind(me))
    }
};
/**
 * 选择图片的事件处理程序
 * @param event
 */
Preview.prototype.fileChange = function (event) {
    var target,reader,file,me;
    target =  event.target;
    file = target.files[0];
    me = this;
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
    preView = this.boxElem.find('#preview');
    img = preView.find('img');
    if(img.length > 0 ){
        img.attr('src',reader.result);
    }else{
        preView.append($('<img src="'+ reader.result +'"/>'));
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