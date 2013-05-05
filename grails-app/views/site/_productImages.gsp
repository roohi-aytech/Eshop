<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.zoombie.css')}"/>

%{--<g:javascript plugin="jquery" src="jquery/jquery-1.7.2.js"></g:javascript>--}%
<g:javascript src="jquery.zoombie.js"/>
<script language="javascript">
    $(document).ready(function () {
        $('#zommArea').zoombie({ });

    });

    var oldSelectedThumbnail = ${selectedImage.id};
    function expandThumbnail(id, name){
        $('img#productThumbnail' + oldSelectedThumbnail).removeClass('active');
        $('img#productThumbnail' + id).addClass('active');
        oldSelectedThumbnail = id;

        var imageTag = "<img src='${createLink(controller: 'image', params: [id: product.id, wh: '500x500'])}&name=" + name + "' id='zoomAreaImage' />"
//        $('#zommArea').fadeOut();
//        $('#zommArea').fadeIn();
        $('#zommArea').html('');
        $(imageTag).load(function () {
        }).appendTo($('#zommArea'));
        $('#zommArea').zoombie({  });
    }
</script>

<div class="table product-slideShow">
    <div class="table-row">
        <div class="table-cell image-list">
            <div class="table">
                <div class="table-row">
                    <div class="table-cell">
                        <g:each in="${product.images}" var="image">
                            <img onclick="expandThumbnail(${image.id}, '${image.name}')" id="productThumbnail${image.id}" class="${selectedImage.id == image.id ? 'active' : ''}"
                                 src="${createLink(controller: 'image', params: [id: product.id, name: image.name, wh: '50x50'])}"/>

                        </g:each>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-cell">

            <span id="zommArea" class="zoom">
                <img src="${createLink(controller: 'image', params: [id: product.id, name: selectedImage.name, wh: '500x500'])}"
                     id='zoomAreaImage'/>
            </span>
        </div>
    </div>
</div>