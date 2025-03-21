$(document).ready(function () {

    let debounceTimer = null;

    // 页面初始化，先加载全部订单
    loadAllOrders();

    $("#order-id").on("keyup", function () {
        clearTimeout(debounceTimer);

        debounceTimer = setTimeout(function () {
            const orderId = $("#order-id").val().trim();
            console.log("当前输入：", orderId);

            // 如果输入为空，查询所有订单
            if (orderId === "") {
                loadAllOrders();
                return;
            }

            // 正常按输入内容查询
            $.ajax({
                url: `/adminOrder/search`,
                type: "GET",
                data: { orderId: orderId },
                success: function (response) {
                    console.log("后端返回的数据：", response);

                    if (response.status === "success") {
                        if (response.orders && response.orders.length > 0) {
                            renderOrders(response.orders);
                        } else {
                            renderNoOrder("订单数据异常！");
                        }
                    } else if (response.status === "not_found") {
                        renderNoOrder(response.message);
                    } else {
                        alert("查询出错：" + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("服务器连接失败！", error);
                }
            });

        }, 300);
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
