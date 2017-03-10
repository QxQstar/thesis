/**
 * Created by star on 2017/3/10.
 */
require('./../css/systemAdmin.css');
var $ = require('jquery');
var spread = require('./spread.js');
var submitForm = require('./submitForm.js')();
var preview = require('./preview.js');
var addSystemImg = $('#addSystemImg');
var spreadBtn = $('#spread');
spread.start(spreadBtn,addSystemImg,spreadBtn.html(),'关闭');
//如果有图片预览
if($('#preview').length > 0){
    preview.start(addSystemImg,addSystemImg,previewCallback.bind(this,addSystemImg.find('#bottom')));
}
submitForm.start(addSystemImg,'systemAdmin',true,[],[]);
//预览结束的回调函数
function previewCallback(){
    var param1;
    if(arguments.length < 0){
        return this;
    }
    param1 = arguments[0];
    param1.show();
}
