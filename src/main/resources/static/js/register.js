$(document).ready(function () {
    let submit = $('#submit');
    let msg = $('#msg1');

    // 监听表单提交
    $('#registerForm').on('submit', function (e) {
        e.preventDefault(); // 阻止默认提交

        var username = $('#username').val();
        var password = $('#password').val();

        // 先验证用户名，验证通过后继续注册
        checkUsernameExists(username, $(this), submit, msg).then(function () {
            // 用户名验证通过，进行注册提交
            submitRegistration(username, password);
        }).catch(function (error) {
            console.error(error); // 用户名验证失败
        });
    });
});

// 检查用户名是否已存在
function checkUsernameExists(username, input, submit, msg) {
    return new Promise(function (resolve, reject) {
        // 拼接查询字符串
        var queryString = 'username=' + encodeURIComponent(username);
        makeRequest('GET', 'Check?' + queryString)
            .then(function (data) {
                var result = JSON.parse(data);
                if (result.exists) {
                    msg.html("Username already exists!").css('color', "red");
                    reject("Username already exists");
                } else {
                    msg.html("Username is available.").css('color', '#333');
                    resolve();  // 用户名通过，继续执行注册
                }
            })
            .catch(function (error) {
                console.error("Error checking username: ", error);
                reject("Error checking username");
            });
    });
}

// 提交注册表单
function submitRegistration(username, password) {

    var form = document.getElementById('registerForm');
    var formData = new FormData(form);  // FormData 自动获取表单中的所有字段

    var queryString = new URLSearchParams(formData).toString();

    makeRequest('POST', 'register?' + queryString)
        .then(function (data) {
            window.location.href = '/catalog/index';
        })
        .catch(function (error) {
            console.error("Error during registration: ", error);
        });
}

    // 创建XHR 请求
function makeRequest(method, url) {
    return new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();
        xhr.open(method, url, true);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    resolve(xhr.responseText);  // 请求成功，返回响应数据
                } else {
                    reject('Error: ' + xhr.status);  // 请求失败，返回错误信息
                }
            }
        };

        xhr.onerror = function () {reject('error');};
        xhr.send();     // 发送请求
    });
}


