$(document).ready(function () {

    let debounceTimer = null;

    // 页面初始化，加载全部订单
    loadAllOrders();

    /**
     * 搜索输入框的防抖处理
     */
    $("#order-id").on("keyup", function () {
        clearTimeout(debounceTimer);

        debounceTimer = setTimeout(function () {
            const orderId = $("#order-id").val().trim();
            console.log("当前输入：", orderId);

            if (orderId === "") {
                loadAllOrders();
            } else {
                searchOrders(orderId);
            }
        }, 300);
    });

    /**
     * 表单提交方式搜索（如果保留需要的表单）
     */
    $("#order-search-form").on("submit", function (event) {
        event.preventDefault();
        const orderId = $("#order-id").val().trim();

        if (orderId === "") {
            loadAllOrders();
        } else {
            searchOrders(orderId);
        }
    });

    /**
     * 点击详情按钮，展开 / 折叠订单详情行
     */
    $(document).on("click", ".order-detail-btn", function () {
        const orderId = $(this).data("id");
        console.log("查看订单详情，订单编号：", orderId);

        const detailsRow = $(`tr.order-details-row[data-order-id="${orderId}"]`);
        if (detailsRow.length === 0) {
            alert("未找到详情行！");
            return;
        }

        detailsRow.toggle();
    });

    /**
     * 点击发货按钮
     */
    $(document).on("click", ".order-ship-btn", function () {
        const orderId = $(this).data("id");
        console.log("发货订单编号：", orderId);

        $.ajax({
            url: `/adminOrder/ship`,
            type: "POST",
            data: JSON.stringify({ orderId: orderId }),
            contentType: "application/json",
            success: function (response) {
                console.log("发货返回结果：", response);

                if (response.status === "success") {
                    alert("发货成功！");
                    loadAllOrders();
                } else {
                    alert("发货失败：" + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("发货请求失败！", error);
                alert("服务器连接失败！");
            }
        });
    });

    /**
     * 点击删除按钮
     */
    $(document).on("click", ".order-delete-btn", function () {
        const orderId = $(this).data("id");
        console.log("删除订单编号：", orderId);

        if (confirm("确定要删除此订单吗？")) {
            $.ajax({
                url: `/adminOrder/delete`,
                type: "DELETE",
                data: JSON.stringify({ orderId: orderId }),
                contentType: "application/json",
                success: function (response) {
                    console.log("删除返回结果：", response);

                    if (response.status === "success") {
                        alert("删除成功！");
                        loadAllOrders();
                    } else {
                        alert("删除失败：" + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("删除请求失败！", error);
                    alert("服务器连接失败！");
                }
            });
        }
    });

    /**
     * 加载全部订单
     */
    function loadAllOrders() {
        console.log("加载全部订单...");

        $.ajax({
            url: `/adminOrder/all`,
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
                console.error("请求全部订单失败！", error);
            }
        });
    }

    /**
     * 按订单编号搜索订单
     */
    function searchOrders(orderId) {
        console.log("搜索订单编号：", orderId);

        $.ajax({
            url: `/adminOrder/search`,
            type: "GET",
            data: { orderId: orderId },
            success: function (response) {
                console.log("搜索结果：", response);

                if (response.status === "success") {
                    if (response.orders && response.orders.length > 0) {
                        renderOrders(response.orders);
                    } else {
                        renderNoOrder("未找到相关订单！");
                    }
                } else if (response.status === "not_found") {
                    renderNoOrder(response.message);
                } else {
                    alert("搜索出错：" + response.message);
                }
            },
            error: function (xhr, status, error) {
                console.error("搜索请求失败！", error);
            }
        });
    }

    /**
     * 渲染订单列表
     */
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
                            <p><strong>用户账号：</strong>${order.userId || order.userid || "未知用户"}</p>
                            <p><strong>订单金额：</strong>￥${order.totalPrice}</p>
                            <p><strong>订单状态：</strong>${order.status || '未知状态'}</p>
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
                                    ${order.lineItems && order.lineItems.length > 0
                ? order.lineItems.map(item => `
                                            <tr>
                                                <td>${item.itemId}</td>
                                                <td>${item.quantity}</td>
                                                <td>￥${item.unitPrice}</td>
                                                <td>￥${item.total}</td>
                                            </tr>
                                        `).join("")
                : `<tr><td colspan="4" style="text-align: center;">暂无商品信息</td></tr>`
            }
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            `;

            tableBody.append(row);
        });
    }

    /**
     * 没有订单时渲染空数据
     */
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
