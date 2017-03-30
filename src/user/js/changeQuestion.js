/**
 * Created by star on 2017/3/12.
 */
var $ = require('jquery');
/**
 * 选择问题
 * @constructor
 */
function ChangeQuestion(){
    this.selectElem = null;
}
/**
 * 入口
 * @param selectElem 选择框 jquery 对象或者类数组
 */
ChangeQuestion.prototype.start = function(selectElem){
    var me;
    me = this;
    if(selectElem){
        this.selectElem = selectElem;
        selectElem.each(function(index,cur){
            var $cur;
            $cur = $(cur);
            $cur
                .unbind('change')
                .on('change',me.__change.bind(me));
        })
    }else{
        return this;
    }
};
/**
 * change事件的处理函数
 * @param event 事件对象
 * @private
 */
ChangeQuestion.prototype.__change = function(event){
    var value,$target,me;
    $target = $(event.target);
    me = this;
    value = $target.val();
    if(value !== 'default'){
        me.__showOrHide($target.attr('id'),false);
    }else{
        me.__showOrHide($target.attr('id'),true);
    }
};
/**
 * 显示或者隐藏下拉列表中的值
 * @param id 当前下拉列表的id值
 * @param isShowAll 显示另一个下拉列表中的全部选项
 * @private
 */
ChangeQuestion.prototype.__showOrHide = function(id,isShowAll){
    var me,show;
    me = this;
    show = function($cur){
        $cur.find('option').each(function(index,option){
            var $option = $(option);
            $option.show();
        })
    };
    me.selectElem.each(function(index,cur){
        var $cur = $(cur);
        if($cur.attr('id') !== id){
            if(isShowAll){
                show($cur);
            }else{
                show($cur);
                $cur.find("option[value='"+ $('#'+id).val() +"']").hide();
            }
        }
    })
};
var changeQuestion = new ChangeQuestion();
module.exports = changeQuestion;