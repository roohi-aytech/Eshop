var browsingProductTypeId = -1
var browsingBrandId = -1

jQuery(document).ready(function() {
    jQuery("#subProductType").change(function() {
        var selected = jQuery(this).find("option:selected").val()
        if (selected > 0)
            recalcSidebar(selected, browsingBrandId)
    });

    jQuery(".sidebarBrand").live("click", function() {
        var clicked = jQuery(this).find("a").attr("brand");
        recalcSidebar(browsingProductTypeId, clicked)
    });

    jQuery(".breadcrumb li").live("click", function() {
        var clicked = jQuery(this).find("a").attr("productType");
        recalcSidebar(clicked, browsingBrandId);
    })
});

var topProductTypeSelect = function(id) {
//    if (id == browsingProductTypeId)
//        return;

    recalcSidebar(id, -1)
}

var buildSidebar = function(resp) {
    browsingProductTypeId = resp.browsingProductTypeId;
    browsingBrandId = resp.browsingBrandId;

    // product type
    jQuery("#subProductType").html("");
    for (var i =0; i < resp.subProductTypes.length; i++) {
        if (i == 0)
            jQuery("#subProductType").append("<option value='-1'></option>");
        jQuery("#subProductType").append("<option value='" + resp.subProductTypes[i].id + "'>" + resp.subProductTypes[i].name + " (" + resp.subProductTypes[i].value +  ")</option>");
    }

    // brand
    jQuery(".sidebarBrand").remove();
    for (i = 0; i < resp.brands.length; i++) {
        var cls = "";
        if (resp.brands[i].id == browsingBrandId)
            cls = " active";
        var brandTag = jQuery('<li class="sidebarBrand' + cls + '"><a brand="' + resp.brands[i].id + '" href="#">' + resp.brands[i].name + ' (' + resp.brands[i].value + ')</a></li>');
        jQuery(".sidebarBrandGroup").after(brandTag);
    }

    var cls = (browsingBrandId == -1) ? " active" : "";
    var allBrandTag = jQuery('<li class="sidebarBrand' + cls + '"><a brand="-1" href="#">All Brands</a></li>');
    jQuery(".sidebarBrandGroup").after(allBrandTag);

    // breadcrumb
    var breadcrumbTag = jQuery(".breadcrumb");
    breadcrumbTag.html("");
    for (i = 0; i < resp.breadCrumb.length; i++) {
        if (i == resp.breadCrumb.length - 1)
            breadcrumbTag.append('<li class="active">' + resp.breadCrumb[i].name + '</li>');
        else
            breadcrumbTag.append('<li><a href="#" productType="' + resp.breadCrumb[i].id + '">' + resp.breadCrumb[i].name + '</a> <span class="divider">/</span></li>');
    }
}

var recalcSidebar = function(productTypeId, brandId) {
    var data = {browsingProductTypeId: productTypeId, browsingBrandId: brandId};
    $.ajax({
        type: "POST",
        url: "sidebar",
        data: data
    }).done(function(resp) {
            buildSidebar(resp);
        });
}