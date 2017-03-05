/**
 * Created by star on 2017/3/5.
 */
require('./../css/normalize.css');
require('./../css/base.css');
require('./../css/feature.css');
require('./../../user/css/header.css');
require('./../../user/css/footer.css');
var $ = require('jquery');

function NavIcon(eventType){
    this.navList = null;
    this.control = null;
    this.eventType = eventType;
}
NavIcon.prototype.start = function(){
    var navList,control;
    navList= $('#navList');
    control = $('#control');
    if(navList.length > 0){
        this.navList = navList;
    }
    if(control.length >0 && control.attr('display') !== 'none'){
        this.control = control;
    }
    if(this.control && this.navList){
        this.__blindEvent(this.eventType);
    }

};
/**
 * ���¼�
 * @param type ���¼�������
 * @private
 */
NavIcon.prototype.__blindEvent = function(type){
    var control,me;
    control = this.control;
    me = this;
    control
        .unbind(type)
        .on(type,me.__handler.bind(me));

};
/**
 * �¼��������
 * @param event �¼�����
 * @private
 */
NavIcon.prototype.__handler = function(event){
    var control,navList,mask;
    event.stopPropagation();
    control = this.control;
    navList = this.navList;
    mask = navList
        .parents('#header')
        .find('.mask');

    if(control.attr('status') !== 'on'){
        navList
            .animate({
                width:'250px'
            },400);
        control
            .attr('status','on')
            .find('span')
            .eq(0).addClass('one')
            .next().addClass('two')
            .next().addClass('three');
        mask.show();
    }else{
        navList
            .animate({
                width:'0'
            },400);
        control
            .attr('status','off')
            .find('span')
            .removeClass();
        mask.hide();
    }
};
var navIcon = new NavIcon('click');
navIcon.start();