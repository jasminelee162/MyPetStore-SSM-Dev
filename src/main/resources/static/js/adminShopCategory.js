$(document).ready(function () {
    $("#addCategoryForm").submit(function (event) {
        event.preventDefault(); // 阻止默认表单提交

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/adminShop/addCategory",
            data: formData,
            processData: false, // 不处理数据
            contentType: false, // 不设置内容类型
            dataType: "json", // 确保解析 JSON
            success: function (response) {
                console.log("服务器返回数据:", response); // 调试数据

                if (response.status === "success") {
                    alert("分类添加成功！");

                    // 确保 `categoryTable` 存在
                    let categoryTable = $("#categoryTable");
                    if (categoryTable.length === 0) {
                        categoryTable = $('<table id="categoryTable" border="1"><thead><tr><th>分类编号</th><th>分类名称</th><th>分类图片</th><th>操作</th></tr></thead><tbody></tbody></table>');
                        $("#mainContent").append(categoryTable);
                    }

                    // 创建新的表格行
                    let newRow = `
                    <tr id="categoryRow-${response.categoryId}">
                        <td>${response.categoryId}</td>
                        <td>${response.categoryName}</td>
                        <td><img src="${response.imageUrl}" alt="分类图片" width="100" height="100"></td>
                        <td>
                            <div class="action-container">
                                <button class="btn-edit" 
                                data-category-id="${response.categoryId}" 
                                data-category-name="${response.categoryName}" 
                                data-category-description="${response.description}">
                                    修改
                                </button>
                                
                                <a href="/adminShop/category?categoryId=${response.categoryId}">查看商品</a>
                                
                                <button class="btn-delete" data-category-id="${response.categoryId}">
                                    删除
                                </button>
                            </div>
                        </td>
                    </tr>`;

                    // 插入到 <tbody> 中
                    categoryTable.find("tbody").append(newRow);

                    // 清空表单
                    $("#addCategoryForm")[0].reset();
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

    // 事件委托绑定编辑按钮点击事件
    $(document).on("click", ".btn-edit", function () {
        let categoryId = $(this).data("category-id");
        let categoryName = $(this).data("category-name");
        let description = $(this).data("category-description");

        console.log("Category Name:", categoryName);

        // 调用 showEditForm 函数显示编辑表单
        showEditForm(categoryId, categoryName, description);
    });


    // 提交更新分类表单（事件委托方式）
    $(document).on("submit", "#updateCategoryForm", function (event) {
        event.preventDefault(); // 阻止默认表单提交

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/adminShop/updateCategory",
            data: formData,
            processData: false, // 不处理数据
            contentType: false, // 不设置内容类型
            dataType: "json", // 确保解析 JSON
            success: function (response) {
                console.log("服务器返回数据:", response); // 调试数据

                if (response.status === "success") {
                    alert("分类更新成功！");

                    // 更新表格中的分类行
                    let updatedRow = $(`#categoryRow-${response.categoryId}`);
                    updatedRow.find("td:eq(1)").text(response.categoryName);
                    updatedRow.find("td:eq(2) img").attr("src", response.imageUrl);

                    // 更新修改按钮的 data-* 属性
                    updatedRow.find(".btn-edit")
                        .attr("data-category-id", response.categoryId)
                        .attr("data-category-name", response.categoryName)
                        .attr("data-category-description", response.description);

                    // 清空表单
                    $("#updateCategoryForm")[0].reset();

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

    // 删除分类的 AJAX 请求
    $(document).on("click", ".btn-delete", function () {
        var categoryId = $(this).data("category-id");

        // 确认删除操作
        if (confirm("确定删除该分类？")) {
            $.ajax({
                type: "POST",
                url: "/adminShop/deleteCategory",
                data: { categoryId: categoryId },
                dataType: "json", // 返回的数据格式
                success: function (response) {
                    if (response.status === "success") {
                        // 删除相应的行
                        $("#categoryRow-" + categoryId).remove();
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

    function showEditForm(categoryId, categoryName, description) {
        // console.log("Category ID:", categoryId);
        // console.log("Category Description:", description);

        let existingRow = document.getElementById('editRow');
        if (existingRow) {
            existingRow.remove();
        }

        let currentRow = document.getElementById('categoryRow-' + categoryId);
        if (!currentRow) return;

        let newRow = document.createElement('tr');
        newRow.id = 'editRow';
        newRow.innerHTML = `
        <td colspan="4">
            <form id="updateCategoryForm" action="/adminShop/updateCategory" method="post" enctype="multipart/form-data">
                <input type="hidden" name="categoryId" value="${categoryId}">
                <input type="hidden" name="originalDescription" value="${description}">

                <label>分类名称：</label>
                <input type="text" name="categoryName" value="${categoryName}" required>

                <label>修改分类图片：</label>
                <input type="file" name="description" accept="image/*">

                <button type="submit">保存</button>
                <button type="button" onclick="document.getElementById('editRow').remove()">取消</button>
            </form>
        </td>
    `;
        currentRow.parentNode.insertBefore(newRow, currentRow.nextSibling);
    }
});
