let emails = ['admin', 'aluno@sptech.school'];
let senhas = ['admin', 'aluno.sptech'];

console.log(emails, senhas)
// login
function entrar() {
    let login = ipt_email.value;
    let senha = ipt_senha.value;

    let tentativas = 0
    let validacao = true;

    for (let i = 0; i <= emails.length; i++) {
        if ((login[i] == 'admin' && senha[i] == 'admin') ||
            (login[i] == 'aluno@sptech.school' && senha[i] == 'aluno.sptech')){
            validacao = true;
            window.location.replace("./dashboard.html");
        } else {
            validacao = false;
        }
    }

    if (!validacao) {
        tentativas++;
        msg_Erro.innerHTML = `Tentativa ${tentativas}: Email/senha incorretos`;
    }

    if (tentativas == 3) {
        msg_Erro.innerHTML += `<br>Limite de tentativas atingido!`;
    }
}
// cadastro
function Criar() {

    let emailcad = ipt_email.value;
    let senha = ipt_senha.value;
    let senha_rep = ipt_confirme.value;

    if ((emailcad.indexOf('@gmail') == -1 || emailcad.indexOf('@uol') == -1 || emailcad.indexOf('@outlook') == -1) &&
        emailcad.indexOf('.com', '.org', '.com.br', '.net') == -1 || emailcad == '') {
        msg_Erro.innerHTML = 'digite um E-mail válido';
    } if (senha.length < 7 || senha == '' || senha == '') {
        msg_Erro.innerHTML = 'A senha deve conter no minimo 7 digitos';
    } if (senha_rep != senha) {
        msg_Erro.innerHTML = 'As senhas não conhecidem';
    }
    if (emailcad == "") {
        msg_Erro.innerHTML = 'O campo de Email esta vazio';
    } else {
        emails.push(emailcad);
        senhas.push(senha);
        window.location.href = "./login.html";
    }

}