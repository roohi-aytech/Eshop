<div class="news-table">
    <g:render template="/site/news/article" model="${[productTypeId: productTypeId]}"/>
    <g:render template="/site/news/blog" model="${[productTypeId: productTypeId]}"/>
    <g:render template="/site/news/news"/>
</div>

<script language="javascript" type="text/javascript">
    function resizeNewsTable(){
        var totalWidth = $('.news-table').width();
        var count = $('.news').length;
        $('.news').width((totalWidth - ((count - 1) * 50)) / count - 1);
    }

    $(window).resize(function () {
        resizeNewsTable();
    });

    resizeNewsTable();
</script>