<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 4/27/14
  Time: 2:38 PM
--%>

<%@ page import="grails.converters.JSON" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="price.bulkUpdate"/></title>
</head>

<body>
<h2><g:message code="price.bulkUpdate"/></h2>

<h3 style="clear: both;padding-top:20px;"><g:message code="price.bulkUpdate.excel"/></h3>
<g:form action="exportPriceList">
    <div class="fieldcontain">
        <label><g:message code="productType"/></label>
        <select name="productTypes" id="productTypes" multiple class="easyui-combotree" style="width:500px;"></select>
    </div>

    <div class="fieldcontain">
        <label><g:message code="product.type"/></label>
        <select name="productTypeTypes" id="productTypeTypes" multiple class="easyui-combobox" style="width:500px;">
            <g:each in="${productTypeTypes}" var="ptt">
                <option value="${ptt.id}">${ptt.text}</option>
            </g:each>
        </select>
    </div>

    <div class="fieldcontain">
        <label><g:message code="brand"/></label>
        <select name="brands" id="brands" multiple class="easyui-combobox" style="width:500px;">
            <g:each in="${brands}" var="b">
                <option value="${b.id}">${b.text}</option>
            </g:each>
        </select>
    </div>

    <div class="fieldcontain">
        <label><g:message code="guarantee"/></label>
        <select name="guarantees" id="guarantees" multiple class="easyui-combobox" style="width:500px;">
            <g:each in="${guarantees}" var="g">
                <option value="${g.id}">${g.text}</option>
            </g:each>
        </select>
    </div>

    <div class="fieldcontain">
        <label><g:message code="productModel.status"/></label>
        <select name="statuses" id="statuses" multiple class="easyui-combobox" style="width:500px;">
            <option value="exists"><g:message code="productModel.status.exists"/></option>
            <option value="not-exists"><g:message code="productModel.status.not-exists"/></option>
            <option value="coming-soon"><g:message code="productModel.status.coming-soon"/></option>
            <option value="inquiry-required"><g:message code="productModel.status.inquiry-required"/></option>
        </select>
    </div>
    <br/>
    <input type="submit" value="<g:message code="price.bulkUpdate.excel"/>"/>
</g:form>
<h3 style="clear: both;padding-top:20px;"><g:message code="price.bulkUpdate.excel.import"/></h3>
<g:uploadForm action="importPriceList">
    <div class="fieldcontain">
        <input type="file" name="file"/>
    </div>
    <br/>
    <input type="submit" value="<g:message code="price.bulkUpdate.excel.import"/>"/>
</g:uploadForm>
<g:render template="bulkUpdateResults"/>
<script language="javascript" type="text/javascript">
    $('#productTypes').combotree().combotree('loadData', ${productTypes as JSON});
</script>
</body>
</html>