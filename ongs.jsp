<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
    
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ONGs</title>

    <script src="https://kit.fontawesome.com/8b73dcbc73.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="Estilos/normalize-style.css">
    <link rel="stylesheet" href="Estilos/geral-style.css">
    <link rel="stylesheet" href="Estilos/ongs-style.css">  


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap" rel="stylesheet">


</head>

<body class="row">
    <header class="header">

        <nav class="header-principal-nav">

            <div class="header-principal-nav-auxiliar">

                <div class="header-logo">
                    <a href="MiraController?operacao=index&click=1&usuario=usuario" class="menu-links">
                        <img src="Union.svg" alt="" class="header-logo-img">
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
						href="MiraController?operacao=poluicao&click=1&usuario=usuario"
						class="menu-links">Poluição Marinha</a></li>
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
						<li><a href="MiraController?operacao=forum&click=1&usuario=usuario"
						class="menu-links">Fórum</a></li>
					
						<li><a href="MiraController?operacao=sair" class="menu-links">Sair</a></li>

					</c:if>

				</ul>

            </div>


        </nav>

    </header>

    <main class="main main-sub row">

        <h2>ONGs</h2>

        <section class="content">

            <button id="prev-button" class="btnCarrossel"><span class="prev"> <i class="fa-solid fa-arrow-left"></i> </span></button>

            <section class="ongs-carrossel">

                <div class="container-images">
            
                    <article class="carrossel-item on">

                        <div class="info-ong">
                            <div class="img-ong">
                                <img src="imagens/IBJ.png" alt="logo-ong">
                            </div>

                            <div class="text-ong">
                                <h2>Instituto Baleia Jubarte (Brasil):</h2>
                                <p>Criado em 1988, o instituto é voltado à pesquisa e conservação das baleias jubarte e de outros mamíferos marinhos. Atua com monitoramento, educação ambiental e turismo sustentável na costa brasileira, especialmente na Bahia e no Espírito Santo.</p>
                            </div>

                        </div>

                        <div class="mapa-ong">
                        	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3523.968128244477!2d-38.00989552535437!3d-12.574888551957828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x71655131f57fd73%3A0xf5c29f8bc375cfd7!2sEspa%C3%A7o%20Baleia%20Jubarte%20Praia%20do%20Forte!5e1!3m2!1spt-BR!2sbr!4v1761144136011!5m2!1spt-BR!2sbr" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>    
                        </div>

                    </article>

                    <article class="carrossel-item">

                        <div class="info-ong">
                            <div class="img-ong">
                                <img src="imagens/logo -tamar.png" alt="logo-ong">
                            </div>

                            <div class="text-ong">
                                <h2>Projeto Tamar:</h2>
                                <p>Atua no litoral brasileiro desde a década de 80 com a missão de promover a recuperação das tartarugas marinhas, através de ações de pesquisa, conservação e inclusão social. </p>
                               </p> É uma entidade de direito privado, sem fins lucrativos e co-executora do PAN - Plano Nacional de Ação para a Conservação das Tartarugas Marinhas no Brasil do ICMBio/MMA, sendo responsável por grande parte das ações previstas.</p>
                               </p> Está presente em 23 localidades distribuídas em oito estados brasileiros, entre zonas costeiras e ilhas oceânicas: Rio Grande do Norte, Pernambuco, Sergipe, Bahia, Espírito Santo, Rio de Janeiro, São Paulo e Santa Catarina. </p>
                               </p> Desenvolve ações de pesquisa, manejo e proteção das cinco espécies de tartarugas marinhas que ocorrem no Brasil, além de atividades de envolvimento comunitário, inclusão social, sensibilização e educação ambiental, valorização da cultura local e geração de oportunidades de trabalho e renda.</p>
                               </p> Como resultado desse esforço contínuo vem obtendo conquistas importantes: recuperação das populações comprovada; ampliação do conhecimento científico; apoio das comunidades litorâneas que cessaram o uso direto das tartarugas passando a protegê-las; sensibilização e apoio da sociedade em geral e a geração de recursos próprios (sustentabilidade). </p>
                            </div>

                        </div>

                        <div class="mapa-ong">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6763324.071990449!2d-50.96622075744788!3d-23.844342320835704!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cd53d17647d45b%3A0x747d09c57758e2dd!2sFunda%C3%A7%C3%A3o%20Projeto%20Tamar%20-%20Ubatuba!5e1!3m2!1spt-BR!2sbr!4v1758203795236!5m2!1spt-BR!2sbr" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>

                    </article>

                    
                </div>

            
            </section>

            <button id="next-button" class="btnCarrossel"><span class="next"><i class="fa-solid fa-arrow-right"></i></span></button>


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


    <script src="script/carrossel.js"></script>
    <script src="script/main.js"></script>
</body>

</html>