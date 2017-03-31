/**
 * Created by star on 2017/3/12.
 */
/**
 * 空值输入的字数
 * @constructor
 */
function ControlNum(){
    //输入表单
    this.insetBox = null;
    //显示当前字数的元素
    this.showElem = null;
    //能够输入的最大字数
    this.maxNum = 0;
}
/**
 * 入口
 * @param insetBox 输入框，jquery 对象
 * @param showElem 显示字数的元素 jquery 对象
 * @param maxNum 最大字数
 */
ControlNum.prototype.start = function(insetBox,showElem,maxNum){
    var me;
    me = this;
    if(insetBox && insetBox.length > 0){
        this.insetBox = insetBox;
    }
    if(showElem && showElem.length > 0){
        this.showElem = showElem;
    }
    if(maxNum){
        this.maxNum = maxNum;
    }
    if(this.showElem && this.insetBox){
        showElem.html(me.insetBox.val().trim().length + '/' + me.maxNum);
        insetBox
            .unbind('keyup')
            .on('keyup',me.__bind(me.insert));
    }else{
        return this;
    }
};
/**
 * 输入
 */
ControlNum.prototype.insert = function(){
    var me,curNum,chars;
    me = this;
    chars = me.insetBox.val().trim();
    curNum = chars.length;
    if(curNum >= me.maxNum){
        curNum = me.maxNum;
        me.showElem.css('color','#ff3300');
        me.insetBox.val(chars.slice(0,me.maxNum));
    }else{
        me.showElem.css('color','#444');
    }
    me.showElem.html(curNum + '/'+me.maxNum);
};
/**
 * 兼容es5中的bind方法
 * @param func 要调用的函数
 * @private
 */
ControlNum.prototype.__bind = function (func) {
    var me;
    me = this;
    if(typeof func.bind === 'function'){
        return func.bind(me);
    }else{
        return function () {
            func.call(me);
        };
    }
};
var controlNum = new ControlNum();

module.exports = controlNum;