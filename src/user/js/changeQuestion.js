/**
 * Created by star on 2017/3/12.
 */
var $ = require('jquery');
/**
 * ѡ������
 * @constructor
 */
function ChangeQuestion(){
    this.selectElem = null;
}
/**
 * ���
 * @param selectElem ѡ��� jquery �������������
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
 * change�¼��Ĵ�����
 * @param event �¼�����
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
 * ��ʾ�������������б��е�ֵ
 * @param id ��ǰ�����б��idֵ
 * @param isShowAll ��ʾ��һ�������б��е�ȫ��ѡ��
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