$(document).ready(function () {
// 添加商品项表单提交
    $("#addItemForm").submit(function (event) {
        event.preventDefault(); // 阻止默认表单提交

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/adminShop/addItem",
            data: formData,
            processData: false, // 不处理数据
            contentType: false, // 不设置内容类型
            dataType: "json", // 确保解析 JSON
            success: function (response) {
                console.log("服务器返回数据:", response); // 调试数据

                if (response.status === "success") {
                    alert("商品项添加成功！");

                    // 确保 `itemTable` 存在
                    let itemTable = $("#itemTable");
                    if (itemTable.length === 0) {
                        itemTable = $('<table id="itemTable" border="1"><thead><tr><th>商品项编号</th><th>商品项名称</th><th>商品项价格</th><th>操作</th></tr></thead><tbody></tbody></table>');
                        $("#mainContent").append(itemTable);
                    }

                    // 创建新的表格行
                    let newRow = `
                <tr id="itemRow-${response.itemId}">
                    <td>${response.itemId}</td>
                    <td>${response.itemName}</td>
                    <td>${response.itemPrice}</td>
                    <td>
                        <div class="action-container">
                            <button class="btn-edit" 
                            data-item-id="${response.itemId}" 
                            data-item-name="${response.itemName}" 
                            data-item-price="${response.itemPrice}">
                                修改
                            </button>
                            
                            <button class="btn-delete" data-item-id="${response.itemId}">
                                删除
                            </button>
                        </div>
                    </td>
                </tr>`;

                    // 插入到 <tbody> 中
                    itemTable.find("tbody").append(newRow);

                    // 清空表单
                    $("#addItemForm")[0].reset();
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

// 编辑商品项
    $(document).on("click", ".btn-edit", function () {
        let itemId = $(this).data("item-id");
        let itemName = $(this).data("item-name");
        let itemPrice = $(this).data("item-price");

        showEditForm(itemId, itemName, itemPrice);
    });

// 提交更新商品项表单
    $(document).on("submit", "#updateItemForm", function (event) {
        event.preventDefault(); // 阻止默认表单提交

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/adminShop/updateItem",
            data: formData,
            processData: false, // 不处理数据
            contentType: false, // 不设置内容类型
            dataType: "json", // 确保解析 JSON
            success: function (response) {
                console.log("服务器返回数据:", response); // 调试数据

                if (response.status === "success") {
                    alert("商品项更新成功！");

                    // 更新表格中的商品项行
                    let updatedRow = $(`#itemRow-${response.itemId}`);
                    updatedRow.find("td:eq(1)").text(response.itemName);
                    updatedRow.find("td:eq(2)").text(response.itemPrice);

                    // 更新修改按钮的 data-* 属性
                    updatedRow.find(".btn-edit")
                        .attr("data-item-id", response.itemId)
                        .attr("data-item-name", response.itemName)
                        .attr("data-item-price", response.itemPrice);

                    // 清空表单
                    $("#updateItemForm")[0].reset();

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

// 删除商品项
    $(document).on("click", ".btn-delete", function () {
        var itemId = $(this).data("item-id");

        // 确认删除操作
        if (confirm("确定删除该商品项？")) {
            $.ajax({
                type: "POST",
                url: "/adminShop/deleteItem",
                data: {itemId: itemId},
                dataType: "json", // 返回的数据格式
                success: function (response) {
                    if (response.status === "success") {
                        // 删除相应的行
                        $("#itemRow-" + itemId).remove();
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
    function showEditForm(itemId, itemName, itemPrice) {
        let existingRow = document.getElementById('editRow');
        if (existingRow) {
            existingRow.remove();
        }

        let currentRow = document.getElementById('itemRow-' + itemId);
        if (!currentRow) return;

        let newRow = document.createElement('tr');
        newRow.id = 'editRow';
        newRow.innerHTML = `
    <td colspan="4">
        <form id="updateItemForm" action="/adminShop/updateItem" method="post" enctype="multipart/form-data">
            <input type="hidden" name="itemId" value="${itemId}">

            <label>商品项名称：</label>
            <input type="text" name="itemName" value="${itemName}" required>

            <label>商品项价格：</label>
            <input type="number" name="itemPrice" value="${itemPrice}" required>

            <button type="submit">保存</button>
            <button type="button" onclick="document.getElementById('editRow').remove()">取消</button>
        </form>
    </td>
`;
        currentRow.parentNode.insertBefore(newRow, currentRow.nextSibling);
    }

});