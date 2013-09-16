
<link href="${resource(dir: 'css/jquery.easyui/metro', file: 'easyui.css')}" rel="stylesheet" type="text/css"/>
<link href="${resource(dir: 'css/jquery.easyui', file: 'easyui-rtl.css')}" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.panel.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.parser.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.validatebox.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.draggable.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.tree.js')}"></script>

<script language="javascript" type="text/javascript">
    function validateFavorites(){
        $('#favoriteStyleValidationMessage').html('');

        var wayOfKnowing = $('#favoriteStyle').val();
        if(!wayOfKnowing || wayOfKnowing == '') {
            $('#favoriteStyleValidationMessage').html('${message(code: 'customer.favoriteStyle.notEmpty')}')
            return false;
        }

        return gatherData();
    }
</script>
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