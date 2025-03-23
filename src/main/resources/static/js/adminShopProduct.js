$(document).ready(function () {
    // 添加商品表单提交
    $("#addProductForm").submit(function (event) {
        event.preventDefault(); // 阻止默认表单提交

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/adminShop/addProduct",
            data: formData,
            processData: false, // 不处理数据
            contentType: false, // 不设置内容类型
            dataType: "json", // 确保解析 JSON
            success: function (response) {
                console.log("服务器返回数据:", response); // 调试数据

                if (response.status === "success") {
                    alert("商品添加成功！");

                    // 确保 `productTable` 存在
                    let productTable = $("#productTable");
                    if (productTable.length === 0) {
                        productTable = $('<table id="productTable" border="1"><thead><tr><th>商品编号</th><th>商品名称</th><th>商品价格</th><th>操作</th></tr></thead><tbody></tbody></table>');
                        $("#mainContent").append(productTable);
                    }

                    // 创建新的表格行
                    let newRow = `
                <tr id="productRow-${response.productId}">
                    <td>${response.productId}</td>
                    <td>${response.productName}</td>
                    <td><img src="${response.imageUrl}" alt="分类图片" width="100" height="100"></td>
                    <td>
                        <div class="action-container">
                            <button class="btn-edit" 
                            data-product-id="${response.productId}" 
                            data-product-name="${response.productName}" 
                            data-product-description="${response.description}">
                                修改
                            </button>
                            
                            <a href="/adminShop/product?productId=${response.productId}">查看详情</a>
                            
                            <button class="btn-delete" 
                                data-category-id="${response.categoryId}"
                                data-product-id="${response.productId}">
                                删除
                            </button>
                        </div>
                    </td>
                </tr>`;

                    // 插入到 <tbody> 中
                    productTable.find("tbody").append(newRow);

                    // 清空表单
                    $("#addProductForm")[0].reset();
                } else {
                    alert("添加失败：" + response.message);
                }
            },
            error: function (xhr) {
                console.error("请求失败:", xhr.responseText);
                alert("请求失败，请检查服务器：" + xhr.responseText);
            }
        });
    });

// 编辑商品
    $(document).on("click", ".btn-edit", function () {
        let categoryId = $(this).data("category-id");
        let productId = $(this).data("product-id");
        let productName = $(this).data("product-name");
        let imageUrl = $(this).data("product-description");

        showEditForm(categoryId, productId, productName, imageUrl);
    });

// 提交更新商品表单
    $(document).on("submit", "#updateProductForm", function (event) {
        event.preventDefault(); // 阻止默认表单提交

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/adminShop/updateProduct",
            data: formData,
            processData: false, // 不处理数据
            contentType: false, // 不设置内容类型
            dataType: "json", // 确保解析 JSON
            success: function (response) {
                console.log("服务器返回数据:", response); // 调试数据

                if (response.status === "success") {
                    alert("商品更新成功！");

                    // 更新表格中的商品行
                    let updatedRow = $(`#productRow-${response.productId}`);
                    updatedRow.find("td:eq(1)").text(response.productName);
                    updatedRow.find("td:eq(2) img").attr("src", response.imageUrl);

                    // 更新修改按钮的 data-* 属性
                    updatedRow.find(".btn-edit")
                        .attr("data-product-id", response.productId)
                        .attr("data-product-name", response.productName)
                        .attr("data-product-description", response.imageUrl);

                    // 清空表单
                    $("#updateProductForm")[0].reset();

                    // 移除编辑表单行
                    document.getElementById('editRow').remove();
                } else {
                    alert("更新失败：" + response.message);
                }
            },
            error: function (xhr) {
                console.error("请求失败:", xhr.responseText);
                alert("请求失败，请检查服务器：" + xhr.responseText);
            }
        });
    });

// 删除商品
    $(document).on("click", ".btn-delete", function () {
        var categoryId = $(this).data("category-id")
        var productId = $(this).data("product-id");

        // 确认删除操作
        if (confirm("确定删除该商品？")) {
            $.ajax({
                type: "POST",
                url: "/adminShop/deleteProduct",
                data: {categoryId: categoryId, productId: productId},
                dataType: "json", // 返回的数据格式
                success: function (response) {
                    if (response.status === "success") {
                        // 删除相应的行
                        $("#productRow-" + productId).remove();
                    } else {
                        alert("删除失败：" + response.message);
                    }
                },
                error: function (xhr) {
                    console.error("请求失败:", xhr.responseText);
                    alert("请求失败，请检查服务器：" + xhr.responseText);
                }
            });
        }
    });

// 显示编辑表单
    function showEditForm(categoryId, productId, productName, imageUrl) {
        let existingRow = document.getElementById('editRow');
        if (existingRow) {
            existingRow.remove();
        }

        // 获取当前商品行
        let currentRow = document.getElementById('productRow-' + productId);
        if (!currentRow) return;

        // 创建新的修改表单行
        let newRow = document.createElement('tr');
        newRow.id = 'editRow';
        newRow.innerHTML = `
            <td colspan="4">
            <form id="updateProductForm" action="/adminShop/updateProduct" method="post" enctype="multipart/form-data">
               <input type="hidden" name="categoryId" value="${categoryId}">
                <input type="hidden" name="productId" value="${productId}">
                <input type="hidden" name="originalDescription" value="${imageUrl}">

                <label>产品名称：</label>
                <input type="text" name="productName" value="${productName}" required>

                <!-- 上传新图片（如果不上传，则保持原图片路径） -->
                <label>上传新产品图片（可选）：</label>
                <input type="file" name="description" accept="image/*">

                <button type="submit">保存</button>
                <button type="button" onclick="document.getElementById('editRow').remove()">取消</button>
            </form>
        </td>
        `;

        // 插入修改表单行到当前商品行的下方
        currentRow.parentNode.insertBefore(newRow, currentRow.nextSibling);
    }
});