/**
 * Created by star on 2017/3/23.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
var scrollLoading = require('./scrollLoading.js');
var zpList = $('#zpList');
var focusList = $('#focusList');
//滚动加载
scrollLoading.start(zpList,'productionmessage',2,callback);

function focus(focusList) {
    var deleteIcons;
    if(focusList && focusList.length > 0){
        deleteIcons = focusList.find('.delete');
        deleteIcons
            .unbind('click')
            .on('click',focusHandle);
    }else{
        return;
    }
}
/**
 * 关注
 * @param event 事件对象
 */
function focusHandle(event) {
    var $target,data;
    data = {};
    $target = $(event.target);
    data.beEmail = $target.attr('data-code');
    //0表示取消关注，1表示关注
    data.control = 0;
    data.loadimg = true;
    ajax.focus(data,$target);
}
focus(focusList);

/**
 * 删除作品
 * @param zpList 作品列表
 */
function deleteZP(zpList) {
    var deleteBtn;
    if(!zpList || zpList.length <= 0) return ;
    //获取delete元素
    deleteBtn = zpList.find('.delete');
    if(deleteBtn.length <= 0) return;
    //给delete元素绑定click事件
    deleteBtn
        .on('click',function (event) {
            var $target,data;
            $target = $(event.target);
            data = {
                zpCode:$target.attr('data-code'),
                role:'desi'
            };
            ajax.deleteZP(data,$target.parents('.item'));
        });
}
deleteZP(zpList);
/**
 * 回调函数
 */
function callback() {
    deleteZP(zpList);
    focus(focusList);
}
/**
 * 翻页
 * @constructor
 */
function TurnPage() {
    this.maxPage = 1;
    this.curPage = 1;
    this.warp = null;
    this.callback = null;
}
/**
 * 入口
 * @param list
 * @param turnBar
 * @param curPage 当前页
 * @callback 请求成功要执行的回调
 */
TurnPage.prototype.start = function (list,turnBar,curPage,callback) {
    var nextPage,prevPage;
    if(!list || list.length <= 0) return;
    this.warp = list;
    if(!turnBar || turnBar.length <= 0) return;
    if(list.attr('data-maxPage')) this.maxPage = list.attr('data-maxPage') | 0;
    if(typeof curPage !== 'undefined' && (typeof curPage === 'number' || typeof ( curPage | 0 ) === 'number')) this.curPage = curPage | 0;
    nextPage = turnBar.find('#nextPage');
    prevPage = turnBar.find('#prevPage');
    this.curEmail = turnBar.attr('data-curEmail');
    if(nextPage.length <= 0 || prevPage.length <= 0) return ;
    if(typeof callback === 'function') this.callback = callback;
    this.nextPage = nextPage;
    this.prevPage = prevPage;
    //绑定事件
    nextPage
        .unbind('click')
        .on('click',this.__nextPage.__bind(this));
    prevPage
        .unbind('click')
        .on('click',this.__prevPage.__bind(this));

};
/**
 * 下一页
 * @param event 事件对象
 * @private
 */
TurnPage.prototype.__nextPage = function (event) {
    var data;
    if(this.__check($(event.target))){
        data = {
            nextPage:this.curPage+1,
            curEmail:this.curEmail
        };
        ajax.turnPage(data,this.warp,this.__before.__bind(this),this.__after.__bind(this,data.nextPage));
    }
};
/**
 * 上一页
 * @param event 事件对象
 * @private
 */
TurnPage.prototype.__prevPage = function (event) {
    var data;
    data = {
        nextPage:this.curPage-1,
        curEmail:this.curEmail
    };
    if(this.__check($(event.target))){
        ajax.turnPage(data,this.warp,this.__before.__bind(this),this.__after.__bind(this,data.nextPage));
    }
};
/**
 * 请求发送前的回调
 * @private
 */
TurnPage.prototype.__before = function () {
    this.prevPage.unbind('click');
    this.nextPage.unbind('click');
};
/**
 * 请求成功后的回调
 * @param curPage 当前页
 * @private
 */
TurnPage.prototype.__after = function (curPage) {
    this.curPage = curPage;
    //如果现在已经是最后一页
    if(this.curPage >= this.maxPage){
        this.nextPage.addClass('off');
        this.prevPage.removeClass('off');
    }
    //如果现在已经是第一页
    if(this.curPage <= 1){
        this.prevPage.addClass('off');
        this.nextPage.removeClass('off');
    }
    //调用从外部传入的回调函数
    if(this.callback) this.callback();
    this.prevPage.on('click',this.__prevPage.__bind(this));
    this.nextPage.on('click',this.__nextPage.__bind(this))

};
/**
 * 检查翻页是否有效
 * @param target jquery 对象
 * @private
 */
TurnPage.prototype.__check = function (target) {
    if(target.attr('class').indexOf('off') >= 0){
        return false;
    }else{
        return true;
    }
};
var turnPage = new TurnPage();
turnPage.start(focusList,$('#turnPage'),1,callback);



