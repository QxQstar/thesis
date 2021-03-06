/**
 * Created by star on 2017/3/7.
 */
var $ = require('jquery');
/**
 * 预览类
 * @constructor
 */
function Preview() {
    this.boxElem = null;
    this.fileParent = null;
    this.callback = null;
    this.type = null;
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
            .on('change',me.fileChange.__bind(me))
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
    this.type = type;
    if(type !== 'image/png' && type !== 'image/jpg' && type !== 'image/jpeg'){
        layer.alert('文件格式不正确',function (index) {
            if(me.boxElem.attr('id') !== me.fileParent.attr('id')){
                me.fileParent.find('#warp').show();
            }
            layer.close(index);
            return me;
        });

    }else{
        reader = new FileReader();
        if(file){
            reader.readAsDataURL(file);
        }
        reader.onload = function () {
            me.show(reader);
        }
    }

};
/**
 * 显示
 * @param reader fileReader对象
 */
Preview.prototype.show = function (reader) {
    var preView,img,controlW,controlH,checkSize,loaded,me;
    this.boxElem.show();
    if(this.fileParent.attr('id') !== this.boxElem.attr('id')){
        this.fileParent.find('#warp').hide();
    }
    preView = this.boxElem.find('#preview');
    //规定的尺寸
    controlH = preView.attr('data-height') ;
    controlW = preView.attr('data-width') ;
    //检查图片的尺寸
    checkSize = function(img){
        if(controlH && img[0].naturalHeight !== ( controlH |0 )){
            //如果预览框还没有图片
            if(img.attr('presrc')){
                img.attr('src',img.attr('presrc'))
            }else{
                img.attr('src','');
            }
            layer.alert('图片尺寸不符合规定');
            return false;

        }
        else if(controlW &&img[0].naturalWidth !== ( controlW |0 )){
            if(img.attr('presrc')){
                img.attr('src',img.attr('presrc'))
            }else{
                img.attr('src','');
            }
            layer.alert('图片尺寸不符合规定');
            return false;
        }
        else {
            return true;
        }

    };
    me = this;
    //图片加载结束的处理程序
    loaded = function () {
        if(!checkSize(img)){
            return this;
        }
        if(me.callback){
            me.callback(me.type);
        }
    };
    img = preView.find('#preImg');
    if(img.length > 0 && img.attr('src')){
        img
            .unbind('load')
            .on('load',loaded);
        img
            .attr({
                'presrc': img.attr('src'),
                'src':reader.result
            });
        img.attr('style','');

    }else{
        if(img.length < 1) {
            preView.append($('<img id="preImg"/>'));
        }
        img = preView.find('#preImg');
        img
            .unbind('load')
            .on('load',loaded);
        img.attr('src',reader.result);

    }


};
/**
 * 是否支持预览
 * @returns {boolean}
 * @private
 */
Preview.prototype.__isSupport = function () {
    return typeof FileReader === 'function';
};
var preview = new Preview();
module.exports = preview;