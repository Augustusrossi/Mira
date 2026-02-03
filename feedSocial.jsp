<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
<meta charset="UTF-8">

<title>Forum</title>

<link rel="stylesheet" href="Estilos/normalize-style.css">
<link rel="stylesheet" href="Estilos/geral-style.css">
<link rel="stylesheet" href="Estilos/feedForum.css">

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

		<section class="feedSoccial">

			<div class="feedSoccial-nav">

				<button class="full-button">Para ti</button>
				<a href="forum.jsp"><button class="full-button">Postar</button></a>


			</div>


			<div class="feedSoccial-postagens">

				<c:forEach var="posts" items="${posts}">

					<div class="postagem">

						<div class="postagem-cabecalho">

							<a
								href="MiraController?operacao=perfil&click=1&usuario=${posts.user.usuario}">

								<div class="postagem-usuario-info">

									<c:choose>
										<c:when test="${not empty imagemPerfil}">
											<img src="<%= request.getContextPath() %>/${imagemPerfil}"
												alt="Foto do Usuário" class="postagem-usuario-foto">
										</c:when>
										<c:otherwise>
											<img
												src="<%=request.getContextPath()%>/images/icon-img.png"
												alt="Foto Padrão" class="postagem-usuario-foto">
										</c:otherwise>
									</c:choose>
									<span class="postagem-usuario-nome">${posts.user.usuario}</span>
								</div>
							</a>
						</div>
						<div class="postagem-conteudo">
							<img src="${posts.img}" alt="Imagem da Postagem"
								class="postagem-imagem">
							<p>${posts.descricao}</p>

						</div>
						<div class="postagem-interacoes">

							<!--  verificar se a pessoa já curtiu -->

							<c:forEach var="curtidor" items="${posts.getCurtidoPor()}">

								<c:set var="jaCurtiu" value="false" />

								<c:if test="${usuario == curtidor.getUsuario()}">

									<c:set var="jaCurtiu" value="true" />

								</c:if>

							</c:forEach>



							<!-- Verificação para definir o botão  -->
							<c:choose>

								<c:when test="${jaCurtiu}">


									<button
										onclick="window.location.href='MiraController?operacao=descurtir&postId=${posts.id}&usuarioPerfil=${posts.user.usuario}&pagina=2'"
										class="postagem-like-button">
										<i class="fa-solid fa-thumbs-up"></i>${posts.curtidoPor.size()}
									</button>

								</c:when>

								<c:otherwise>


									<button
										onclick="window.location.href='MiraController?operacao=curtir&postId=${posts.id}&usuarioPerfil=${posts.user.usuario}&pagina=2'"
										class="postagem-like-button">
										<i class="fa-solid fa-thumbs-up"></i>${posts.curtidoPor.size()}
									</button>


								</c:otherwise>


							</c:choose>

						</div>
					</div>

				</c:forEach>

			</div>

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


	<script src="script/main.js"></script>
</body>

</html>