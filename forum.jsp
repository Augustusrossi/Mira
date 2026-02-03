<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
<meta charset="UTF-8">

<title>Publicação</title>

	<script src="https://kit.fontawesome.com/8b73dcbc73.js"
		crossorigin="anonymous"></script>
		
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="Estilos/normalize-style.css">
	<link rel="stylesheet" href="Estilos/geral-style.css">
	<link rel="stylesheet" href="Estilos/pageAdm-style.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
		href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap"
		rel="stylesheet">

<script src="https://kit.fontawesome.com/8b73dcbc73.js"
	crossorigin="anonymous"></script>

</head>

<body>

	<header class="header">

		<nav class="header-principal-nav">

			<div class="header-principal-nav-auxiliar">

				<div class="header-logo">
					<a href="MiraController?operacao=index&click=1&usuario=usuario"
						class="menu-links"> <img src="imagens/Union.svg" alt=""
						class="header-logo-img">
					</a>
				</div>

				<div class="header-principal-nav-buttons" id="divBtnMenu">

					<c:choose>

						<c:when test="${status}">

							<button class="header-button-login full-button">

								<a href="MiraController?operacao=perfil&click=1&usuario=usuario">${usuario}</a>

							</button>


						</c:when>

						<c:otherwise>

							<button class="header-button-login full-button">

								<a href="login.html">LOGIN</a>

							</button>

						</c:otherwise>

					</c:choose>

					<button class="button-menu" id="button-menu"
						aria-label="Menu Principal" aria-controls="lista-menu"
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
						
					<li><a
						href="MiraController?operacao=forum&click=1&usuario=usuario"
						class="menu-links">Fórum</a></li>
						
					<c:if test="${usuario == 'admin' && senha == 'winx2024'}">
						<li><a
							href="MiraController?operacao=adm&click=1&usuario=usuario"
							class="menu-links">Admin</a></li>

					</c:if>
					
					 <li><a href="MiraController?operacao=sair" class="menu-links">Sair</a></li>
				</ul>

			</div>


		</nav>

	</header>

	<main class="main row">

		<section class="form-tudo form-post">
			<div class="divs-forms">
					
				<form action="MiraController" method="post" class="form form-cadastro" enctype="multipart/form-data">
	
					<input type="text" name="descricao" id="descricao" required class="formInputs"> 
					
					<div class="bootstrap-scope" style="width: 100%">
						<input type="file" name="ftPost" required class="formInputs form-control" accept=".png,image/png" style="width: 100%">
				    </div>
		 
					<!-- <input type="submit" value="postar" name="operacao" id="CadastrarAnimal" class="full-button">-->
		
					<input type="hidden" name="operacao" value="postar">
	        		<button type="submit" class="full-button">Postar</button>
	
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