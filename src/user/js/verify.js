/**
 * Created by star on 2017/3/12.
 */
require('./../css/question.css');
var $ = require('jquery');
var submitForm = require('./submitForm.js')();
var changeQuestion = require('./changeQuestion.js');
var createYZM = require('./createYZM.js');
var select = $('select');
var yzmNum = $('#yzmNum');
if($("#admin").length > 0){
    submitForm.start($('#verify'),'adminVerify' ,false,[],[]);
}else{
    submitForm.start($('#verify'),'verify' ,false,[],[]);
}

if(select.length > 0){
    changeQuestion.start(select);
}
if(yzmNum.length >0){
    createYZM.start(yzmNum);
}