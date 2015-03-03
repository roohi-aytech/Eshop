<%@ page import="eshop.accounting.Account" %>
<div style="border:1px solid #cccccc;padding: 4px;border-radius: 4px;background: #ffffff">
    <div style="display: block;background: #f4f4f4;border:1px solid #dddddd;border-radius: 4px;padding:5px;"><g:message
            code="actionHistory.title"/></div>

    <form id="actionHistoryForm" style="margin-right: 10px;margin-bottom: 5px;">
        <g:hiddenField name="order.id" value="${order.id}"/>

        <div>
            <label for="description" style="margin:5px;">
                <g:message code="description"/>
            </label>
        </div>

        <div>
            <textarea name="description" id="description" cols="100" rows="5"
                      style="margin:0;display: block;"></textarea>
        </div>

        <div>
            <input type="button" onclick="actOnOrder();"
                   value='${message(code: "actionHistory.btn")}'/>
        </div>
    </form>
</div>
<br/>