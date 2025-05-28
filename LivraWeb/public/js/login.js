// Variáveis de exemplo para "banco de dados" simulado
let email1 = "teste1@gmail.com";
let senha1 = "123";
let email2 = "teste2@gmail.com";
let senha2 = "456";
let email3 = "teste3@outlook.com";
let senha3 = "789";
let email4 = null;
let senha4 = null;
let email5 = null;
let senha5 = null;

function showCadastro() {
  const divLogin = document.getElementById("div_login");
  divLogin.innerHTML = `
    <img src="assets/icon/iconLivro.png" alt="Logo">
    <h1>Cadastro</h1>
    <div>
      <p>Endereço de email</p>
      <input type="email" placeholder="Email" id="email">
    </div>
    <div>
      <p>Senha</p>
      <input type="password" placeholder="Senha" id="senha">
    </div>
    <div>
      <p>Confirmar senha</p>
      <input type="password" placeholder="Confirmar senha" id="confirmarSenha">
    </div>
    <div>
      <button onclick="cadastrar()">Criar</button>
    </div>
    <div>
      <p>Já possui cadastro? <span id="clicavel" onclick="showLogin()">Entrar</span></p>
    </div>
  `;
}

function showLogin() {
  const divLogin = document.getElementById("div_login");
  divLogin.innerHTML = `
    <img src="assets/icon/iconLivro.png" alt="Logo">
    <h1>Login</h1>
    <div>
      <p>Endereço de email</p>
      <input type="email" placeholder="Email" id="ipt_email">
    </div>
    <div>
      <p>Senha</p>
      <input type="password" placeholder="Senha" id="ipt_senha">
    </div>
    <div>
      <button onclick="login()">Entrar</button>
    </div>
    <div>
      <p style="color: rgba(255, 255, 255, 0.651);">Esqueceu a senha?</p>
      <p>Ainda não tem cadastro? <span id="clicavel" onclick="showCadastro()">Cadastre-se</span></p>
    </div>
  `;
}

function login() {
  const emailEscrito = document.getElementById("ipt_email").value;
  const senhaEscrita = document.getElementById("ipt_senha").value;

  if (
    (emailEscrito === email1 && senhaEscrita === senha1) ||
    (emailEscrito === email2 && senhaEscrita === senha2) ||
    (emailEscrito === email3 && senhaEscrita === senha3) ||
    (emailEscrito === email4 && senhaEscrita === senha4) ||
    (emailEscrito === email5 && senhaEscrita === senha5)
  ) {
    window.location.href = "dashboards.html";
  } else {
    alert("Email ou senha incorretos!");
  }
}

