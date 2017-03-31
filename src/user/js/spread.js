/**
 * Created by star on 2017/3/8.
 */
var $ = require('jquery');
/**
* 折叠
* @constructor
*/
function Spread(emitType){
    this.control = null;
    this.controlBox = null;
    this.onStr ='开启';
    this.offStr = '关闭';
    this.emitType = emitType;
}
/**
 * 入口
 * @param control 控制按钮， jquery对象
 * @param box   要控制的元素，jquery对象
 * @param onStr 处于关闭时的提示字符串
 * @param offStr  处于开启时的提示字符串
 * @returns {Spread}
 */
Spread.prototype.start = function(control,box,onStr,offStr){
    if(control.length > 0){
        this.control = control;
    }
    if(box.length > 0){
        this.controlBox = box;
    }
    if(offStr){
        this.offStr = offStr
    }
    if(onStr){
        this.onStr = onStr;
    }
    if(this.control && this.controlBox){
        this.__blindEvent(this.emitType || 'click');
    }
    return this;
};
/**
 * 绑定事件
 * @param type 触发类型
 * @private
 */
Spread.prototype.__blindEvent = function(type){
    var control,me;
    control = this.control;
    me = this;
    control
        .unbind(type)
        .on(type,me.__handler.__bind(me));
};
Spread.prototype.__handler = function(event){
    var control,box,me;
    event.stopPropagation();
    me = this;
    control = this.control;
    box = this.controlBox;
    //当前处于展开状态
    if(control.attr('data-status') && control.attr('data-status').indexOf('on') >= 0){
        box.css({
            height:'0'
        });
        control
            .html(me.onStr)
            .attr('data-status','off')
            .addClass('on');

    }else{
        control
            .html(me.offStr)
            .attr('data-status','on')
            .removeClass('on');
        box.css({
            height:'auto'
        })
    }

};
var spread = new Spread('click');
module.exports = spread;
