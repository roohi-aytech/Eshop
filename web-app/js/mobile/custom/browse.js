var tagwrap_height, scr_top_more;
var category_name = 'Furniture';

function seeMoreToggler() {
    if($('.tags_wrapper').length > 0){
        tagwrap_height = $('#div-child-slider')[0].scrollHeight-15;
        if(tagwrap_height <= 104){
            $('a.more_options_block').hide();
        }else{
            tagtop = tagwrap_height - 104;
            $('#tag_top_overriden').css('margin-top','-'+tagtop+'px');
        }
    }
}
$(window).resize(function(){
    if($('#div-child-slider').length > 0){
        scr_top_more = $('#div-child-slider.tags_wrapper').offset().top;
    }
    if($('.tags_wrapper').length > 0){
        tagwrap_height = $('#div-child-slider')[0].scrollHeight-15;
        if(tagwrap_height <= 104){
            $('a.more_options_block').hide();
        } else {
            $('a.more_options_block').show();
            tagtop = tagwrap_height - 104;
            if($('.more_options_block').hasClass('more_options_expanded')){
                $('#tag_top_overriden').transition({'marginTop':0},900,'easeInOutQuart');
            }else{
                tagtop = tagwrap_height - 104;
                $('#tag_top_overriden').css('margin-top','-'+tagtop+'px');
            }
        }
    }
    equalHeight($(".items_list_wrapper li a"));
});

$(window).load(function(){
    equalHeight($(".items_list_wrapper li a"));
    seeMoreToggler();
});

var dc_scroll;

$(document).ready(function(){

    lazyLoad('img.lazy');
    // Script for loading more tags
    if($('#div-child-slider').length > 0){
        scr_top_more = $('#div-child-slider.tags_wrapper').offset().top;
    }
    $('.more_options_block').click(function(event){
        dc_scroll = $(document).scrollTop();
        if($(this).hasClass('more_options_expanded')){
            //$('#more_block_text').text('SEE MORE OPTIONS IN ' + category_name);
            if(dc_scroll == scr_top_more){
                $('#tag_top_overriden').transition({'marginTop':'-'+tagtop+'px'},900,'easeInOutQuart',function(){
                    $('.more_options_block').removeClass('more_options_expanded');
                    $('#more_block_text').text('TAP FOR MORE OPTIONS');
                });
            }else{
                $('body,html').animate({scrollTop:scr_top_more}, 600,function(){
                    $('#tag_top_overriden').transition({'marginTop':'-'+tagtop+'px'},900,'easeInOutQuart',function(){
                        $('.more_options_block').removeClass('more_options_expanded');
                        $('#more_block_text').text('موارد بیشتر');
                    });
                });
            }

        }else{
            //$('body,html').animate({scrollTop:scr_top_more}, 900);
            $('.more_options_block').addClass('more_options_expanded');
            $('#tag_top_overriden').transition({'marginTop':0},900,'easeInOutQuart',function(){
                $('.more_options_block').addClass('more_options_expanded');
                $('#more_block_text').text('بستن');
                if(dc_scroll != scr_top_more){
                    $('body,html').animate({scrollTop:scr_top_more}, 600);
                }
            });

        }
        event.preventDefault();
    });
});