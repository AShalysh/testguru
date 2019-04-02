function check() {
    if (document.getElementById('user_password').value ==
        document.getElementById('user_password_confirmation').value) {
        document.getElementById('submit-button').disabled = false;
        document.getElementById('message').style.color = 'green';
        document.getElementById('message').innerHTML = 'matching';
    } else {
        document.getElementById('submit-button').disabled = true;
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'not matching';
    }
}
