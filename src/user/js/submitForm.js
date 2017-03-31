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
    //不需要提交的字段
    this.notSumit = null;
}
/**
 * 入口
 * @param formElem 要提交的表单，jquery节点
 * @param exclude 非必填的表单字段，数组.['id1','id2'...]
 * @param url 提交的类型
 * @param haveFile 需要上传文件
 * *@param notSubmit 不需要提交的字段 ，数组['id1'...]
 * @returns {SubmitForm}
 */
SubmitForm.prototype.start = function(formElem,url,haveFile,exclude,notSubmit){
    var submit,me;
    this.fromElem = formElem;
    this.url = url;
    me = this;
    if(!haveFile){
        this.file = false;
    }
    if(exclude instanceof Array){
        this.exclude = exclude;
    }else if(exclude && typeof exclude === 'string'){
        this.exclude = [exclude];
    }else{
        this.exclude = [];
    }
    if(notSubmit instanceof Array){
         this.notSumit = notSubmit;
    }else if(notSubmit && typeof notSubmit === 'string'){
        this.notSumit = [notSubmit];
    }else{
        this.notSumit = [];
    }
    this.notSumit.push('submit');
    submit = formElem.find('#submit');

    submit
        .unbind('click')
        .on('click',me.__submit.__bind(me));
    return this;
};
/**
 * 检查表单字段
 * @param exclude 非必填的字段
 * @private
 */
SubmitForm.prototype.__check = function(exclude){
    var formElem,elems,result,formData,haveFile,check;
    formElem = this.fromElem;
    haveFile = this.file;
    result = {
        status:1,
        msg:'验证成功',
        data:{}
    };
    if(this.isSupportFormData() && this.file){
        formData = new FormData();
    }
    elems = formElem[0].elements;
    elems = this.__toArray(elems);

    //排除不要需要提交的元素
    for(var i = 0,len = elems.length;i<len;i++){
        for(var j = 0,k = this.notSumit.length;j<k;j++){
            if(elems[i].id === this.notSumit[j]){
                elems.splice(i,1);
                i--;
                len--;
                break;
            }
        }

    }
    //开始验证
    for(i = 0,len = elems.length;i<len;i++){
        var $elem = $(elems[i]);
        if($elem.prop('id') === 'email' && $elem.val().trim().length < 1){
            result = {
                status:0,
                msg:'输入电子邮箱'
            };
            break;
        }
        else if($elem.prop('id') ==='email' && !/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test($elem.val().trim())){
            result = {
                status:0,
                msg:'电子邮箱格式不正确'
            };
            break;
        }
        else if($elem[0].tagName.toLowerCase() === 'select' && $elem.val() === 'default'){
            result = {
                status:0,
                msg:'还没有选择' + $elem.attr('data-info')
            };
            break;
        }
        else if(($elem.prop('type') === 'text' || $elem.prop('type') === 'textarea') && $elem.val().trim().length <= 0 && this.__isMust($elem) ){
            result = {
                status:0,
                msg:'没有输入'+$elem.attr('data-info')
            };
            break;
        }else if($elem.prop('id') ==='yzm' && $elem.val().trim().length < 1){
            result = {
                status:0,
                msg:'没有输入验证码'
            };
            break;
        }else if($elem.prop('id') ==='yzm' && $elem.val().trim() !== $elem.next().attr('data-yzm')){
            result = {
                status:0,
                msg:'验证码不正确'
            };
            break;
        }
        else if($elem.prop('id') === 'surePW' && formElem.find('#password').val().trim() !== $elem.val().trim()){
            result = {
                status:0,
                msg:'两次密码不一致'
            }
        }else if($elem.prop('id') === 'password' && $elem.val().trim().length < 6){
            result = {
                status:0,
                msg:'密码长度小于6'
            };
            break;
        }else if($elem.prop('type') === 'file' && $elem[0].files.length <= 0 && this.__isMust($elem)){
            result = {
                status:0,
                msg:'还没有选择文件'
            };
            break;
        }
        else if($elem.prop('id').indexOf('Time') >= 0 && (check = this.__checkTime($elem)) && check.msg){
            result = {
                status:0,
                msg:check.msg
            };
           break
        }
        else{
            //如果不需要上传文件
            if(!haveFile){
                result.data[$elem.prop('name')] = $elem.val().trim();
            }else{

                if(formData){

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
 * 检查是否是必填项
 * @param elem 正在检查的节点
 * @private
 */
SubmitForm.prototype.__isMust = function (elem) {
    var exclude,i,len,result;
    exclude = this.exclude;
    result = true;
    for(i = 0,len = exclude.length;i<len;i++){
        if(elem.attr('id') === exclude[i]){
            result = false;
            break;
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
        layer.alert(result.msg,function () {
            location.reload();
        });

    }else{

        if(!this.file || this.isSupportFormData()){
            ajax.submitForm(this.url,result.data,this.file,location.href);
        }else{
            this.fromElem.submit();
        }
    }
    return this;
};
/**
 * 检查时间
 * @param $time1 第一个时间
 * @param $time2 第二个时间
 * @private
 */
SubmitForm.prototype.__checkTime = function ($time1,$time2) {
    var match,Y,M,D,result,fromElem,sTime,eTime ,isR,checkD;
    result = {
        status:1,
        msg:0
    };
    match = /^(\d{4})-(\d{1,2})-(\d{1,2})$/.exec($time1.val().trim());
    if(match){
        M = Number(match[2]);
        D = Number(match[3]);
    }

    fromElem = this.fromElem;
    sTime = fromElem.find('#sTime').val().trim();
    eTime  = fromElem.find('#eTime').val().trim();
    //判断是不是瑞年
    isR = function (Y) {
        if(!Y%400 || !Y%4 &&Y%100){
            return true
        }else{
            return false;
        }
    };
    //检查月和日是否匹配
    checkD = function(M,D){
        if( (M === 1 || M === 3|| M === 5 || M === 7 || M === 8 || M === 10 || M === 12)  && D > 31){
            return false;
        }
         else if( (M === 4 || M === 6 || M === 9 || M === 11 ) && D > 30){
            return false;
        }
        else {
            return true;
        }
    };
    if(!match ){
        result = {
            status:0,
            msg:$time1.attr('data-info') +'格式不正确'
        }
    }else {
        if(new Date().getTime() > new Date(match[0]).getTime() && $time1.attr('id') === 'eTime'){
            result = {
                status:0,
                msg:$time1.attr('data-info') +'无效'
            };
        }else if(M ===0 || D === 0 || D > 31 || M ===2 && D > 29 || !isR(Y) && M === 2 && D > 28 || !checkD(M,D)) {
            result = {
                status:0,
                msg:$time1.attr('data-info') +'无效'
            };
        }
        else if(new Date(sTime).getTime() > new Date(eTime).getTime()){
            result = {
                status:0,
                msg:submitForm.find('#eTime').attr('data-info') +'无效'
            };
        }
    }

    return result;
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
};
module.exports = function () {
    return new SubmitForm();
};