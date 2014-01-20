<div class="news-table">
    <table class="table-simulated">
        <tr>
            <td>
                <g:render template="/site/news/article" model="${[productTypeId: productTypeId]}"/>
            </td>
            <td>
                <g:render template="/site/news/blog" model="${[productTypeId: productTypeId]}"/>
            </td>
            <td>
                <g:render template="/site/news/news"/>
            </td>
        </tr>
    </table>
</div>