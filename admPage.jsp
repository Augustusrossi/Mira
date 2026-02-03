<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin</title>
	
	<script src="https://kit.fontawesome.com/8b73dcbc73.js"
		crossorigin="anonymous"></script>
		
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="Estilos/normalize-style.css">
	<link rel="stylesheet" href="Estilos/geral-style.css">
	<link rel="stylesheet" href="Estilos/pageAdm-style.css">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap" rel="stylesheet">
	

	
</head>


<bodyc class="body"> 

	<header class="header">
		<span class="retangulo-detalhe"></span>
	
		<nav class="header-principal-nav">
	
			<div class="header-principal-nav-auxiliar">
	
				<div class="header-logo">
	
					<a href="index.html"> <img src="imagens/Union.svg" alt=""
						class="header-logo-img">
					</a>
				</div>
	
				<div class="header-principal-nav-buttons" id="divBtnMenu">
	
					<c:choose>
	
						<c:when test="${status}">
	
							<button class="header-button-login full-button">
	
								<a href="MiraController?operacao=perfil&click=1&usuario=${usuario}">${usuario}</a>	
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

					<li><a href="MiraController?operacao=sair" class="menu-links sair">Sair</a></li>

	
				</ul>
	
			</div>
	
	
		</nav>
	
	</header>
	
	
	
	<main class="main main-login row">
	
		<section class="form-tudo">
			<div class="divs-forms">
				<h1>Bem Vindo Adm!</h1>
	
				<h2>Cadastro dos Animais em Risco.</h2>
				
				<form action="MiraController" method="post" class="form form-cadastro" enctype="multipart/form-data">
	
					<input type="text" name="nomeComum" id="nomeComum" placeholder="Nome Comum" class="formInputs" required> 
					<input type="text" name="nomeCientifico" id="nomeCientifico" placeholder="Nome Científico" class="formInputs" required> 
					<input type="text" name="habitat" id="habitat" placeholder="Habitat" class="formInputs" required> 
					<input type="text" name="local" id="local" placeholder="Localização:" class="formInputs" required> 
					
					
					<input type="text" name="populacao" placeholder="População:" class="formInputs" required>
					
					<input type="text" name="curiosidade" id="curiosidade" placeholder="Curiosidade:" maxlength="300" class="formInputs" required>
					
					<select name="risco" id="risco" class="formInputs inputSelect" style="width: 100%; padding-left: .7em" placeholder="Selecione:" required>
	
						<option value="select" disabled selected class="select" style="color: #757575;">Selecione:</option>
						<option value="poucoRisco">Pouco Risco de extinção</option>
						<option value="muitoRisco">Muito Risco de extinção</option>
	
					</select>
					
					<div class="bootstrap-scope" style="width: 100%">
						<input type="file" name="imageAnimal" placeholder="População:" class="formInputs form-control" accept=".png,image/png" id="formFile" required style="width: 100%">
				    </div>
		 
					<input type="submit" value="cadastrarAnimal" name="operacao" id="CadastrarAnimal" class="full-button">
		
		
	
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
			<span class="footer-icon-instagram icon icon social-icon"> <a
				href="#" class="link-icon"><i class="fa-brands fa-instagram"></i></a>
			</span> <span class="footer-icon-facebook icon icon social-icon"> <a
				href="#" class="link-icon"><i class="fa-brands fa-facebook-f"></i></a>
			</span>
		</div>
	
	
	
	</footer> 
	<script src="script/main.js"></script>

</body>
</html>