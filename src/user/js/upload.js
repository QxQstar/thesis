/**
 * Created by star on 2017/3/6.
 */
require('./../css/upload.css');
var $ =require('jquery');
var submitForm = require('./submitForm.js')();
var preview = require('./preview.js');
var controlNum = require('./controlNum.js');
submitForm.start($('#upload'),'issueZP',true,[]);
//预览功能
preview.start($('#upload'));
//限制字数
controlNum.start($('#intro'),$('#num'),300);
