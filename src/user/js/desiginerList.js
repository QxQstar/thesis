/**
 * Created by star on 2017/3/27.
 */
require('./../css/desiginerList.css');
var $ = require('jquery');
var search = require('./search.js');
//搜索设计师
search.getUser($('#searchBox'),$('#userList'));