$(document).ready(function () {
    let submit = $('#submit');
    let msg = $('#msg1');

    // 监听表单提交
    $('#registerForm').on('submit', function (e) {
        e.preventDefault(); // 阻止默认提交

        var username = $('#username').val();
        var password = $('#password').val();

        // 先验证用户名，验证通过后继续注册
        checkUsernameExists(username, msg)
            .then(() => {
                // 用户名验证通过，进行注册提交
                submitRegistration(username, password);
            })
            .catch(error => {
                console.error(error);
            });
    });
});

// 检查用户名是否已存在
function checkUsernameExists(username, msg) {
    return new Promise((resolve, reject) => {
        axios.get('Check', { params: { username } })
            .then(response => {
                if (response.data.exists) {
                    msg.html("Username already exists!").css('color', "red");
                    reject("Username already exists");
                } else {
                    msg.html("Username is available.").css('color', '#333');
                    resolve();
                }
            })
            .catch(error => {
                console.error("Error checking username: ", error);
                reject("Error checking username");
            });
    });
}

// 提交注册表单
function submitRegistration(username, password) {
    var form = document.getElementById('registerForm');
    var formData = new FormData(form);

    axios.post('register', formData)
        .then(response => {
            console.log(response.data);
            // 注册成功后跳转到 /catalog/index
            window.location.href = "/catalog/index";
        })
        .catch(error => {
            console.error("Error during registration: ", error);
        });
}