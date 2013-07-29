
<link rel="stylesheet" href="${resource(dir: 'css/jquery.easyui/metro', file: 'easyui.css')}"/>
<link rel="stylesheet" href="${resource(dir: 'css/jquery.easyui', file: 'easyui-rtl.css')}"/>
<g:javascript src="jquery.easyui/jquery.panel.js"></g:javascript>
<g:javascript src="jquery.easyui/jquery.parser.js"></g:javascript>
<g:javascript src="jquery.easyui/jquery.validatebox.js"></g:javascript>
<g:javascript src="jquery.easyui/jquery.draggable.js"></g:javascript>
<g:javascript src="jquery.easyui/jquery.tree.js"></g:javascript>

<g:javascript>
    function validateFavorites(){
        $('#favoriteStyleValidationMessage').html('');

        var wayOfKnowing = $('#favoriteStyle').val();
        if(!wayOfKnowing || wayOfKnowing == '') {
            $('#favoriteStyleValidationMessage').html('${message(code: 'customer.favoriteStyle.notEmpty')}')
            return false;
        }

        return gatherData();
    }
</g:javascript>
<form id='reagentForm' class='cssform' autocomplete='off' method="POST"
      action="${createLink(controller: 'customer', action: 'saveFavorites')}">

    <p>
        <label for='favoriteStyle'><g:message
                code="customer.favoriteStyle.label"/>:</label> *
        <span id="favoriteStyleValidationMessage"></span>
        <g:select name="favoriteStyle" id="favoriteStyle" from="${customerInstance.constraints.favoriteStyle.inList}"
                  value="${customerInstance?.favoriteStyle}"
                  valueMessagePrefix="customer.favoriteStyle" noSelection="['': '']"/>
    </p>

    <h3 for='favoriteStyle'><g:message
            code="customer.favoriteProductTypes.label"/></h3>
    <ul class="favoriteProductTypes">

    </ul>
    <g:hiddenField name="favoriteProductTypes" id="favoriteProductTypesSelectedNodes"/>
    <br/>


    <p class="toolbar">
        <input type='submit' id="submit" class="btn btn-primary" onclick="return validateFavorites()"
               width="80px"
               value='${message(code: "customer.favorites.save.label")}'/>
        <input type='submit' id="hiddenSubmit" class="hidden"/>
    </p>
</form>

<script language="javascript" type="text/javascript">
    $('.favoriteProductTypes').tree({
        url: '${createLink(plugin:'rapid-grails', controller: 'rapidGrails', action: 'treeStructure', params:[domainClass: 'eshop.ProductType', relationProperty:'parentProduct', titleProperty:'name', selected:customerInstance.favoriteProductTypes?.collect{it.id}?.join(',')])}',
        checkbox: true,
        cascadeCheck: true
    });

    function gatherData(){
        var input = $('#favoriteProductTypesSelectedNodes');
        input.val('');
        var nodes = $('.favoriteProductTypes').tree('getChecked');
        for(var i = 0; i < nodes.length; i++) {
            if(input.val())
                input.val(input.val() + ',');
            input.val(input.val() + nodes[i].id);
        }

        return true;
    }
</script>