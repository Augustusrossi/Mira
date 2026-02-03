<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Poluição Marinha</title>

<script src="https://kit.fontawesome.com/8b73dcbc73.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="Estilos/normalize-style.css">
<link rel="stylesheet" type="text/css" href="Estilos/geral-style.css">
<link rel="stylesheet" type="text/css" href="Estilos/poluicao-style.css">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap"
	rel="stylesheet" type="text/css">



</head>


<body>

	<header class="header">

		<nav class="header-principal-nav">

			<div class="header-principal-nav-auxiliar">

				<div class="header-logo">
					<a href="MiraController?operacao=index&click=1&usuario=usuario"
						class="menu-links"> <img src="Union.svg" alt=""
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
						href="MiraController?operacao=index&click=1&usuario=usuario"
						class="menu-links">Início</a></li>

					<li><a
						href="MiraController?operacao=ongs&click=1&usuario=usuario"
						class="menu-links">ONGs</a></li>
					<li><a
						href="MiraController?operacao=globo&click=1&usuario=usuario"
						class="menu-links">Oceanos</a></li>
					<li><a
						href="MiraController?operacao=animaisrisco&click=1&usuario=usuario"
						class="menu-links">Animais em Risco</a></li>

					

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

	</header>


	<main class="main main-sub">
		<h1>Poluição Marinha</h1>

		<!-- introdução -->

		<section class="contents content-intro">

			<img src="imagens/poluicao13.jpg" alt="" class="content-intro-img">

			<p class="content-intro-text">Transversalmente, existem ameaças
				comuns a todos os oceanos: a aceleração do aquecimento global (os
				oceanos absorvem ~90% do excesso de calor atmosférico), acidificação
				oceânica causada pelo aumento de CO₂, poluição por plásticos e
				substâncias tóxicas, sobrepesca e pesca ilegal, e perda de habitats
				costeiros. Esses fatores combinados aumentam o risco de extinção
				local e global para muitas espécies marinhas; a IUCN mantém listas
				atualizadas de espécies em risco (tartarugas marinhas, vários
				tubarões, algumas espécies de cetáceos e peixes costeiros), e
				estudos recentes mostram que muitas populações continuam em declínio
				apesar de esforços de conservação, o que ressalta a necessidade de
				políticas globais e ações locais integradas. Para decisões e
				planejamento conservacionista, as fontes mais confiáveis e
				atualizadas são os relatórios científicos revisados por pares, as
				avaliações do IUCN Red List, os relatórios técnicos de agências como
				NOAA/FAO/UNEP, e os relatórios especializados sobre regiões polares
				(IPCC SROCC e NOAA Arctic Report Card).</p>


		</section>

		<section class="contents content-intro">

			<div>

				<h2>Poluição marinha no Brasil:</h2>

				<p class="content-intro-text">Na pesquisa mais atual publicada
					no dia 01/10/2025 na página Nidde digital,eles destacam que:
					segundo a ONU, o Brasil é responsável por 3,44 milhões de toneladas
					de plástico presente nos oceanos, todos os anos.O que significa 8%
					da poluição marinha global. Sacolas, garrafas, embalagens e outros
					resíduos mal destinados formam um fluxo constante de lixo que parte
					das cidades, passa pelos rios e termina no mar.</p>

				<p class="content-intro-text">Os efeitos da poluição marinha já
					são amplamente sentidos. Segundo o Programa das Nações Unidas para
					o Meio Ambiente (PNUMA/ONU), mais de 800 espécies marinhas sofrem
					com os resíduos plásticos, seja por ingestão, emaranhamento ou
					outras formas de contaminação. O WWF também alerta que a poluição
					plástica compromete significativamente a biodiversidade marinha,
					atingindo diferentes espécies e ecossistemas. Estudos científicos,
					como os publicados na revista Environmental Research
					Communications, indicam que microplásticos já estão presentes em
					peixes e frutos do mar consumidos por humanos, o que pode
					representar riscos diretos à saúde.</p>

				<p class="content-intro-text">No Brasil, a situação é
					preocupante: apenas 1,3% do plástico passa pelo processo de
					reciclagem e coleta, reforçando a urgência de iniciativas que
					garantam a destinação correta dos resíduos.</p>
			</div>

			<img src="imagens/poluicao5.gif" alt="" class="content-intro-img">




		</section>



		<!-- gráficos de regiões mais poluentes carrossel-->
		<section class="contents content-carrossel content-background">


			<div class="container-slider">

				<div class="div-image">
					<img src="imagens/grafico.png" alt=""
						class="carrossel-item-img">
				</div>

				<div class="auxiliar">

					<button id="prev-button">
						<img src="imagens/square-caret-left-regular-full.svg" alt="">
					</button>

					<div class="container-images">
						<article class="carrossel-item on">
							<div>
								<h3>Filipinas:</h3>
								<p>Possui 4.820 rios identificados como fontes de poluição, a estimação é que o país despeja 356.371 toneladas métricas de plástico por ano nos oceanos.</p>
							</div>
						</article>
						<article class="carrossel-item">
							<div>
								<h3>Índia:</h3>
								<p>Contribui com aproximadamente 126.513 toneladas métricas de plástico por ano, que vem de diversos rios em todo o país.</p>
							</div>
						</article>

						<article class="carrossel-item">
							<div>
								<h3>Malásia:</h3>
								<p>É estimado que 1.070 rios sejam responsáveis pela emissão de cerca de 73.098 toneladas métricas de plástico anualmente.</p>
							</div>
						</article>

						<article class="carrossel-item">
							<div>
								<h3>China:</h3>
								<p>Possui 1.309 rios contribuindo para o problema, o país despeja aproximadamente 70.707 toneladas métricas de plástico por ano nos oceanos.</p>
							</div>
						</article>

						<article class="carrossel-item">
							<div>
								<h3>Indonésia:</h3>
								<p>Despeja aproximadamente 56.300 toneladas métricas de plástico por ano nos oceanos, com quatro de seus rios entre os 20 mais poluídos do mundo.</p>
							</div>
						</article>


					</div>

					<button id="next-button">
						<img src="imagens/square-caret-right-regular-full.svg" alt="">
					</button>

				</div>

			</div>

		</section>


		<!-- consequencias da poluição marinha -->

		<section class="contents content-consequencias">

			<h3>Consequências:</h3>

			<article>

				<p>As consequências da poluição marinha são devastadoras, tanto para a fauna e flora dos oceanos como para o homem. Algumas principais são:</p>

				<ul>
					<li>Perda de biodiversidade</li>
					<li>Acúmulo de substâncias tóxicas na cadeia alimentar</li>
					<li>Efeitos sobre a saúde humana</li>
					<li>Acidificação do oceano</li>
				</ul>

			</article>


		</section>


		<!-- imagens com lixões no mar -->
		<section class="contents content-grid-images content-background">

			<article class="grid-images-article">

				<img src="imagens/poluicao1.jpg" alt="" class="images-grid vertical">
				<img src="imagens/poluicao2.jpg" alt="" class="images-grid big">
				<img src="imagens/poluicao3.png" alt="" class="images-grid big">
				<img src="imagens/poluicao4.png" alt=""
					class="images-grid horizontal"> <img
					src="imagens/poluicao12.jpg" alt="" class="images-grid horizontal">
				<img src="imagens/poluicao6.png" alt="" class="images-grid big">

				<img src="imagens/poluicao7.jpg" alt=""
					class="images-grid horizontal"> <img
					src="imagens/poluicao8.jpg" alt="" class="images-grid vertical">
				<img src="imagens/poluicao9.jpg" alt=""
					class="images-grid horizontal"> <img
					src="imagens/poluicao10.jpg" alt="" class="images-grid horizontal">
				<img src="imagens/poluicao11.jpg" alt=""
					class="images-grid horizontal">

			</article>



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
	<script src="script/carrossel.js"></script>


</body>

</html>