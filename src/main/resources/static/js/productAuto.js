$(function () {
    $('#keyword').on('keyup', function () {
        var keyword = $(this).val().trim();
        console.log(keyword)
        if (keyword.length > 0) {
            $.ajax({
                type: 'GET',
                url: '/productAuto/search?keyword=' + encodeURIComponent(keyword),
                success: function (data) {
                    console.log("返回数据：", data);
                    var productListHTML = '';

                    if (data.length === 0) {
                        $('#productAutoList').html('<li>暂无搜索结果</li>');
                        $('#productAutoComplete').show();
                        return;
                    }


                    for (var i = 0; i < data.length; i++) {
                        productListHTML += '<li class="productAutoItem" data-productid="';
                        productListHTML += data[i].productId;
                        productListHTML += '">';
                        productListHTML += data[i].categoryId;
                        productListHTML += ': ';
                        productListHTML += data[i].name;
                        productListHTML += '</li>';
                    }

                    console.log("生成 HTML：", productListHTML);

                    $('#productAutoList').html(productListHTML);

                    // 重新定位显示下拉框
                    var inputOffset = $('#keyword').offset();
                    $('#productAutoComplete').css({
                        top: inputOffset.top + $('#keyword').outerHeight(),
                        left: inputOffset.left,
                        position: 'absolute'
                    }).show();
                },
                error: function (errorMsg) {
                    console.log("请求失败：", errorMsg);
                }
            });
        } else {
            $('#productAutoComplete').hide();
        }
    });

    $(document).on('click', '.productAutoItem', function () {
        var productId = $(this).data('productid');
        $('#productAutoComplete').hide();
        $('#keyword').val('');
        window.location.href = '/catalog/viewProduct?productId=' + productId;
    });

    $('#SearchContent').on('mouseleave', function () {
        $('#productAutoComplete').hide();
        $('#keyword').val('');
    });
});
