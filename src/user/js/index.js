/**
 * Created by star on 2017/3/5.
 */
require('./../css/index.css');
require('./../css/owl.carousel.min.css');
require('./../css/owl.theme.default.min.css');
require('./list.js');
var $ = window.jQuery = require('jquery');
var owlCarousel = require('./owl.carousel.min.js');
$('#carousel').owlCarousel({
    items:1,
    loop:true,
    center:true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true
});



