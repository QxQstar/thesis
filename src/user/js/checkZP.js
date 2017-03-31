/**
 * Created by star on 2017/3/22.
 */
var ajax = require('./ajax.js');
var $ = require('jquery');
function CheckZP() {
    this.zpList = null;
}
/**
 * 入口
 * @param zpList 需要审核的作品列表，jquery对象
 */
CheckZP.prototype.start = function (zpList) {
    if(zpList && zpList.length > 0){
        this.zpList = zpList;
        this.addEvent();
    }else{
        return this;
    }

};
/**
 * 给审核绑定事件
 */
CheckZP.prototype.addEvent = function () {
    var agree,limit,item,me;
    me = this;
    item = this.zpList.find('.item');
    item.each(function (index,cur) {
        var $cur;
        $cur = $(cur);
        limit = $cur.find('.limit');
        agree = $cur.find('.agree');
        //绑定事件
        limit
            .on('click',me.limit);
        agree
            .on('click',me.agree);
    });

};
/**
 * 不通过审核
 */
CheckZP.prototype.limit = function (event) {
    var $target,parent,data;
    $target = $(event.target);
    parent = $target.parents('.item');
    data = {
        'zpCode':parent.attr('data-code'),
        'control':0
    };
    ajax.checkZP(data);
};
/**
 * 通过审核
 */
CheckZP.prototype.agree = function (event) {
    var $target,parent,data;
    $target = $(event.target);
    parent = $target.parents('.item');
    data = {
        'zpCode':parent.attr('data-code'),
        'control':1
    };
    ajax.checkZP(data);
};
var checkZP = new CheckZP();
module.exports = checkZP;
