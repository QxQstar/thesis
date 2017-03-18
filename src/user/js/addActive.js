/**
 * Created by star on 2017/3/8.
 */
require('./../css/addActive.css');
var $ =require('jquery');
var submitForm = require('./submitForm.js')();
var preview = require('./preview.js');
var controlNum = require('./controlNum.js');
submitForm.start($('#addActive'),'issueActive',true,[]);
//预览功能
preview.start($('#addActive'));
//控制输入的字数
controlNum.start($('#desc'),$('#num'),300);
