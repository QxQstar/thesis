/**
 * Created by star on 2017/3/8.
 */
require('./../css/addActive.css');
var $ =require('jquery');
var wangEditor = require('wangeditor');
var submitForm = require('./submitForm.js')();
var preview = require('./preview.js');
var controlNum = require('./controlNum.js');
submitForm.start($('#addActive'),'issueActive',true,[]);
//预览功能
preview.start($('#addActive'));
//引入富文本编辑器
var editor = new wangEditor('desc');
editor.config.menuFixed = false;
editor.config.menus = $.map(wangEditor.config.menus, function(item, key) {
    if (item === 'img') {
        return null;
    }
    if (item === 'fullscreen') {
        return null;
    }
    if(item === 'video'){
        return null;
    }
    if(item === 'location'){
        return null;
    }
    if(item === 'table'){
        return null;
    }
    return item;
});
editor.create();
