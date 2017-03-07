/**
 * Created by star on 2017/3/6.
 */
var $ = require('jquery');
var ajax = require('./ajax.js');
/**
 * 提交表单类
 * @constructor
 */
function SubmitForm(){
    //要提交的表
    this.fromElem = null;
    //不验证的表单字段
    this.exclude = null;
    this.url = null;
    //是否需要上传文件，默认是
    this.file = true;
}
/**
 * 入口
 * @param formElem 要提交的表单，jquery节点
 * @param exclude 不验证的表单字段，数组.['id1','id2'...]
 * @param url 提交的类型
 * @param haveFile 需要上传文件
 * @returns {SubmitForm}
 */
SubmitForm.prototype.start = function(formElem,url,haveFile,exclude){
    var submit,me;
    this.fromElem = formElem;
    this.url = url;
    if(!haveFile){
        this.file = false;
    }
    if(exclude instanceof Array){
        this.exclude = exclude;
    }else if(exclude){
        this.exclude = [exclude];
    }else{
        this.exclude = [];
    }
    this.exclude.push('submit');

    submit = formElem.find('#submit');
    me = this;
    submit
        .unbind('click')
        .on('click',me.__submit.bind(me));
    return this;
};
/**
 * 检查表单字段
 * @param exclude 不检查的字段
 * @private
 */
SubmitForm.prototype.__check = function(exclude){
    var formElem,elems,result,formData,haveFile;
    formElem = this.fromElem;
    haveFile = this.file;
    result = {
        status:1,
        msg:'验证成功',
        data:{}
    };
    formData = new FormData();
    elems = formElem[0].elements;
    elems = this.__toArray(elems);
    //排除不要验证的元素
    for(var i = 0,len = elems.length;i<len;i++){
        for(var j = 0,k = exclude.length;j<k;j++){
            if(elems[i].id === exclude[j]){

                elems.splice(i,1);
                // [].splice.call(elems,i,1);
                i--;
                len--;
                break;
            }
        }
    }
    //开始验证
    for(i = 0,len = elems.length;i<len;i++){
        var $elem = $(elems[i]);
        if($elem.prop('id') === 'password' && $elem.val().trim().length < 6){
            result = {
                status:0,
                msg:'密码长度小于6'
            };
            break;
        }else if($elem.prop('id') ==='email' && !/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test($elem.val().trim())){
            result = {
                status:0,
                msg:'电子邮箱格式不正确'
            };
            break;
        }else if($elem.prop('type') === 'file' && $elem[0].files.length <= 0){
            result = {
                status:0,
                msg:'还没有选择文件'
            }
        }else if(($elem.prop('type') === 'text' || $elem.prop('type') === 'textarea') && $elem.val().trim().length <= 0){
            result = {
                status:0,
                msg:'没有输入'+$elem.attr('data-info')
            };
            break;
        }else if($elem.prop('id') === 'surePW' && formElem.find('#password').val().trim() !== $elem.val().trim()){
            result = {
                status:0,
                msg:'两次密码不一致'
            }
        }else{
            //如果不需要上传文件
            if(!haveFile){
                result.data[$elem.prop('name')] = $elem.val().trim();
            }else{
                if(this.isSupportFormData()){
                    if($elem.prop('type') === 'file'){
                        formData.append($elem.prop('name'),$elem[0].files[0]);
                    }else{
                        formData.append($elem.prop('name'),$elem.val().trim());
                    }
                    result.data = formData;
                }
            }
        }
    }
    return result;
};
/**
 * 提交表单
 * @param event 事件对象
 * @returns {SubmitForm}
 */
SubmitForm.prototype.__submit = function(event){
    var result;
    result = this.__check(this.exclude);
    //如果验证没有通过
    if(!result.status){
        alert(result.msg);
    }else{
        if(!this.file || this.isSupportFormData()){
            ajax.submitForm(this.url,result.data);
        }else{
            if(this.file){
                this.fromElem.submit();
            }

        }
    }
    return this;
};
/**
 * 判断是否支持FromData
 * @returns {boolean}
 */
SubmitForm.prototype.isSupportFormData = function(){
    return typeof FormData === 'function';
};
/**
 * 将一个类数组转换为数组
 * @param likeArray 类数组
 * @private
 */
SubmitForm.prototype.__toArray = function (likeArray) {
    var arr;
    arr = null;
    try {
        arr = Array.prototype.slice.call(likeArray,0);
    }catch (ex){
        arr = new Array();
        for(var i = 0,len = likeArray.length;i<len;i++){
            arr.push(likeArray[i]);
        }
    }
    return arr;
}
var submitForm = new SubmitForm();
module.exports = submitForm;