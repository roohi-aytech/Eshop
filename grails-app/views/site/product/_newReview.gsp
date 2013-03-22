<ckeditor:resources/>
<h3><g:message code="product.review.add"></g:message></h3>

<div>
    <div>
        <g:message code="review.title"></g:message>
    </div>

    <div>
        <input type="text" id="reviewTitle"/>
    </div>

    <div>
        <g:message code="review.rate"></g:message>
    </div>

    <div>
        <g:render template="product/rate"/>
    </div>
    <br/>
    <div>
        <g:message code="review.body"></g:message>
    </div>

    <div>
        <ckeditor:editor name="detail_description" width="100%" height="200px">
        </ckeditor:editor>
    </div>

    <div class="btn-toolbar">
        <a class="btn btn-info"><g:message code="review.submit"></g:message></a>
    </div>
</div>
<hr/>