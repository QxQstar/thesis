/**
 * Created by star on 2017/3/27.
 */
require('./../css/production.css');
var $ = require('jquery');
var search = require('./search.js');
var scrollLoading = require('./scrollLoading.js');


var list = $('#list');
search.getZP($('#searchBox'),list);
//滚动加载
scrollLoading.start(list,'productionmessage',2);