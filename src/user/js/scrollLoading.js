/**
 * Created by star on 2017/3/28.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
/**
 * 滚动加载更多数据
 * @constructor
 */
function ScrollLoading(){
    this.nextPage = 2;
    this.container = null;
    this.maxPage = 1;
}
/**
 * 入口
 * @param container 容纳数据的容器，jquery对象
 * @param table 数据表
 * @param nextPage 要加载的页
 */
ScrollLoading.prototype.start = function (container,table,nextPage) {
    var me;
    if(!container || container.length <= 0) container = $('body');
    if(!table) return this;
    if(typeof nextPage !== 'undefined') this.nextPage = nextPage;
    if(typeof container.attr('data-maxPage') !== 'undefined') this.maxPage = container.attr('data-maxPage') | 0;
    me =  this;
    //给window绑定scroll事件
    $(window).scroll(me.__throttle.bind(me,me.__checkPosition));
};
ScrollLoading.prototype.__throttle = function (callback) {
    var me ;
    me = this;
    clearTimeout(callback.id);
    callback.id = setTimeout(callback.bind(me),50);
};
/**
 * 检查滚动的距离
 * @private
 */
ScrollLoading.prototype.__checkPosition = function () {
    var me,distance,totalHeight,footerH;
    distance = $(window).height() + $(window).scrollTop();
    totalHeight = $(document).height();
    footerH = $('#footer').height();
    me = this;
    if(totalHeight - footerH <= distance && me.maxPage >= me.nextPage){
        me.__loading();
    }
    //提示无更多数据
    if(me.maxPage < me.nextPage){
        me.container.append($('<p>无更多数据</p>'));
    }

};
/**
 * 加载数据
 * @private
 */
ScrollLoading.prototype.__loading = function () {
    var data;
    data={
        table:this.table,
        page:this.nextPage,
        maxPage:this.maxPage
    };
    ajax.loadingActive(data,this.__addPage,this.__before);
};
/**
 * 将下一页加1
 * @private
 */
ScrollLoading.prototype.__addPage = function () {
    this.nextPage ++;
};
/**
 *  显示正在加载
 * @private
 */
ScrollLoading.prototype.__before = function () {
    $('#loading').show();
};
var scrollLoading = new ScrollLoading();
module.exports = scrollLoading;
