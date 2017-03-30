/**
 * Created by star on 2017/3/7.
 */
var $ = require('jquery');
require('./../css/signup.css');
var submitForm =  require('./submitForm.js');
submitForm.start($('#formBox'),'signup',false,[]);