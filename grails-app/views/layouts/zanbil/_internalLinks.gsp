<% def internalLinkingService = grailsApplication.classLoader.loadClass('eshop.InternalLinkingService').newInstance() %>
<g:set var="links" value="${internalLinkingService.renderLinks(params)}"/>
<g:if test="${links && links?.size()}">
    <div id="related-links-title" data-status="collapsed">
        <span><g:message code="relatedLinks.title"/></span>
    </div>

    <div id="related-links">
        <g:each in="${links}" var="link" status="i">
            <g:if test="${i > 0}">
                -
            </g:if>
            <a href="${link?.url}">${link?.title}</a>
        </g:each>
    </div>
    <script language="javascript" type="text/javascript">
        $('#related-links').hide();
        $(document).ready(function () {
            $('#related-links-title').click(function () {
                if ($(this).attr('data-status') == 'collapsed') {
                    $(this).attr('data-status', 'expanded');
                    $('#related-links').stop().slideDown();
                }
                else {
                    $(this).attr('data-status', 'collapsed');
                    $('#related-links').stop().slideUp();
                }
            });
        });
    </script>
</g:if>