var browsingProductTypeId = -1

var topProductTypeSelect = function(id) {
    if (id == browsingProductTypeId)
        return;

    var data = {id:id};
    $.ajax({
        type: "POST",
        url: "sidebar",
        data: data
    }).done(function(resp) {
            jQuery("#subProductType").html("");
            for (var i =0; i < resp.subProductTypes.length; i++) {
                if (i == 0)
                    jQuery("#subProductType").append("<option value='-1'></option>");
                jQuery("#subProductType").append("<option value='" + resp.subProductTypes[i].name + "'>" + resp.subProductTypes[i].name + "</option>");
            }
    });
}