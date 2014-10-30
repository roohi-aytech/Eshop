/**
 * Created by root on 10/19/14.
 */

var deptoffset;
var w_width = $(window).width();
var iterations = 0;
$(document).ready(function(){

    $('.home_slider').height($('.home_slider img:visible').height()).cycle({
        fx: 'uncover',
        timeout: 3000,
        speed: 600,
        pause: 1,
        next: '#nextslide1',
        prev: '#prevslide1',
        pager: '#slider_pager',
        slideResize: 0
    });
    $("a[href='#departments']").click(function(event){
        $('body,html').animate({'scrollTop':deptoffset }, 1000);
        event.preventDefault();
    });

});

$(window).load(function(){
    $('.home_slider').height($('.home_slider img:visible').height());
    deptoffset = $('h1#departments').offset().top;
});
$(window).resize(function(){
    $('.home_slider').height($('.home_slider img:visible').height());
    deptoffset = $('h1#departments').offset().top;
});