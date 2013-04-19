<div class="thumbnail">
    <a class="thumbnail-link" href="${link.href}"
       class="title">
        <div class="content">
            <div class="main">
                <span class="image">
                    <span>
                        <span>
                            <img src="${createLink(controller: image, params: [type:'productType', id:link.id])}"/>
                        </span>
                    </span>
                </span>
                <h4>
                    ${link.name}
                </h4>
            </div>
        </div>
    </a>
</div>