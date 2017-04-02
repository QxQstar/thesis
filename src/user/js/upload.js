/**
 * Created by star on 2017/3/6.
 */
require('./../css/upload.css');
var $ =require('jquery');
var wangEditor = require('wangeditor');
var submitForm = require('./submitForm.js')();
var preview = require('./preview.js');
var controlNum = require('./controlNum.js');
if($('#editZP').length > 0){
    submitForm.start($('#upload'),'issueZP',true,['img'],[]);
}else {
    submitForm.start($('#upload'),'issueZP',true,[]);
}

//预览功能
preview.start($('#upload'));
// //限制字数
// controlNum.start($('#intro'),$('#num'),300);

//引入富文本编辑器
var editor = new wangEditor('intro');
editor.config.menuFixed = false;
editor.config.menus = [
    'source',
    '|',     // '|' 是菜单组的分割线
    'bold',
    'underline',
    'italic',
    'strikethrough',
    'eraser',
    'forecolor'
];
editor.config.colors = {
    '#880000': '暗红色',
    '#800080': '紫色',
    '#ff0000': '红色'
};
editor.create();
// 初始化编辑器的内容
editor.$txt.html('<p>添加作品说明让更多人了解你的作品</p>');