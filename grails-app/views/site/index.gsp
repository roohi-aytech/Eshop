<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <title>Zanbil</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'coin-slider.css')}"/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <g:javascript src="coin-slider.js"></g:javascript>
</head>

<body>
<div class="layout-container table">
    <div class="table-row">
        <div class="span180 table-cell">
            <div class="well sidebar-nav home">
                <g:render template="common/browsingTextualMenu"></g:render>
            </div>
        </div>

        <div class="table-cell">
            <div class="table">
                <div class="table-row">

                    <g:render template="common/slideshowMain"></g:render>
                </div>

                <div class="table-row">
                    <div class="table-cell">
                        <div class="table">
                            <div class="table-row">

                                <div class="span600 table-cell">

                                    <g:render template="common/slideshowSpecialSales"
                                              model="[discounts: discounts]"></g:render>

                                    <g:render template="common/browsingGraphicalMenu"></g:render>
                                </div>

                                <div class="span200 table-cell">
                                    <g:render template="banners/enamad"></g:render>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>