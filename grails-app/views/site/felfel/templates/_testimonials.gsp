<div class="community_testi">
    <div class="home_testimonial_left">
        <div class="testimonial_block">
            <div class="testimonialsSlider carousel">
                <ul class="slides" style="cursor: pointer;" onclick="window.open('${createLink(controller: 'testimonial', action: 'write')}');">
                    <g:each in="${eshop.Testimonial.findAllByApproved(true)}" var="testimonial">
                        <li>
                            <p>${testimonial.body}</p>

                            <p class="customer_name">${testimonial.writerInfo ?: testimonial.writer}</p>

                            <p class="purchased">${testimonial.purchasedProduct ? message(code:'testimonial.purchasedProduct.display') + " " + testimonial.purchasedProduct : ''}</p>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>

    <div class="home_testimonial_right">
        <a id="testimonial" class="write_testi_home" href="${createLink(controller: 'testimonial', action: 'write')}"><g:message code="testimonial.write"/></a>
        <a class="pepperfry_live" href="#"><g:message code="videoChannel.link"/></a></div>

    <div class="clearfix" style="height: 1px;">&nbsp;</div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
// <![CDATA[
        $('.testimonialsSlider').flexslider({
            animation: "slide",
            animationLoop: true,
            itemWidth: 250,
            itemMargin: 0,
            minItems: 1,
            maxItems: 1,
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
// ]]>
    }) ;
</script>