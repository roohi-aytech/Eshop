<%@ page import="grails.converters.JSON" %>

<div class="fieldcontain">
    <label><g:message code="product.type"/></label>
    <select name="productTypeTypes" id="productTypeTypes" multiple class="selectpicker show-tick" title=""
            data-width="500px" data-live-search="true">
        <g:each in="${productTypeTypes}" var="ptt">
            <option value="${ptt.id}" ${selectedProductTypeTypes?.contains(ptt.id) ? 'selected' : ''}>${ptt.text}</option>
        </g:each>
    </select>
</div>

<div class="fieldcontain">
    <label><g:message code="brand"/></label>
    <select name="brands" id="brands" multiple class="selectpicker show-tick" title="" data-width="500px"
            data-live-search="true">
        <g:each in="${brands}" var="b">
            <option value="${b.id}" ${selectedBrands?.contains(b.id) ? 'selected' : ''}>${b.text}</option>
        </g:each>
    </select>
</div>

<div class="fieldcontain">
    <label><g:message code="guarantee"/></label>
    <select name="guarantees" id="guarantees" multiple class="selectpicker show-tick" title="" data-width="500px"
            data-live-search="true">
        <g:each in="${guarantees}" var="g">
            <option value="${g.id}" ${selectedGuarantees?.contains(g.id) ? 'selected' : ''}>${g.text}</option>
        </g:each>
    </select>
</div>

<div class="fieldcontain">
    <label><g:message code="productModel.status"/></label>
    <select name="statuses" id="statuses" multiple class="selectpicker show-tick" title="" data-width="500px">
        <option value="exists"><g:message code="productModel.status.exists"/></option>
        <option value="not-exists"><g:message code="productModel.status.not-exists"/></option>
        <option value="coming-soon"><g:message code="productModel.status.coming-soon"/></option>
        <option value="inquiry-required"><g:message code="productModel.status.inquiry-required"/></option>
    </select>
</div>

<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        <g:if test="${actionName != 'bulkUpdateForm'}">
        $('#productTypes').combotree({
            url: '${createLink(action: 'bulkUpdateProductTypesTree', id: productTypesKey)}',
            onChange: function () {
                reloadCriteriaForm();
            }
        });

        $('.combo').addClass('btn').addClass('dropdown-toggle').addClass('btn-default');
        </g:if>
        $('.selectpicker').selectpicker().change(function () {
            reloadCriteriaForm();
        });

        $.each($('.bootstrap-select'), function () {
            $(this).parent()
                    .append('<a class="btn_selectAll" href="javascript://">${message(code:'selectAll')}</a>')
                    .append('<a class="btn_clearAll" href="javascript://">${message(code:'clearAll')}</a>');
        });

        $('.btn_selectAll').click(function () {
            $($(this).parent().find('select.selectpicker')).selectpicker('selectAll');
        });

        $('.btn_clearAll').click(function () {
            $($(this).parent().find('select.selectpicker')).selectpicker('deselectAll');
        });
    });
</script>