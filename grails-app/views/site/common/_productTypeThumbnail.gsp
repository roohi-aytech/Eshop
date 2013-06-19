<div class="thumbnail">
    <a class="thumbnail-link title" href="${link.href}">
        %{--<div class="content">--}%
            %{--<div class="main">--}%
                <span class="image">
                    <span>
                        <span>
                            <img alt="${link.name}" src="${createLink(controller: 'image', params: [type:'productType', id:link.id, wh:'100x100'])}"/>
                        </span>
                    </span>
                </span>
                <h4>
                    ${link.name}
                </h4>
            %{--</div>--}%
        %{--</div>--}%
    </a>
</div>