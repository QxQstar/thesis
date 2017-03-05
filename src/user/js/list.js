/**
 * Created by star on 2017/3/5.
 */
var $ = require('jquery');
function AssignList(){
}
/**
 * ���
 */
AssignList.prototype.start = function(){
    var hotPro,newPro,otherPro;
    hotPro = $('#hotPro');
    newPro = $('#newPro');
    otherPro = $('#otherZP');
    if(hotPro.length >0){
        this
            . __assign(hotPro)
            .__blindEvent(hotPro);
    }
    if(newPro.length > 0){
        this.__assign(newPro)
            .__blindEvent(newPro);
    }
    if(otherPro.length >0){
        this
            .__assign(otherPro)
            .__blindEvent(otherPro);
    }
};
/**
 * ���б���в���
 * @param list �б�
 * @returns {AssignList}
 * @private
 */
AssignList.prototype.__assign = function(list){
    var imgs,me;
    me = this;
    imgs = list.find('img');
    imgs.each(function(index,cur){
        var $cur;
        $cur = $(cur);
        //$cur.on('load',me.__layoutS.bind(me));
        me
            .__layoutS.call(me,$cur)
    });
    return this;
};
/**
 * ���¼�
 * @param elem jquery Ԫ��
 * @returns {AssignList}
 * @private
 */
AssignList.prototype.__blindEvent = function(elem){

    var imgBoxs,me;
    me = this;
    imgBoxs = elem.find('.img');
    imgBoxs.each(function(index,cur){
        var $cur;
        $cur = $(cur);
        $cur.hover(me.__change.bind(me),me.__layoutS.bind(me));
    });
    return this;
};
/**
 * �ı�ͼƬ��С
 * @param event
 * @private
 */
AssignList.prototype.__change = function(event){
    if($(window).width() < 789){
        return this;
    }
    var $target,parent,PH,PW,TH,TW;
    $target = $(event.target);
    if($target.attr('class') === 'img'){
        parent = $target;
        $target = $target.children('img');
    }else{
        parent = $target.parent('.img');
    }
    PH = parent.height();
    PW = parent.width();
    TH = $target.data('originH');
    TW = $target.data('originW');
    //���ͼƬ�ܿ�
    if(TW / TH > PW / PH){
        $target
            .width(PW)
            .height(PW * TH / TW)
            .css({
                left:-(PW - PW) /2 +'px',
                top:-((PW * TH / TW)-PH)/2 + 'px'
            })

    }else{
        $target
            .height(PH)
            .width(TW / TH * PH)
            .css({
                left:-((TW / TH * PH) - PW) /2 + 'px',
                top:-(PH-PH)/2 + 'px'
            })
    }
};
/**
 * ��ʼ��λ��
 * @param event �¼�����
 */
AssignList.prototype.__layoutS = function(event){
    var $target,parent,PW,PH,TW,TH;
    $target = $(event.target);
    if($target.attr('class') === 'img'){
        parent = $target;
        $target = $target.children('img');
    }else{
        parent = $target.parent('.img');
    }
    if(event.length > 0){
        $target = event;
        parent = $target.parent('.img');
    }
    PH = parent.height();
    PW = parent.width();
    TW = $target.width();
    TH = $target.height();
    if(!$target.data('originW')){
        $target.data({
            'originW':TW,
            'originH':TH
        });
    }
    $target
        .css({
            left:-($target.data('originW')-PW)/2 +'px',
            top:-($target.data('originH')-PH)/2 + 'px'
        })
        .width($target.data('originW'))
        .height($target.data('originH'));
};

var assignList = new AssignList();
module.exports = (function(){
    assignList.start();
})();
