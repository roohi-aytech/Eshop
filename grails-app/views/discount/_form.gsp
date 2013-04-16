<%@ page import="eshop.discout.Discount" %>

<div class="form-fields">
    <div class="form-fields-part">
        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'type', 'error')} ">
            <label for="type">
                <g:message code="discount.type.label" default="Type"/>

            </label>
            <g:select ng-model="discountInstance.type" name="type" from="${new Discount().constraints.type.inList}" value=""
                      valueMessagePrefix="discount.type" noSelection="['': '']"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'value', 'error')} ">
            <label for="value">
                <g:message code="discount.value.label" default="Value"/>

            </label>
            <g:field type="number" name="value" step="any" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'code', 'error')} ">
            <label for="code">
                <g:message code="discount.code.label" default="Code"/>

            </label>
            <g:textField name="code" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'fromDate', 'error')} ">
            <label for="fromDate">
                <g:message code="discount.fromDate.label" default="From Date"/>

            </label>
            <g:textField name="fromDate" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'toDate', 'error')} ">
            <label for="toDate">
                <g:message code="discount.toDate.label" default="To Date"/>

            </label>
            <g:textField name="toDate" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'usageType', 'error')} ">
            <label for="usageType">
                <g:message code="discount.usageType.label" default="Usage Type"/>

            </label>
            <g:select name="usageType" from="${new Discount().constraints.usageType.inList}" value=""
                      valueMessagePrefix="discount.usageType" noSelection="['': '']"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'image1024', 'error')} required">
            <label for="image1024">
                <g:message code="slide.image1024.label" default="image1024"/>
            </label>
            <input type="file" id="image1024" name="image1024" />
            <img src="<g:createLink controller="slide" action="getImage" params="${[id:discountInstance?.id, size:1024]}"/>" style="max-width: 100px"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'image1280', 'error')} required">
            <label for="image1280">
                <g:message code="slide.image1280.label" default="image1280"/>
            </label>
            <input type="file" id="image1280" name="image1280" />
            <img src="<g:createLink controller="slide" action="getImage" params="${[id:discountInstance?.id, size:1280]}"/>" style="max-width: 100px"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'image1440', 'error')} required">
            <label for="image1440">
                <g:message code="slide.image1440.label" default="image1440"/>
            </label>
            <input type="file" id="image1440" name="image1440" />
            <img src="<g:createLink controller="slide" action="getImage" params="${[id:discountInstance?.id, size:1440]}"/>" style="max-width: 100px"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'basketCountMin', 'error')} ">
            <label for="basketCountMin">
                <g:message code="discount.basketCountMin.label" default="Basket Count Min"/>

            </label>
            <g:field type="number" name="basketCountMin" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'basketPriceMin', 'error')} ">
            <label for="basketPriceMin">
                <g:message code="discount.basketPriceMin.label" default="Basket Price Min"/>

            </label>
            <g:field type="number" name="basketPriceMin" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'basketPriceMax', 'error')} ">
            <label for="basketPriceMax">
                <g:message code="discount.basketPriceMax.label" default="Basket Price Max"/>

            </label>
            <g:field type="number" name="basketPriceMax" value=""/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'basketProductCriteria', 'error')} ">
            <label for="basketProductCriteria">
                <g:message code="discount.basketProductCriteria.label" default="Basket Product Criteria"/>

            </label>
            <g:select name="basketProductCriteria" from="${eshop.discout.ProductCriteria.list()}" multiple="multiple"
                      optionKey="id" size="5" value="" class="many-to-many"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: discountInstance, field: 'discountProductsCriteria', 'error')} ">
            <label for="discountProductsCriteria">
                <g:message code="discount.discountProductsCriteria.label" default="Discount Products Criteria"/>

            </label>
            <g:select name="discountProductsCriteria" from="${eshop.discout.ProductCriteria.list()}" multiple="multiple"
                      optionKey="id" size="5" value="" class="many-to-many"/>
        </div>

    </div>
</div>