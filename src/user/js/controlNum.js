/**
 * Created by star on 2017/3/12.
 */
/**
 * ��ֵ���������
 * @constructor
 */
function ControlNum(){
    //�����
    this.insetBox = null;
    //��ʾ��ǰ������Ԫ��
    this.showElem = null;
    //�ܹ�������������
    this.maxNum = 0;
}
/**
 * ���
 * @param insetBox �����jquery ����
 * @param showElem ��ʾ������Ԫ�� jquery ����
 * @param maxNum �������
 */
ControlNum.prototype.start = function(insetBox,showElem,maxNum){
    var me;
    me = this;
    if(insetBox){
        this.insetBox = insetBox;
    }
    if(showElem){
        this.showElem = showElem;
    }
    if(maxNum){
        this.maxNum = maxNum;
    }
    if(this.showElem && this.insetBox){
        showElem.html(me.insetBox.val().trim().length + '/' + me.maxNum);
        insetBox
            .unbind('keyup')
            .on('keyup',me.insert.bind(me));
    }else{
        return this;
    }
};
/**
 * ����
 */
ControlNum.prototype.insert = function(){
    var me,curNum,chars;
    me = this;
    chars = me.insetBox.val().trim();
    curNum = chars.length;
    if(curNum >= me.maxNum){
        curNum = me.maxNum;
        me.showElem.css('color','#ff3300');
        me.insetBox.val(chars.slice(0,me.maxNum));
    }else{
        me.showElem.css('color','#444');
    }
    me.showElem.html(curNum + '/'+me.maxNum);
};
var controlNum = new ControlNum();

module.exports = controlNum;