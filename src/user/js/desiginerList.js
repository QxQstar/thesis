/**
 * Created by star on 2017/3/27.
 */
require('./../css/desiginerList.css');
var $ = require('jquery');
var search = require('./search.js');
var scrollLoading = require('./scrollLoading.js');
var userList = $('#userList');
//搜索设计师
search.getUser($('#searchBox'),userList);
//滚动加载
scrollLoading.start(userList,'designermessage',2);
