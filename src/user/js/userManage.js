/**
 * Created by star on 2017/3/24.
 */
//用户管理
require('./../css/adminUserList.css');
var $ = require('jquery');
var ajax = require('./ajax.js');
var search = require('./search.js');
var userList = $('#userList');


//搜索用户
search.getUser($('#searchBox'),userList);
/**
 * 删除用户
 * @param userList 用户列表
 */
function deleteUser(userList) {
    var deleteBtn,role;
    if(!userList || userList.length <= 0)return ;
    deleteBtn = userList.find('.delete');
    if(deleteBtn.length <= 0) return;
    //判断是删除管理员还是设计师
    if($('#admin').length >0){
        role = 'admin';
    }else{
        role = 'desi';
    }
    deleteBtn
        .on('click',function (event) {
            var $target,data;
            $target= $(event.target);
            data={
                role:role,
                code:$target.attr('data-code')
            };
            if(role == 'desi'){
                if(confirm('设计师删除后，它的作品也一并删除。是否确定删除？')){
                    ajax.deleteUser(data);
                }
            }else{
                ajax.deleteUser(data);
            }


        })

}
deleteUser(userList);
/**
 * 回调函数
 */
function callback() {
    deleteUser(userList);
}
//搜索用户
search.getUser($('#searchBox'),userList,callback);

