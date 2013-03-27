<ckeditor:resources/>
<g:javascript>
    function submitReview() {
        if ($('#reviewTitle').val().trim() == '')
            window.alert('reviewTitle');
        if ($('#reviewRate').val().trim() == '')
            window.alert('reviewRate');
    }
</g:javascript>
<h3><g:message code="product.review.add"></g:message></h3>
<g:form controller="customerReview" action="save">
    <div>
        <div class="field-name">
            <g:message code="review.title"></g:message>
        </div>

        <div class="field-value">
            <input type="text" id="reviewTitle"/>
        </div>

        <div>
            <g:message code="review.rate"></g:message>
        </div>

        <div>
            <eshop:rate identifier="reviewRate" readOnly="false"/>
        </div>
        <br/>

        <div>
            <g:message code="review.body"></g:message>
        </div>

        <div>
            <ckeditor:editor name="reviewBody" width="650px" height="200px">
            </ckeditor:editor>
        </div>

        <div class="btn-toolbar">
            <a class="btn btn-info" onclick="submitReview()"><g:message code="review.submit"></g:message></a>
        </div>
    </div>
</g:form>
<hr/>