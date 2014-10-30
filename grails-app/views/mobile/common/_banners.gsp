<g:each in="${eshop.Banner.findAllByPositionAndDeleted('mobile', false).sort { it.sortIndex }}">

    <p></p>

    <div class="home_promotions_banner">
        <a href="${it.url ?: '#'}">
            <img src="${createLink(controller: 'image', params: [type: 'banner', id: it.id])}" alt="" width="597"/>
        </a>
    </div>
</g:each>