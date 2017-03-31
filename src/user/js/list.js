/**
 * Created by star on 2017/3/5.
 */
var $ = require('jquery');
function AssignList(){
}
/**
 * 入口
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
 * 对列表进行布局
 * @param list 列表
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
        if(window.screen.width < 789){
            me.__change.call(me,$cur);
        }else{
            me
                .__layoutS.call(me,$cur)
        }

    });
    return this;
};
/**
 * 绑定事件
 * @param elem jquery 元素
 * @returns {AssignList}
 * @private
 */
AssignList.prototype.__blindEvent = function(elem){
    if(window.screen.width < 789) return this;
    var imgBoxs,me;
    me = this;
    imgBoxs = elem.find('.img');
    imgBoxs.each(function(index,cur){
        var $cur;
        $cur = $(cur);
        $cur.hover(me.__change.__bind(me),me.__layoutS.__bind(me));
    });
    return this;
};
/**
 * 改变图片大小
 * @param event
 * @private
 */
AssignList.prototype.__change = function(event){
    var $target,parent,PH,PW,TH,TW;
    if(event.length > 0){
        $target = event;
        parent = $target.parent('.img');
    }else{
        $target = $(event.target);
        if($target.attr('class') === 'img'){
            parent = $target;
            $target = $target.children('img');
        }else{
            parent = $target.parent('.img');
        }
    }

    PH = parent.height();
    PW = parent.width();
    TH = $target[0].naturalHeight;
    TW = $target[0].naturalWidth;
    //如果图片很宽
    if(TW / TH > PW / PH){
        if(window.screen.width < 789){
            $target
                .css({
                    width:PW + 'px',
                    height:PW * TH / TW + 'px',
                    left:-(PW - PW)/2 + 'px',
                    top:-((PW * TH / TW)-PH) + 'px'
            });
        }else{
            $target
                .stop(false,true)
                .animate({
                    width:PW + 'px',
                    height:PW * TH / TW + 'px',
                    left:-(PW - PW)/2 + 'px',
                    top:-((PW * TH / TW)-PH)/2 +'px'
                });
        }

    }else{
        if(window.screen.width < 789){
            $target
                .css({
                    width:TW / TH * PH + 'px',
                    height:PH + 'px',
                    left:-((TW / TH * PH) - PW) /2 + 'px',
                    top:-(PH-PH)/2 + 'px'
                });
        }else{
            $target
                .stop(false,true)
                .animate({
                    width:TW / TH * PH + 'px',
                    height:PH + 'px',
                    left:-((TW / TH * PH) - PW) /2 + 'px',
                    top:-(PH-PH)/2 + 'px'
                });
        }

    }
};
/**
 * 初始化位置
 * @param event 事件对象
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

    PW = parent.width(); console.log(PH,PW);
    TW = $target[0].naturalWidth;
    TH = $target[0].naturalHeight;
    $target
        .stop(false,true)
        .animate({
            left:-(TW-PW)/2 +'px',
            top:-(TH-PH)/2 + 'px',
            width:TW,
            height:TH
        });
};

var assignList = new AssignList();
module.exports = (function(){
    assignList.start();
})();
