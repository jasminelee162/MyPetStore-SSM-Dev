$(document).ready(function () {
    let submit = $('#submit');
    let msg = $('#msg1');

    // 监听表单提交
    $('#registerForm').on('submit', function (e) {
        e.preventDefault(); // 阻止默认提交

        var username = $('#username').val();
        var password = $('#password').val();

        // 先验证用户名，验证通过后继续注册
        checkUsernameExists(username, msg).then(function () {
            // 用户名验证通过，进行注册提交
            submitRegistration(username, password);
        }).catch(function (error) {
            console.error(error);
        });
    });

    // 检查用户名是否已存在
    function checkUsernameExists(username, msg) {
        return fetch('Check?username=' + encodeURIComponent(username))
            .then(response => {
                if (!response.ok) throw new Error('请求失败: ' + response.status);
                return response.json();
            })
            .then(data => {
                if (data.exists) {
                    msg.html("Username already exists!").css('color', "red");
                    throw new Error("Username already exists");
                } else {
                    msg.html("Username is available.").css('color', '#333');
                }
            });
    }

    // 提交注册表单
    function submitRegistration(username, password) {
        var formData = new FormData(document.getElementById('registerForm'));

        fetch('register', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (!response.ok) throw new Error('注册失败: ' + response.status);
                return response.text();
            })
            .then(data => {
                console.log("注册成功:", data);
                window.location.href = data;
            })
            .catch(error => {
                console.error("Error during registration: ", error);
            });
    }
});
