<div class="slideshowContainer">
    <center>
        <div id="slideshowSpecialSales">
            <g:each in="${discounts}" var="discount">
                <a href="http://www.princeofpersiagame.com/" target="_blank">
                    <img src="<g:createLink controller="image" params="[id: discount?.id, type: 'discount']"/>"
                         alt="Price of Persia"/>
                </a>
            </g:each>
        </div>

        <div class="baseLine">

        </div>
    </center>
</div>
<g:javascript>
    $('#slideshowSpecialSales').coinslider(
            {
                width: 580,
                height: 300,
                delay: 5000
            });
</g:javascript>