<div class="p_bottom0 tags_wrapper" id="div-child-slider">

    <g:each in="${filters.brands}" var="brand">
        <g:set var="f" value="${productType?.id ? "p${productType.id},b${brand?._id?.id}" : "b${brand?._id?.id}"}"/>
        <a class="p_btn" href='${createLink(controller: 'site', action: "filter", params: [f: f, o: 'b'])}' data-ajax='${grailsApplication.config.ajaxFilter}'>${brand._id.name}</a>
    </g:each>
</div>