<div class="container-fluid">
    <ul class="thumbnails row-fluid productTypes">
        <g:each in="${productTypeTypeLinks}" var="productTypeTypeLink">
            <li class="span3">
                %{--<g:if test="${type=='filter'}">--}%
                    %{--<g:render template="common/productTypeTypeThumbnail"--}%
                              %{--model="${[link: [id:productTypeTypeLink._id.id, name:productTypeTypeLink._id.name, href:createLink(controller: "site", action: "filter", params: [f : "${params.f},p${productTypeTypeLink._id.id}"])]]}"></g:render>--}%
                %{--</g:if>--}%
                %{--<g:else>--}%
                    <g:render template="common/productTypeTypeThumbnail"
                              model="${[link: productTypeTypeLink]}"></g:render>
                %{--</g:else>--}%
            </li>
        </g:each>
    </ul>
</div>