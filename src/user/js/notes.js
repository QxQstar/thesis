/**
 * Created by star on 2017/3/26.
 */
require('./../css/notes.css');
var $ = require('jquery');
var ajax = require('./ajax.js');
var notes = $('#notes');
function deleteNote(list) {
    var deleteBtn,deleteHandle;
    if(!list || list.length <= 0) return;
    deleteBtn = list.find('.delete');
    if(deleteBtn.length <= 0) return;
    deleteHandle = function (event) {
        var $target,data,item;
        $target = $(event.target);
        data = {
            id:$target.attr('data-code')
        };
        ajax.deleteNotes(data,$target.parents('.item'));
    };
    //给deleteBtn绑定click事件
    deleteBtn
        .on('click',deleteHandle);
}
deleteNote(notes);
function formatTime(list) {
    if(!list || list.length <= 0) return;
    list.find('.time').each(function (index, elem) {
        var $elem,time;
        $elem = $(elem);
        time = $elem.text().split(" ")[0];
        $elem.text(time);
    });
}
formatTime(notes);