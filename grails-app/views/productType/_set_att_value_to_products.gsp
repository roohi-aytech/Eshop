<%@ page import="eshop.ProductType" %>

<g:hiddenField name="id" value="${attributeType?.id}" />

<div class="fieldcontain ">
    <g:checkBox name="setNewValue" value="${setNewValue}"/>
    <script type="text/javascript">
        $(function(){
            $("#setNewValue").change(function(){
                if($(this).attr("checked"))
                    $("#newValue").removeAttr("disabled")
                else
                    $("#newValue").attr("disabled","disabled")
            })
            if($("#setNewValue").attr("checked"))
                $("#newValue").removeAttr("disabled")
            else
                $("#newValue").attr("disabled","disabled")
        })
    </script>

        <g:message code="attribute_added_message"  />


</div>
<div class="fieldcontain">

    <g:checkBox name="nA" value="${nA}"/> N/A
    <g:textField name="newValue" value="${newValue}"/>

</div>


</div>

