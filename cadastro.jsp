<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <title>Cadastro</title>

    <link rel="stylesheet" href="Estilos/normalize-style.css">
    <link rel="stylesheet" href="Estilos/geral-style.css">
    <link rel="stylesheet" href="Estilos/login-cadastro-style.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/8b73dcbc73.js" crossorigin="anonymous"></script>

</head>

<body>

    <header class="header">

        <nav class="header-principal-nav">

            <div class="header-principal-nav-auxiliar header-nav-login">

                <div class="header-principal-nav-buttons" id="divBtnMenu">
                    <button class="button-menu" id="button-menu" aria-label="Menu Principal" aria-controls="lista-menu"
                        aria-expanded="true">
                        <span class="button-menu-bar-icon"></span>
                    </button>
                    <!-- <button class="header-button-menu header-button-menu-close-icon">
                        <i class="fa-solid fa-xmark"></i>
                    </button> -->
                </div>


                <ul class="menu-lista-link" id="lista-menu">
					<li><a
						href="MiraController?operacao=index&click=1&usuario=usuario"
						class="menu-links">Início</a></li>
					<li><a
						href="MiraController?operacao=globo&click=1&usuario=usuario"
						class="menu-links">Oceanos</a></li>
					<li><a
						href="MiraController?operacao=animaisrisco&click=1&usuario=usuario"
						class="menu-links">Animais em Risco</a></li>
					<li><a
						href="MiraController?operacao=poluicao&click=1&usuario=usuario"
						class="menu-links">Poluição Marinha</a></li>
					<li><a
						href="MiraController?operacao=ongs&click=1&usuario=usuario"
						class="menu-links">ONGs</a></li>


				</ul>

            </div>

        </nav>
    </header>

    <main class="main main-login row">

        <section class="form-tudo">
            <div class="div-esquerda divs-forms">
                <h2>Bem Vindo!</h2>

                <img src="imagens/logo.svg" alt="" width="40%"><br>

                <button onclick="window.location.href='login.html'" value="Criar Conta" class="full-button">Login</button></a>

            </div>

            <div class="div-direita divs-forms">
                <h2>Cadastro</h2>
                
                <form action="MiraController"  method="post" class="form form-cadastro">

                    <div class="formInputs">

                        <input type="e-mail" name="email" id="emailId" placeholder="Email" required>
                        <input type="text" name="usuario" id="usuarioId" placeholder="Usuário" required>
                        <input type="password" name="senha" id="senhaId" placeholder="Senha" required>
                        <input type="hidden" name="ftPerfil" accept=".png,image/png" value="null">
                  	</div>


                    <button type="submit" value="criar" name="operacao" id="cadastrarId" class="full-button">Cadastrar</button>



                </form>
            </div>
        </section>
    </main>

    <footer class="footer">

		<div class="footer-vetor-desing">
			<img src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> 
			<img src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> 
			<img src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> 
			<img src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> 
			<img src="imagens/ondas-2.svg" alt="" class="ondas-vetor">
		</div>

        <div class="footer-social-icons">
            <span class="footer-icon-instagram icon icon social-icon">
                <a href="#" class="link-icon"><i class="fa-brands fa-instagram"></i></a>
            </span>
            <span class="footer-icon-facebook icon icon social-icon">
                <a href="#" class="link-icon"><i class="fa-brands fa-facebook-f"></i></a>
            </span>
        </div>



    </footer>


    <script src="script/main.js"></script>

</body>

</html>