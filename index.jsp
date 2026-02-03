<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>

<script src="https://kit.fontawesome.com/8b73dcbc73.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="Estilos/normalize-style.css">
<link rel="stylesheet" href="Estilos/geral-style.css">
<link rel="stylesheet" href="Estilos/index-style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap"
	rel="stylesheet">
</head>


<body class="body">



	<span class="circulos-detalhes"></span>
	<span class="circulos-detalhes"></span>

	<header class="header">
		<span class="retangulo-detalhe"></span>


		<nav class="header-principal-nav">

			<div class="header-principal-nav-auxiliar">

				<div class="header-logo">

					<img src="imagens/Union.svg" alt="" class="header-logo-img">
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

								<a href="login.jsp">LOGIN</a>

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
						href="MiraController?operacao=ongs&click=1&usuario=usuario"
						class="menu-links">ONGs</a></li>
					<li><a
						href="MiraController?operacao=globo&click=1&usuario=usuario"
						class="menu-links">Oceanos</a></li>
					<li><a
						href="MiraController?operacao=animaisrisco&click=1&usuario=usuario"
						class="menu-links">Animais em Risco</a></li>
					<li><a
						href="MiraController?operacao=poluicao&click=1&usuario=usuario"
						class="menu-links">Poluição Marinha</a></li>


					<c:if test="${usuario == 'admin' && senha == 'winx2024'}">
						<li><a
							href="MiraController?operacao=adm&click=1&usuario=usuario"
							class="menu-links">Admin</a></li>
					</c:if>
					
					<c:if test="${status == 'true' }">
						<li><a
						href="MiraController?operacao=forum&click=1&usuario=usuario"
						class="menu-links">Fórum</a></li>
					
						<li><a href="MiraController?operacao=sair" class="menu-links">Sair</a></li>

					</c:if>
					



				</ul>


			</div>


		</nav>

		<section class="header-section row">

			<div class="header-section-first">

				<h1 class="header-section-title">MIRA</h1>

				<p class="header-section-text paragraph-text">O Mira é uma
					plataforma informativa sobre a vida marinha do Brasil, focada em
					conscientização ambiental. Ele reúne dados sobre as costas,
					espécies ameaçadas e perigos, além de oferecer um fórum para
					conexão entre usuários e ONGs.</p>

				<a href="MiraController?operacao=globo&click=1&usuario=usuario"
					class="header-section-button-world-map full-button">World
					Map</a>

				<div class="header-section-social-icons">
					<span class="header-icon-instagram icon social-icon"> <a
						href="#" class="link-icon"><i class="fa-brands fa-instagram"></i></a>
					</span> <span
						class="header-icon-facebook icon eader-icon-instagram icon social-icon">
						<a href="#" class="link-icon"><i
							class="fa-brands fa-facebook-f"></i></a>
					</span>
				</div>

			</div>


			<div class="header-section-second">

				<div class="formas paralelograma-1"></div>
				<div class="formas paralelograma-2"></div>
				<div class="formas paralelograma-3"></div>

			</div>

		</section>

	</header>


	<main class="main main-princi row">

		<section class="main-princi-images back-diferent">
			<img src="imagens/imagem-index-2.jpg" alt="" class="img img-main-princi">
			<hr>
			<img src="imagens/imagem-index-3.jpg" alt="" class="img img-main-princi">
		</section>

		<section class="main-princi-about">

			<h1 class="subcontainer-text-about-tittle">Sobre</h1>

			<!-- <div class="container-text-about">
                        
                <div class="subcontainer-text-about"> -->

			<article class="main-princi-about-text">

				<h2>Mas o que é o MIRA?</h2>

				<p class="paragraph-text">Mira é um site que tem como intuito
					informar sobre as situações da vida marinha em diferentes regiões
					do mundo, reforçar a ideia e reconhecimento sobre a conscientização
					ambiental relacionada aos ecossistemas marinhos. A partir desse
					objetivo o Mira é um projeto e plataforma que traz informações
					sobre as costas brasileiras e os perigos ambientais daquela região,
					interação com os oceanos e informações sobre aquele oceano, os
					animais em risco de extinção nos mares do Brasil e a interação
					entre usuários e ONGs nacionais em um fórum de conversação e
					postagens.</p>

			</article>

			<article class="main-princi-about-text">

				<h2>E o que é cada espaço dessa plataforma?</h2>

				<p class="paragraph-text">As páginas de informações são o lugar
					perfeito para aprender sobre a vida marinha e como esse assunto é
					extremamente importante, descobrindo como um assunto considerado
					trivial para alguns é um objetivo de Desenvolvimento Sustentável no
					Brasil determinado pela ONU. Mas também é o lugar perfeito para
					descobrir sobre os animais que vivem nos nossos mares e como eles
					vivem, além de descobrir maneiras de ajudar esses animais a
					continuarem a existir.</p>
			</article>

			<article class="main-princi-about-text">

				<h2>Globo:</h2>

				<p class="paragraph-text">A página do globo além de ser um
					página com todos oceanos e as dinâmicas de sobrevivência de seus
					ecossistemas, possuí um caminho para um globo interativo que
					permite que o usuário possa mover o globo e ver onde cada oceano
					está localizado com maior dimensão e imersão.</p>
			</article>

			<article class="main-princi-about-text">

				<h2>Fórum:</h2>

				<p class="paragraph-text">Assim como todos os fórum atuais a
					ideia é comunicação, mas diferente de um fórum sobre a assuntos
					gerais, o Mira trouxe uma proposta diferente, um canal de interação
					entre ONGs e projetos relacionados a conscientização sobre a
					preservação marinha e o público geral, com a ideia de perfis para
					divulgação sobre as atividades das ONGs e projetos e sua pautas.</p>

			</article>


			<article class="main-princi-about-text">

				<div class="subcontainer-icon-about">
					<span class="icon icon-main-princi"> <img
						src="imagens/baleia-icon.svg" alt="">
					</span> <span class="icon icon-main-princi"> <img
						src="imagens/atum-icon.svg" alt="">
					</span> <span class="icon icon-main-princi"> <img
						src="imagens/cavalo-marinho-icon.svg" alt="">
					</span> <span class="icon icon-main-princi"> <img
						src="imagens/foca-icon.svg" alt="">
					</span> <span class="icon icon-main-princi"> <img
						src="imagens/araia-icon.svg" alt="">
					</span> <span class="icon icon-main-princi"> <img
						src="imagens/tartaruga-icon.svg" alt="">
					</span>
				</div>

			</article>

		</section>
	
	</main>

	
	<footer class="footer">
		
		<div class="footer-vetor-desing">
			<img src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> <img
				src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> <img
				src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> <img
				src="imagens/ondas-2.svg" alt="" class="ondas-vetor"> <img
				src="imagens/ondas-2.svg" alt="" class="ondas-vetor">
		</div>

		<div class="footer-social-icons">
			<span class="footer-icon-instagram icon icon social-icon"> <a
				href="#" class="link-icon"><i class="fa-brands fa-instagram"></i></a>
			</span> <span class="footer-icon-facebook icon icon social-icon"> <a
				href="#" class="link-icon"><i class="fa-brands fa-facebook-f"></i></a>
			</span>
		</div>

	</footer>

	<!-- <script src="script/menu.js"></script> -->
	<script src="script/main.js"></script>

</body>

</html>