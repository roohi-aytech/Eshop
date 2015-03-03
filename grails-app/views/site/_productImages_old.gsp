<link href="${resource(dir: 'css', file: 'jquery.zoombie.css')}" rel="stylesheet" type="text/css"/>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.zoombie.js')}" type="text/javascript"></script>
<script language="javascript">
    $(document).ready(function () {
        $('#zommArea').zoombie({ })
        resizeZoomArea();

    });

    $(window).resize(function (){
        resizeZoomArea();
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

    function resizeZoomArea(){
        $('#zommArea').height($('#zommArea').parent().parent().parent().parent().parent().parent().height() - 80);
    }
</script>

<table class="table-simulated product-slideShow">
    <tr class="table-row">
        <td class="table-cell image-list">
            <table class="table-simulated">
                <tr class="table-row">
                    <td class="table-cell">
                        <g:each in="${product.images}" var="image">
                            <img onclick="expandThumbnail(${image.id}, '${image.name}')" id="productThumbnail${image.id}" class="${selectedImage.id == image.id ? 'active' : ''}"
                                 src="${createLink(controller: 'image', params: [id: product.id, name: image.name, wh: '50x50'])}"/>

                        </g:each>
                    </td>
                </tr>
            </table>
        </td>

        <td class="table-cell">

            <span id="zommArea" class="zoom">
                <img src="${createLink(controller: 'image', params: [id: product.id, name: selectedImage.name, wh: '500x500'])}"
                     id='zoomAreaImage'/>
            </span>
        </td>
    </tr>
</table>