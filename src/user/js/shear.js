/**
 * Created by star on 2017/3/9.
 */
var $ = require('jquery');
window.$ = $;
require('./jquery-ui.min.js');
/**
 * 切割
 * @constructor
 */
function Shear() {
    this.previewBox = null;
    this.cvsMove = null;
    this.maxW = 200;
    this.maxH = 200;
    this.thum = null;
}
/**
 * 入口
 * @param previewBox 预览元素的父元素
 * @returns {Shear}
 */
Shear.prototype.start = function (previewBox) {
    if(!arguments.length) return this;
    var me = this;
    this.previewBox = arguments[0];
    this.thum = this.previewBox.find('#thum');
    this.cvsMove = this.previewBox.find('#cvsMove');
    this.showCanvas();
    return this;

};
/**
 * 显示出canvas
 */
Shear.prototype.showCanvas = function () {
    var preImg,h,w,me,cvsH,cvsW,rateH,rateW;
    me = this;
    preImg = this.previewBox.find('#preImg');
    h = preImg.height();
    w = preImg.width();
    if(h < this.maxH || w < this.maxW){
        this.cvsMove[0].width = cvsW = Math.min(h,w);
        this.cvsMove[0].height = cvsH = Math.min(h,w);
    }else{
        this.cvsMove[0].width= cvsW = this.maxW;
        this.cvsMove[0].height= cvsH = this.maxH;
    }
    rateH = h/preImg[0].naturalHeight;
    rateW = w/preImg[0].naturalWidth;
    this.__drawImg(preImg,0,0,cvsW/rateW,cvsH/rateH,0,0,cvsW,cvsH);
    this.cvsMove.draggable(
        {
            containment: "parent",
            drag:function (event,ui) {
                var left,top;
                left = ui.position.left;
                top = ui.position.top;
                me.__drawImg(preImg,left/rateW,top/rateH,cvsW/rateW,cvsH/rateH,0,0,cvsW,cvsH);
            }
        }
    )
};
/**
 * 在canvas上显示图片
 * @param myImg 要显示的图片节点
 * @param sx 图片的起点在原图片上的x坐标
 * @param sy 图片的起点在原图上的y坐标
 * @param sW 在原图上的宽度
 * @param sH 在原图上的高度
 * @param dx 起点在canvas上的x坐标
 * @param dy 起点在canvas上的y坐标
 * @param dW 在canvas上的宽度
 * @param dH 在canvas上的高度
 * @private
 */
Shear.prototype.__drawImg = function (myImg,sx,sy,sW,sH,dx,dy,dW,dH) {
    var cxt,thum,me;
    me = this;
    cxt = this.cvsMove[0].getContext('2d');
    cxt.drawImage(myImg[0],sx,sy,sW,sH,dx,dy,dW,dH);
    thum = this.thum;
    thum
        .attr('src',this.cvsMove[0].toDataURL('image/jpeg',1))
        .width(this.maxW)
        .height(this.maxH)
};
var shear = new Shear();
module.exports = shear;