/**
 * Created by star on 2017/3/5.
 */
require('./../css/signin.css');
var $ = require('jquery');
/**
 * �۵�
 * @constructor
 */
function Spread(emitType){
    this.control = null;
    this.emitType = emitType;
    this.addMessage = null;
}
/**
 * ���
 * @returns {Spread}
 */
Spread.prototype.start = function(){
    var control,addMessage;
    control = $('#spread');
    addMessage = $('#questions');
    if(control.length > 0){
        this.control = control;
    }
    if(addMessage.length > 0){
        this.addMessage = addMessage;
    }
    if(this.control && this.addMessage){
        this.__blindEvent(this.emitType || 'click');
    }
    return this;
};
/**
 * ���¼�
 * @param type ��������
 * @private
 */
Spread.prototype.__blindEvent = function(type){
    var control,me;
    control = this.control;
    me = this;
    control
        .unbind(type)
        .on(type,me.__handler.bind(me));
};
Spread.prototype.__handler = function(event){
    var control,addMessage;
    event.stopPropagation();
    control = this.control;
    addMessage = this.addMessage;
    //��ǰ����չ��״̬
    if(control.attr('class').indexOf('on') >= 0){
        control.removeClass('on');
        addMessage
            .animate({
                height:'0'
            },400)
    }else{
        control.addClass('on');
        addMessage
            .animate({
                height:'200px'
            },400)
    }

};
var spread = new Spread('click');
spread.start();
