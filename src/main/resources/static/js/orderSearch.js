$(document).ready(function () {
    let debounceTimer = null;

    // 页面初始化，先加载全部订单
    loadAllOrders();

    // 搜索订单
    $("#order-search-form").on("submit", function (event) {
        event.preventDefault();
        const orderId = $("#order-id").val().trim();
        if (orderId === "") {
            loadAllOrders();
        } else {
            searchOrders(orderId);
        }
    });

    // 详情按钮点击事件
    $(document).on("click", ".order-detail-btn", function () {
        const orderId = $(this).data("id");
        console.log("查看订单详情，订单编号：", orderId);

        // 找到对应的订单详情行
        const detailsRow = $(`tr.order-details-row[data-order-id="${orderId}"]`);
        if (detailsRow.is(":visible")) {
            // 如果已经显示，隐藏它
            detailsRow.hide();
        } else {
            // 如果未显示，显示它
            detailsRow.show();
        }
    });

    // 发货按钮点击事件
    $(document).on("click", ".order-ship-btn", function () {
        const orderId = $(this).data("id");
        console.log("发货订单编号：", orderId);

        // 发送 POST 请求到后端
        $.ajax({
            url: `/adminOrder/ship`,
            type: "POST",
            data: JSON.stringify({ orderId: orderId }),
            contentType: "application/json",
            success: function (response) {
                console.log("后端返回的数据：", response);

                if (response.status === "success") {
                    alert("发货成功！");
                    // 刷新订单列表
                    loadAllOrders();
                } else {
                    alert("发货失败：" + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("服务器连接失败！", error);
                alert("服务器连接失败！");
            }
        });
    });

    // 删除按钮点击事件
    $(document).on("click", ".order-delete-btn", function () {
        const orderId = $(this).data("id");
        console.log("删除订单编号：", orderId);

        // 确认删除操作
        if (confirm("确定要删除此订单吗？")) {
            // 发送 DELETE 请求到后端
            $.ajax({
                url: `/adminOrder/delete`,
                type: "DELETE",
                data: JSON.stringify({ orderId: orderId }),
                contentType: "application/json",
                success: function (response) {
                    console.log("后端返回的数据：", response);

                    if (response.status === "success") {
                        alert("删除成功！");
                        // 刷新订单列表
                        loadAllOrders();
                    } else {
                        alert("删除失败：" + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("服务器连接失败！", error);
                    alert("服务器连接失败！");
                }
            });
        }
    });

    // 加载全部订单的方法
    function loadAllOrders() {
        console.log("加载全部订单...");

        $.ajax({
            url: `/adminOrder/all`,  // 你后端需要提供这个接口
            type: "GET",
            success: function (response) {
                console.log("获取全部订单：", response);

                if (response.status === "success") {
                    if (response.orders && response.orders.length > 0) {
                        renderOrders(response.orders);
                    } else {
                        renderNoOrder("没有任何订单！");
                    }
                } else {
                    alert("获取全部订单失败：" + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("服务器连接失败！", error);
            }
        });
    }

    // 搜索订单
    function searchOrders(orderId) {
        console.log("搜索订单编号：", orderId);

        $.ajax({
            url: `/adminOrder/search`,
            type: "GET",
            data: { orderId: orderId },
            success: function (response) {
                console.log("后端返回的搜索结果：", response);

                if (response.status === "success") {
                    if (response.orders && response.orders.length > 0) {
                        renderOrders(response.orders);
                    } else {
                        renderNoOrder("未找到相关订单！");
                    }
                } else {
                    alert("搜索失败：" + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("服务器连接失败！", error);
            }
        });
    }

    // 渲染多个订单
    function renderOrders(orderList) {
        const tableBody = $(".order-list tbody");
        tableBody.empty();

        if (!orderList || orderList.length === 0) {
            renderNoOrder("没有订单数据！");
            return;
        }

        orderList.forEach(order => {
            const row = `
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.userId || order.userid || "未知用户"}</td>
                    <td>￥${order.totalPrice}</td>
                    <td>${order.status || '未知状态'}</td>
                    <td>
                        <button class="order-detail-btn" data-id="${order.orderId}">详情</button>
                        <button class="order-edit-btn" data-id="${order.orderId}">修改</button>
                        <button class="order-delete-btn" data-id="${order.orderId}">删除</button>
                        <button class="order-ship-btn" data-id="${order.orderId}">发货</button>
                    </td>
                </tr>
                <tr class="order-details-row" style="display: none;" data-order-id="${order.orderId}">
                    <td colspan="5">
                        <div class="order-details">
                            <p><strong>订单编号：</strong>${order.orderId}</p>
                            <p><strong>用户账号：</strong>${order.userId}</p>
                            <p><strong>订单金额：</strong>￥${order.totalPrice}</p>
                            <p><strong>订单状态：</strong>${order.status}</p>
                            <table class="line-items-table">
                                <thead>
                                <tr>
                                    <th>商品ID</th>
                                    <th>数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                </tr>
                                </thead>
                                <tbody>
                                ${order.lineItems.map(item => `
                                    <tr>
                                        <td>${item.itemId}</td>
                                        <td>${item.quantity}</td>
                                        <td>￥${item.unitPrice}</td>
                                        <td>￥${item.total}</td>
                                    </tr>
                                `).join("")}
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            `;
            tableBody.append(row);
        });
    }

    // 没有订单时渲染
    function renderNoOrder(message) {
        const tableBody = $(".order-list tbody");
        tableBody.empty();

        const row = `
            <tr>
                <td colspan="5" style="text-align: center;">${message}</td>
            </tr>
        `;

        tableBody.append(row);
    }
});