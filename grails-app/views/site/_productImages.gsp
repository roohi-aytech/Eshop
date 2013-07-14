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

        var originalImageTag = "<img class='original' src='${createLink(controller: 'image', params: [id: product.id])}?wh=" + imageSize + "&name=" + name + "' />";
        $(originalImageTag).load(function () {
        }).appendTo($('#zoomArea'));

        $('#zoomArea img').css('margin-top', Math.round((zoomAreaHeight - imageHeight) / 2) + "px");
        $('#zoomArea img').css('margin-right', Math.round((zoomAreaWidth - imageWidth) / 2) + "px");

        var zoomedTag = "<div class='zoomed'/>";
        $(zoomedTag).appendTo($('#zoomArea'));
        $('.zoomed').css('width', zoomAreaWidth + "px");
        $('.zoomed').css('height', zoomAreaHeight + "px");
        $('.zoomed').css('background-image', "url('${createLink(controller: 'image', params: [id: product.id])}?wh=max&name=" + name + "')");


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
                            <img onclick="resetZoomArea();expandThumbnail(${image.id}, '${image.name}', ${image.dynamicProperties.width}, ${image.dynamicProperties.height})"
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

    $('#zoomArea').hover(function () {
        if (!zoomEnabled)
            return;
        currentImageX = Math.round((zoomAreaWidth - largeImageWidth) / 2);
        currentImageY = Math.round((zoomAreaHeight - largeImageHeight) / 2);
        $('#zoomArea .zoomed').css('background-position', currentImageX + "px " + currentImageY + "px ");
        $('#zoomArea .zoomed').css('display', 'block');
        $('#zoomArea .original').css('display', 'none');
    }, function () {
        if (!zoomEnabled)
            return;
        $('#zoomArea .original').css('display', 'block');
        $('#zoomArea .zoomed').css('display', 'none');
    });

    $('#zoomArea').mousemove(function (e) {
        var x = e.pageX - $('#zoomArea').offset().left;
        var y = e.pageY - $('#zoomArea').offset().top;

        var centerX = Math.round(zoomAreaWidth / 2);
        var centerY = Math.round(zoomAreaHeight / 2);

        var centerDistanceX = x - centerX;
        var centerDistanceY = y - centerY;

        var imageX = Math.round((zoomAreaWidth - largeImageWidth) / 2 - (centerDistanceX * largeImageWidth) / zoomAreaWidth);
        if (imageX <= 0 && imageX + largeImageWidth >= zoomAreaWidth)
            currentImageX = imageX;
        var imageY = Math.round((zoomAreaHeight - largeImageHeight) / 2 - (centerDistanceY * largeImageHeight) / zoomAreaHeight);
        if (imageY <= 0 && imageY + largeImageHeight >= zoomAreaHeight)
            currentImageY = imageY;

        $('#zoomArea .zoomed').css('background-position', currentImageX + "px " + currentImageY + "px ");
    });
</script>