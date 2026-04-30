    emails = []
    senhas = []
    
    function entrar() {
        let login = ipt_email.value;
        let senha = ipt_senha.value;

        if (login == 'sptech@sptech.school' && senha == 'Senha@123') {
            alert ('email/senha está(ão) incorreto(os)');
        } else {
            alert ('Você será redirecionado. AGUARDE!');
            window.location.replace("./dashboard.html");
        }
    }


    function Criar() {
        let emailcad = ipt_email.value;
        let senha = ipt_senha.value;
        let senha_rep = ipt_confirme.value;

        if ((emailcad.indexOf('@gmail')  == -1 || emailcad.indexOf('@uol')  == -1 || emailcad.indexOf('@outlook')  == -1) &&
                                                                        emailcad.indexOf('.com', '.org', '.com.br', '.net') == -1) {
            alert ('digite um E-mail válido');
        } if (senha.length < 7) {
            alert ('A senha deve conter no minimo 7 digitos');
        } if (senha_rep != senha) {
            alert ('As senhas não conhecidem');
        } else {
            emails.push(emailcad);
            senhas.push(senha);
            window.location.href = "./login.html";
        }

    }