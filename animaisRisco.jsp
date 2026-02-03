<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Animais em Risco</title>

        <script src="https://kit.fontawesome.com/8b73dcbc73.js" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="Estilos/normalize-style.css"> 
        <link rel="stylesheet" href="Estilos/geral-style.css">
        <link rel="stylesheet" href="Estilos/animaisRisco-style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200..900&display=swap" rel="stylesheet">
    </head>


    <body class="body">

        <header class="header">
            <span class="retangulo-detalhe"></span>

            <nav class="header-principal-nav">

                <div class="header-principal-nav-auxiliar">

                    <div class="header-logo">
                        
                        <a href="MiraController?operacao=index&click=1&usuario=usuario" class="menu-links">
                            <img src="imagens/Union.svg" alt="" class="header-logo-img">
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
							href="MiraController?operacao=ongs&click=1&usuario=usuario"
							class="menu-links">ONGs</a></li>
						<li><a
							href="MiraController?operacao=globo&click=1&usuario=usuario"
							class="menu-links">Oceanos</a></li>
						<li><a
							href="MiraController?operacao=poluicao&click=1&usuario=usuario"
							class="menu-links">Poluição Marinha</a></li>
						


						<c:if test="${usuario == 'adminwinx' && senha == 'winx2024'}">
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

			<main class="main main-princi"> 

	            <h1 class="subcontainer-text-about-tittle">Animais em Risco</h1>
	
	            <section class="contents">
	
	
	                <div>
	
	                    <h2>Biodiversidade</h2>
	
	                    <div class="conteudo-texts">
	                        <h3>O que é biodiversidade marinha?</h3>
	
	                        <p class="content-intro-text">A biodiversidade marinha se refere à uma diversidade de vida que habita os oceanos, mares e zonas costeiras. Ela inclui tudo, desde pequenos microrganismos até os maiores mamíferos marinhos, como baleias e a vasta gama de ecossistemas, como recifes de coral, manguezais, e fundos marinhos. </p>
	
	                    </div>
	
	                    <div class="conteudo-texts">
	
	                        <h3>Qual a sua importância?</h3>
	                        
	                        <p class="content-intro-text">A biodiversidade desempenha um papel crucial na saúde dos ecossistemas oceânicos e, consequentemente, na sobrevivência humana. Fornecendo alimentos e ajudando na regulação do clima, além de sustentar a economia global.</p>
	                            
	                        <p class="content-intro-text">Os oceanos cobrem cerca de 71% da superfície terrestre e abrigam uma imensa diversidade de seres vivos. A partir disso,  os ecossistemas marinhos fornecem serviços ecossistêmicos vitais, como a produção de oxigênio, a absorção do dióxido de carbono emitido na atmosfera, a purificação da água e a proteção contra desastres naturais, como tsunamis e furacões. Da mesma forma, as florestas de algas e os recifes de corais funcionam como importantes sumidouros de carbono, ajudando a manter o equilíbrio da temperatura global.</p>
	
	                        <p class="content-intro-text">A biodiversidade marinha contribui também para a economia global com a pesca, por exemplo, que é uma fonte primária de proteína para bilhões de pessoas ao redor do mundo. De acordo com a FAO (Organização das Nações Unidas para a Alimentação e a Agricultura), cerca de 3 bilhões de pessoas dependem da biodiversidade marinha para sua alimentação e subsistência, a diversidade de espécies marinhas é fundamental para a resiliência dos estoques pesqueiros. A perda dessa biodiversidade marinha pode levar à diminuição de espécies-chave, afetando a segurança alimentar de diversas populações. Além dessa atividade, há o turismo costeiro e marinho que movimenta bilhões de dólares anualmente.</p>
	
	                    </div>
	
	                    <div class="conteudo-texts">
	
	                        <h3>Ameaças à Biodiversidade Marinha</h3>
	                        
	                        <p class="content-intro-text">A biodiversidade marinha enfrenta diversas ameaças, muitas das quais são causadas por atividades humanas. Entre as principais ameaças, veremos a seguir a poluição, a pesca excessiva, as mudanças climáticas e a destruição de habitats </p>
	
	                        <div class="cards-biodiversidade-ameacas">
	                            <article class="item-card-biodiversidade">
	                                <p class="item-card-biodiversidade-text"><b>Poluição Marinha:</b> A poluição dos oceanos é uma das maiores ameaças que os oceanos enfrentam. O plástico é um dos poluentes mais comuns, com cerca de 8 milhões de toneladas sendo descartadas nos oceanos a cada ano, segundo a ONU. Essa poluição causa a morte de milhões de animais marinhos anualmente, incluindo peixes, tartarugas e aves marinhas, que confundem o plástico com alimento. Além disso, os produtos químicos e os nutrientes excessivos provenientes de atividades agrícolas e industriais contribuem para a eutrofização, resultando em zonas mortas nos oceanos, onde a vida aquática não consegue sobreviver. A poluição, além de afetar os animais, coloca em risco a saúde de nós humanos.</p>
	                            </article>
	                            <article class="item-card-biodiversidade">
	                                <p class="item-card-biodiversidade-text"><b>Pesca Excessiva:</b> A pesca excessiva é outra ameaça significativa.Com a tecnologia moderna, estamos capturando mais peixes do que os oceanos conseguem repor, fazendo com que ela esgote as populações de peixes em níveis insustentáveis, perturbando o equilíbrio dos ecossistemas marinhos. Quando certas espécies são retiradas em grande número, toda a cadeia alimentar é afetada, o que pode levar à extinção de espécies e à perda de habitats essenciais. De acordo com a WWF (World Wide Fund for Nature), cerca de 90% dos estoques pesqueiros globais estão sobre-explorados ou completamente esgotados, uma situação alarmante que exige ação imediata.</p>
	                            </article>
	                            <article class="item-card-biodiversidade">
	                                <p class="item-card-biodiversidade-text"><b>Mudanças Climáticas:</b> As mudanças climáticas estão provocando efeitos devastadores sobre a biodiversidade marinha. O aumento da temperatura dos oceanos afeta diretamente a vida marinha, causando o branqueamento dos corais e a perda de habitats críticos. Além disso, o aquecimento global está contribuindo para a acidificação dos oceanos, o que prejudica a capacidade de organismos como corais e moluscos de construir suas conchas e esqueletos calcários. A elevação do nível do mar também ameaça habitats costeiros, como manguezais e estuários, que são berçários vitais para muitas espécies marinhas.</p>
	                            </article>
	
	                            <article class="item-card-biodiversidade">
	                                <p class="item-card-biodiversidade-text"><b>Destruição de Habitats:</b> A destruição de habitats marinhos, causada principalmente pela urbanização costeira, pela mineração submarina e pela prática de pesca com técnicas destrutivas, como o arrasto de fundo, tem um impacto devastador na biodiversidade. Os recifes de corais, que abrigam cerca de 25% de toda a vida marinha, estão entre os ecossistemas mais ameaçados. A perda desses habitats não só reduz a biodiversidade, mas também compromete os serviços ecossistêmicos essenciais que eles fornecem.</p>
	                            </article>
	
	                        </div>
	
	                    </div>
	
	                    <div class="conteudo-texts">
	
	                        <h3>Conservação da Biodiversidade Marinha</h3>
	                        
	                        <p class="content-intro-text">Para proteger a biodiversidade marinha, é necessário realizar ações locais, nacionais e globais. As áreas marinhas protegidas (AMPs) já têm desempenhado um papel crucial na conservação dos ecossistemas marinhos. Essas áreas, onde atividades humanas são restringidas ou proibidas, permitem que os ecossistemas marinhos se recuperem. De acordo com a ONU, atualmente, cerca de 7,5% dos oceanos estão sob alguma forma de proteção, mas os especialistas defendem que esse percentual deveria ser muito maior, em torno de 30%, para garantir a saúde dos oceanos a longo prazo. </p>
	
	                        <p class="content-intro-text"><b>Pesca Sustentável:</b> AA pesca sustentável também é uma estratégia vital para preservar a biodiversidade marinha. Isso inclui a implementação de cotas de captura baseadas em dados científicos, a proibição de técnicas de pesca destrutivas e o combate à pesca ilegal. Incentivar a pesca artesanal e o consumo consciente de frutos do mar são passos importantes nesse processo.</p>
	
	                        <p class="content-intro-text"><b>Redução da Poluição Marinha:</b> Além disso, a redução da poluição marinha é essencial para a conservação da vida nos oceanos. Isso inclui iniciativas para reduzir o uso de plásticos descartáveis, melhorar a gestão de resíduos e tratar efluentes industriais antes que eles entrem nos oceanos. A conscientização pública também desempenha um papel importante, pois consumidores e empresas precisam entender o impacto de suas ações nos ecossistemas marinhos.</p>
	
	                        <p class="content-intro-text">Tendo visto todas essas informações, conclui-se que a biodiversidade marinha é um componente vital do nosso planeta, e influencia desde o clima global até a alimentação de muitas populações. No entanto, enfrenta ameaças significativas que requerem ação imediata e juntos é possível fazer a diferença. Ao promover a conservação de áreas marinhas, podemos ajudar a preservar a rica biodiversidade que nossos oceanos têm a oferecer.</p>
	
	                    </div>
	                    
	
	                    
	                </div>
	
	
	            </section>
	
	            <section class=" contents main-subtitle">
	                <h2>Animais com <b>muito</b> risco de extinsão:</h2>
	
	                <section class="content-carrossel">
	                    <button onclick="anterior(this)" class="btnCarrossel"><span class="prev"> <i class="fa-solid fa-arrow-left"></i> </span></button>
	                    
	                    <div class="carousel-container">
	            
	                        <div class="carousel-track container" id="carousel-track">
	                        
		                        <c:if test="${not empty animaisMuitoRisco}">
								    <c:forEach var="animais" items="${animaisMuitoRisco}">
		                            
			                            <div class="card-container">
			                                <div class="card-item">
			                                    <div class="card_front">
			
			                                        <img src="<%= request.getContextPath()%>/${animais.image}" alt="">
			
			                                        <div class="card-texts">
			                                            <p><b>Nome comum: ${animais.nomeComum}</b></p>
			                                            <p><i>Nome científico: ${animais.nomeCientifico}</i></p>
			                                        </div>
			                                    </div>
			                                    <div class="card_back">
			                                        <ul class="list-card-back">
			                                            <li>Habitat: ${animais.habitat}</li>
			                                            <li>Local: ${animais.local}</li>
			                                            <li>Risco: ${animais.risco}</li>
			                                            <li>População: ${animais.populacao}</li>
			                                            <li>Curiosidade: ${animais.curiosidade}</li>
			                                        </ul>
			                                    </div>
			                                </div> 
			                            </div>
			                        </c:forEach>
								</c:if>
								<c:if test="${empty animaisMuitoRisco}">
								    <p>Nenhum animal com muito risco cadastrado ainda.</p>
								</c:if>
	   
	                        </div>
	                        
	                    </div>
	
	                    <button onclick="proximo(this)" class="btnCarrossel"><span class="next"><i class="fa-solid fa-arrow-right"></i></span></button>
	                </section>
				
					<section class=" contents main-subtitle">
		                <h2>Animais com <b>pouco</b> risco de extinsão:</h2>
		
		                <section class="content-carrossel">
		                    <button onclick="anterior(this)" class="btnCarrossel"><span class="prev"> <i class="fa-solid fa-arrow-left"></i> </span></button>
		                    
		                    <div class="carousel-container">
		            
		                        <div class="carousel-track container" id="carousel-track">
		                        
			                        <c:if test="${not empty animaisPoucoRisco}">
									    <c:forEach var="animais" items="${animaisPoucoRisco}">
			                            
				                            <div class="card-container">
				                                <div class="card-item">
				                                    <div class="card_front">
				
				                                        <img src="<%= request.getContextPath()%>/${animais.image}" alt="">
				
				                                        <div class="card-texts">
				                                            <p><b>Nome comum: ${animais.nomeComum}</b></p>
				                                            <p><i>Nome científico: ${animais.nomeCientifico}</i></p>
				                                        </div>
				                                    </div>
				                                    <div class="card_back">
				                                        <ul class="list-card-back">
				                                            <li>Habitat: ${animais.habitat}</li>
				                                            <li>Local: ${animais.local}</li>
				                                            <li>Risco: ${animais.risco}</li>
				                                            <li>População: ${animais.populacao}</li>
				                                            <li>Curiosidade: ${animais.curiosidade}</li>
				                                        </ul>
				                                    </div>
				                                </div> 
				                            </div>
				                        </c:forEach>
									</c:if>
									<c:if test="${empty animaisPoucoRisco}">
									    <p>Nenhum animal com muito pouco cadastrado ainda.</p>
									</c:if>
		   
		                        </div>
		                        
		                    </div>
		
		                    <button onclick="proximo(this)" class="btnCarrossel"><span class="next"><i class="fa-solid fa-arrow-right"></i></span></button>
		                </section>
					</section>
					
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
                <span class="footer-icon-instagram icon icon social-icon">
                    <a href="#" class="link-icon"><i class="fa-brands fa-instagram"></i></a>
                </span>
                <span class="footer-icon-facebook icon icon social-icon">
                    <a href="#" class="link-icon"><i class="fa-brands fa-facebook-f"></i></a>
                </span>
            </div>

        </footer>

        <script src="script/main.js"></script>
        <script src="script/carrosselBase.js"></script>

    </body>

</html>