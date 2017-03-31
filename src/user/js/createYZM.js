/**
 * Created by star on 2017/3/8.
 */
var $ = require('jquery');
function CreateYZM() {
    this.yzmBox = null;
    this.isSupport = null;
    this.text = ['3','4','5','6','7','8','9','a','b','c','A','B','C','D','d','F','G','g','H','h','J','j','M','m','N','n'];
}
/**
 * 入口
 * @param yzmBox 验证码盒子，jquery对象
 * @returns {CreateYZM}
 */
CreateYZM.prototype.start = function (yzmBox) {
    var me;
    me = this;
    if(!yzmBox || yzmBox.length < 1) return false;

   this.yzmBox = yzmBox;
   this.isSupport = this.__isSupportCanvas();
   this.__createYZM();
    yzmBox
        .unbind('click')
        .on('click',me.__bind(me.__createYZM));

    return this;
};
/**
 * 创建验证码
 * @private
 */
CreateYZM.prototype.__createYZM = function () {
    if(this.isSupport){
        this.__canvasYZM();
    }else{
        this.__textYZM();
    }
};
/**
 * 创建canvas类型的验证码
 * @private
 */
CreateYZM.prototype.__canvasYZM = function () {
    var canvas,content,W,H,font,textW,textH;
    canvas = document.createElement('canvas');
    content = canvas.getContext('2d');
    canvas.width = content.width = W = this.yzmBox.width();
    canvas.height = content.width = H = this.yzmBox.height();
    content.font = 'bold 20px consolas';
    content.textBaseline = 'middle';
    content.fillStyle = '#444';
    font = this.__getText();
    this.yzmBox.attr('data-yzm',font);
    textW = 50;
    textH = 25;
    if(content.measureText){
        textW = content.measureText(font).width;
    }
    content.fillText(font,(W-textW)/2,18);
    this.yzmBox.html($(canvas));
};
/**
 * 创建文字类型的验证码
 * @private
 */
CreateYZM.prototype.__textYZM = function () {
    var text,span,textW,W;
    text = this.__getText();
    textW = 50;
    W = this.yzmBox.width();
    this.yzmBox.attr('data-yzm',text);
    span = $('<span></span>')
        .text(text)
        .css({
            display:'block',
            width:'100%',
            height:'100%',
            lineHeight:'35px',
           textAlign:'center',
            fontSize:'20px',
            color:'#444'

        });
    this.yzmBox.html(span);
};
CreateYZM.prototype.__getText = function () {
    var len,font,i,textLen,text;
    len = this.text.length;
    text = this.text;
    textLen = 4;
    font = [];
    for(i=0;i<textLen;i++){
        font.push( text[Math.random()*len | 0] );
    }
    return font.join('');

};
/**
 * 检查是否支持canvas
 * @returns {boolean}
 * @private
 */
CreateYZM.prototype.__isSupportCanvas = function () {
    var canvas = document.createElement('canvas');
    return canvas.getContext ? true : false;
};
/**
 * 兼容es5中的bind
 * @param func 要调用的函数
 * @private
 */
CreateYZM.prototype.__bind = function (func) {
    if(typeof func.bind === 'function'){
        return func.bind(this);
    }else{
        return function () {
            func.call(this);
        }
    }
};
var createYZM = new CreateYZM();
module.exports = createYZM;