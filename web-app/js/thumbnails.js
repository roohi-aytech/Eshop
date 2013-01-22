var timeout;

$(document).ready(function () {
    $(".thumbnail").live({
            mouseenter: function () {
                if (timeout) window.clearTimeout(timeout);
                var that = $(this).find("div").first();
                that.addClass("hasFocus");
                timout = setTimeout(function () {
                    if (that.hasClass("hasFocus")) {
                        that.animate({
                            "margin-top": "-278px"
                        });
                    }
                }, 500);
            },
            mouseleave: function () {
                if (timeout) window.clearTimeout(timeout);
                $(this).find("div").first().removeClass("hasFocus");
                var d = $(this).find("div").first();
                d.animate({
                    "margin-top": "0"
                });
            }
        }
    );
})