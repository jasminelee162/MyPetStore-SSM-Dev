document.addEventListener("DOMContentLoaded", () => {
    const addForm = document.getElementById("add");

    addForm.addEventListener("submit", async function (e) {
        e.preventDefault(); // 阻止表单默认提交

        const formData = new FormData(addForm);

        try {
            const response = await fetch("/adminShop/addCategory", {
                method: "POST",
                body: formData
            });

            if (!response.ok) {
                alert("添加失败！");
                return;
            }

            // 获取后端返回的 JSON 数据
            const data = await response.json();

            if (data.success) {
                // 单个分类对象
                const category = data.category;

                // 在表格追加这个分类
                appendCategoryRow(category);

                // 清空表单
                addForm.reset();

                alert(data.message); // 成功提示
            } else {
                alert(data.message); // 失败提示
            }

        } catch (error) {
            console.error("请求出错", error);
        }
    });
});

// 在表格中添加新的分类行
function appendCategoryRow(category) {
    const table = document.querySelector("table");

    // 创建新的表格行
    const tr = document.createElement("tr");
    tr.id = "categoryRow-" + category.categoryId;

    tr.innerHTML = `
        <td>${category.categoryId}</td>
        <td>${category.categoryName}</td>
        <td>
            <img src="${category.description}" alt="分类图片" width="100" height="100">
        </td>
        <td>
            <div class="action-container">
                <button onclick="showEditForm('${category.categoryId}', '${category.categoryName}', '${category.description}')">
                    修改
                </button>
                <a href="/adminShop/category?categoryId=${category.categoryId}">查看商品</a>
                <form action="/adminShop/deleteCategory" method="post" onsubmit="return confirm('确定删除该分类？')">
                    <input type="hidden" name="categoryId" value="${category.categoryId}">
                    <button type="submit">删除</button>
                </form>
            </div>
        </td>
    `;

    // 把新行加到表格里
    table.appendChild(tr);

    // 如果原来有 "无类别" 提示，把它删除
    const noCategoryMsg = document.querySelector("p[th\\:if]");
    if (noCategoryMsg) {
        noCategoryMsg.remove();
    }
}
