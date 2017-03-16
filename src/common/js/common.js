/**
 * Created by star on 2017/3/5.
 */
require('./../css/normalize.css');
require('./../css/base.css');
require('./../css/feature.css');
require('./../../user/css/header.css');
require('./../../user/css/footer.css');
var $ = require('jquery');
var ajax = require('./../../user/js/ajax.js');
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
    return this;
};
/**
 * 绑定事件
 * @param type 绑定事件的类型
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
 * 事件处理程序
 * @param event 事件对象
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
/**
 * 退出登录
 * @returns {NavIcon}
 */
NavIcon.prototype.signout = function () {
    var signout,handle,header;
    handle = function () {
        if(header.attr('class').indexOf('admin') >= 0){
            ajax.signout('signout','admin');
        }else{
            ajax.signout('signout','user');
        }

    };
    header = $('#header');
    if(header){
        signout = header.find('.signout');
        signout
            .unbind('click')
            .on('click',handle)
    }
    return this
};
var navIcon = new NavIcon('click');
navIcon
    .start()
    .signout()