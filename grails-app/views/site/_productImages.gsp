<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.zoombie.css')}"/>

%{--<g:javascript plugin="jquery" src="jquery/jquery-1.7.2.js"></g:javascript>--}%
%{--<g:javascript src="jquery.zoombie.js"/>--}%
<script language="javascript">

    var currentSelectedThumbnailId;
    var currentSelectedThumbnailName;
    var zoomAreaHeight;
    var zoomAreaWidth;
    var largeImageWidth;
    var largeImageHeight;
    var imageWidth;
    var imageHeight;
    var imageSize;
    var imageName;
    var zoomEnabled;

    var currentImageX;
    var currentImageY;

    $(window).resize(function () {
        resetZoomArea();
    });

    function expandThumbnail(id, name, width, height) {
        //toggle selected status
        $('img#productThumbnail' + currentSelectedThumbnailId).removeClass('active');
        $('img#productThumbnail' + id).addClass('active');
        currentSelectedThumbnailId = id;
        currentSelectedThumbnailName = name;

        largeImageWidth = width;
        largeImageHeight = height;

        //find image size
        zoomEnabled = true;
        if (zoomAreaWidth >= width && zoomAreaHeight >= height) {
            zoomEnabled = false;
            imageWidth = width;
            imageHeight = height;
            imageSize = 'max';
        }
        else if (zoomAreaWidth >= 500 && zoomAreaHeight >= 500) {
            imageWidth = 500;
            imageHeight = 500;
            imageSize = '500x500';
        }
        else if (zoomAreaWidth >= 400 && zoomAreaHeight >= 400) {
            imageWidth = 400;
            imageHeight = 400;
            imageSize = '400x400';
        }
        else if (zoomAreaWidth >= 300 && zoomAreaHeight >= 300) {
            imageWidth = 300;
            imageHeight = 300;
            imageSize = '300x300';
        }
        else if (zoomAreaWidth >= 200 && zoomAreaHeight >= 200) {
            imageWidth = 200;
            imageHeight = 200;
            imageSize = '200x200';
        }
        else if (zoomAreaWidth >= 100 && zoomAreaHeight >= 100) {
            imageWidth = 100;
            imageHeight = 100;
            imageSize = '100x100';
        }
        else if (zoomAreaWidth >= 50 && zoomAreaHeight >= 50) {
            imageWidth = 50;
            imageHeight = 50;
            imageSize = '50x50';
        }

        //show image
        $('#zoomArea').html('');

        var imageTag = "<img src='${createLink(controller: 'image', params: [id: product.id])}?wh=" + imageSize + "&name=" + name + "' />";
        $(imageTag).load(function () {
        }).appendTo($('#zoomArea'));

        $('#zoomArea img').css('margin-top', Math.round((zoomAreaHeight - imageHeight) / 2) + "px");
        $('#zoomArea img').css('margin-right', Math.round((zoomAreaWidth - imageWidth) / 2) + "px");

        var divTag = "<div/>";
        $(divTag).appendTo($('#zoomArea'));
        $('#zoomArea div').css('width', zoomAreaWidth + "px");
        $('#zoomArea div').css('height', zoomAreaHeight + "px");
        $('#zoomArea div').css('background-image', "url('${createLink(controller: 'image', params: [id: product.id])}?wh=max&name=" + name + "')");


    }

    function resetZoomArea() {
        $('.modal-body').css('height', ($('.modal-body').parent().parent().parent().height() + 10) + "px");
        $('#product-slideShow').css('height', ($('#product-slideShow').parent().height() - 18) + "px");
        $('#product-slideShow').css('width', ($('#product-slideShow').parent().width() - 1) + "px");
        zoomAreaHeight = $('#zoomAreaCell').height();
        zoomAreaWidth = $('#zoomAreaCell').width();
        $('#zoomArea').css('height', zoomAreaHeight + 'px');
        $('#zoomArea').css('width', zoomAreaWidth + 'px');
        expandThumbnail(currentSelectedThumbnailId, currentSelectedThumbnailName, ${selectedImage.dynamicProperties.width}, ${selectedImage.dynamicProperties.height});
    }
</script>

<table class="table-simulated product-slideShow" id="product-slideShow" cellpadding="5" cellspacing="5"
       style="height: 100%">
    <tr class="table-row">
        <td class="table-cell image-list">
            <table class="table-simulated" style="height: 100%">
                <tr class="table-row">
                    <td class="table-cell">
                        <h3>${product}</h3>
                        <g:each in="${product.images}" var="image">
                            <img onclick="resetZoomArea();
                            expandThumbnail(${image.id}, '${image.name}', ${image.dynamicProperties.width}, ${image.dynamicProperties.height})"
                                 id="productThumbnail${image.id}"
                                 class="${selectedImage.id == image.id ? 'active' : ''}"
                                 src="${createLink(controller: 'image', params: [id: product.id, name: image.name, wh: '50x50'])}"/>

                        </g:each>
                    </td>
                </tr>
            </table>
        </td>

        <td class="table-cell" id="zoomAreaCell">
            <div id="zoomArea">
            </div>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">

    currentSelectedThumbnailId = ${selectedImage.id};
    currentSelectedThumbnailName = '${selectedImage.name}';
    resetZoomArea();

    var zoomed = false;

    $('#zoomArea').click(function (e) {
        if (!zoomEnabled)
            return;
        zoomed = !zoomed;
        if (zoomed) {
            setCurrentImagePositions(e);
            $('#zoomArea div').css('background-position', currentImageX + "px " + currentImageY + "px ");

            $('#zoomArea').addClass('zoomed');
        }
        else {
            $('#zoomArea').removeClass('zoomed');
        }
    });

    $('#zoomArea').mousemove(function (e) {

        if (!zoomed)
            return;

        setCurrentImagePositions(e);

        $('#zoomArea div').css('background-position', currentImageX + "px " + currentImageY + "px ");
    });

    function setCurrentImagePositions(e) {
        var x = e.pageX;// - $('#zoomArea').offset().left;
        var y = e.pageY;// - $('#zoomArea').offset().top;

        var centerX = Math.round($('#zoomArea').offset().left + zoomAreaWidth / 2);
        var centerY = Math.round($('#zoomArea').offset().top + zoomAreaHeight / 2);

        var centerDistanceX = x - centerX;
        var centerDistanceY = y - centerY;

        var imageX = Math.round((zoomAreaWidth - largeImageWidth) / 2 - (centerDistanceX * largeImageWidth) / zoomAreaWidth);
        if (largeImageWidth > zoomAreaWidth) {
            if (imageX <= 0 && imageX + largeImageWidth >= zoomAreaWidth)
                currentImageX = imageX;
            else if (imageX > 0)
                currentImageX = 0;
            else
                currentImageX = zoomAreaWidth - largeImageWidth;
        }
        else{
            currentImageX = (zoomAreaWidth - largeImageWidth) / 2
        }

        var imageY = Math.round((zoomAreaHeight - largeImageHeight) / 2 - (centerDistanceY * largeImageHeight) / zoomAreaHeight);

        if (largeImageHeight > zoomAreaHeight) {
            if (imageY <= 0 && imageY + largeImageHeight >= zoomAreaHeight)
                currentImageY = imageY;
            else if (imageY > 0)
                currentImageY = 0;
            else
                currentImageY = zoomAreaHeight - largeImageHeight;
        }
        else{
            currentImageY = (zoomAreaHeight - largeImageHeight) / 2
        }
    }
</script>