    function entrar() {
        let login = ipt_login.value;
        let senha = ipt_senha.value;

        if (login != 'sptech@sptech.school' || senha != 'Senha@123') {
            alert ('email/senha está(ão) incorreto(os)');
        } else {
            alert ('Você será redirecionado. AGUARDE!');
        }
    }
