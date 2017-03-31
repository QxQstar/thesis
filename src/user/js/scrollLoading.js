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
    this.callback = null;
}
/**
 * 入口
 * @param container 容纳数据的容器，jquery对象
 * @param table 数据表
 * @param nextPage 要加载的页
 * @param callback 回调函数
 */
ScrollLoading.prototype.start = function (container,table,nextPage,callback) {
    var me;
    if(!container || container.length <= 0) container = $('body');
    this.container = container;
    if(!table) return this;
    this.table = table;
    if(typeof nextPage !== 'undefined') this.nextPage = nextPage;
    if(typeof container.attr('data-maxPage') !== 'undefined') this.maxPage = container.attr('data-maxPage') | 0;
    if(typeof callback === 'function') this.callback = callback;
    me =  this;
    //给window绑定scroll事件
    $(window).scroll(me.__throttle.__bind(me,me.__checkPosition));
};
ScrollLoading.prototype.__throttle = function (callback) {
    var me ;
    me = this;
    clearTimeout(callback.id);
    callback.id = setTimeout(callback.__bind(me),50);
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
    if(me.maxPage < me.nextPage && $('#noData').length <= 0){
        me.container.append($('<p id="noData">无更多数据</p>'));
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
    //加载活动
    if(this.table === 'activemessage'){
        data.role = this.container.attr('data-role');
        ajax.loadingActive(data,this.container,this.__addPage.__bind(this),this.__before.__bind(this));
    }
    //加载作品
    else if(this.table === 'productionmessage'){
        data.role = this.container.attr('data-role');
        data.status = this.container.attr('data-status');
        if(this.container.attr('data-email')){
            data.email = this.container.attr('data-email');
        }
        ajax.loadingZP(data,this.container,this.__after.__bind(this),this.__before.__bind(this));
    }
    //加载用户
    else{
        data.role = this.container.attr('data-role');
        ajax.loadingUser(data,this.container,this.__after.__bind(this),this.__before.__bind(this));
    }

};
/**
 * 加载完成后的回调
 * @private
 */
ScrollLoading.prototype.__after = function () {
    var me;
    me = this;
    this.nextPage ++;
    $('#loading').hide();
    //给window绑定scroll事件
    $(window).scroll(me.__throttle.__bind(me,me.__checkPosition));
    if(this.callback) this.callback();
};
/**
 *  显示正在加载
 * @private
 */
ScrollLoading.prototype.__before = function () {
    $('#loading').show();
    $(window).unbind('scroll');
};
var scrollLoading = new ScrollLoading();
module.exports = scrollLoading;
