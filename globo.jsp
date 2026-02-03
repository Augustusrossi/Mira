<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
    
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Oceanos</title>

    <link rel="stylesheet" href="Estilos/normalize-style.css">
    <link rel="stylesheet" href="Estilos/geral-style.css">
    <link rel="stylesheet" href="Estilos/globo.css">


    <script type="importmap">{
        "imports": {
            "three": "https://cdn.jsdelivr.net/npm/three@0.161.0/build/three.module.js",
            "three/addons/": "https://cdn.jsdelivr.net/npm/three@0.161.0/examples/jsm/"
        }
    }</script>



</head>

<body>
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
						<li><a
						href="MiraController?operacao=forum&click=1&usuario=usuario"
						class="menu-links">Fórum</a></li>
					
						<li><a href="MiraController?operacao=sair" class="menu-links">Sair</a></li>

					</c:if>

                </ul>

            </div>


        </nav>

    </header>

   <main class="main main-globo row">

        <section class="contents text-intro">
            <h1>Oceanos </h1>

            <p>Transversalmente, todos os oceanos enfrentam ameaças comuns: aquecimento global, acidificação oceânica, poluição por plásticos e substâncias tóxicas, sobrepesca, pesca ilegal e perda de habitats costeiros. Muitas populações marinhas continuam em declínio, mesmo com esforços de conservação, o que reforça a necessidade de políticas globais integradas e ações locais de proteção.</p>
        </section>

        <section class="interacao-globo contents">

            <div class="buttons-nav-globo" id="divBtnOceanos">

                <button class="button-globo full-button" id="oceanoAtlantico" onclick="Rotation(0, 0)" > Oceano Atlântico</button>

                <button class="button-globo full-button" id="oceanoPacifico" onclick="Rotation(-20, 40)">Oceano Pacífico</button>

                <button class="button-globo full-button" id="oceanoArtico" onclick="Rotation(90, 180)">Oceano Ártico</button>

                <button class="button-globo full-button" id="oceanoAntartico" onclick="Rotation(-90, 180)">Oceano Antártico</button>

                <button class="button-globo full-button" id="oceanoIndico" onclick="Rotation(-20, -160)">Oceano Índico</button>

            </div>

            <div class="texts-and-globo">

                <div class="canvas-container">
                    <canvas id="meuCanvas"></canvas>
                </div>

                <div class="texts-oceanos div-disabled-js" id="texts-oceanos">
                    
                    <div class="texts text-disabled" id="textAtlantico">
                        <h1>Oceano Atlântico</h1>

                        <p><span>O Oceano Atlântico está localizado entre a América a oeste e a Europa e a África a leste, estendendo-se do Oceano Ártico do norte ao Oceano Antártico no sul. É o segundo maior oceano do mundo e banha a costa brasileira e africana.
                        </span></p>

                        <ul class="list-globo-text">
                            <li><b>Tamanho:</b> É o segundo maior oceano, cobrindo cerca de 20% da superfície da Terra.</li>
                            <li><b>Forma:</b> Tem um formato de "S" e é dividido ao meio pela linha do Equador, formando o Atlântico Norte e o Atlântico Sul. </li>
                            <li><b>Comunicação:</b> É o único oceano que se conecta com todos os outros do planeta, funcionando como um corredor de ligação da biodiversidade. </li>
                            <li><b>Geologia:</b> Possui a Dorsal Mesoatlântica, uma cadeia de montanhas submersas vulcânicas que se estende de norte a sul.</li>
                            <li><b>Hidrografia:</b> Muitos dos rios mais importantes do mundo, como o Amazonas e o Congo, deságuam no Oceano Atlântico.</li>
                        </ul>

                        <h2>Situação</h2>

                        <p><span>No Oceano Atlântico, a situação ambiental é marcada por impactos grandes e variados: aquecimento das águas superficiais e eventos de “marine heatwave” que têm aumentado em frequência e intensidade, poluição por plásticos e poluentes químicos, sobrepesca em várias frotas e degradação de habitats costeiros como manguezais e recifes. Essas pressões já provocaram mudanças na distribuição de espécies, queda de estoques pesqueiros em algumas regiões e aumento de mortalidade de certas populações marinhas.
                        </span></p>

                        <h2>Curiosidades</h2>

                        <p><span>O Atlântico abriga desde ecossistemas tropicais com grandes recifes e áreas de upwelling produtivas até regiões sub polarmente ricas em nutrientes; a circulação oceânica do Atlântico (incluindo a circulação meridional de retorno) tem papel central no clima regional e global.
                        </span></p>

                        <h3>Espécies criticamente ameaçadas ou de preocupação no Atlântico</h3>

                        <ul class="list-globo-text">
                            <li>Bacalhau em certas áreas costeiras historicamente sobreexploradas</li>
                            <li>populações vulneráveis de tartarugas (como a tartaruga-de-pente em trechos tropicais)</li>
                            <li>cetáceos que sofrem com colisões e emaranhamento em redes</li>
                            <li>rorqual-francal-do-atlântico-norte (North Atlantic right whale) tem sido amplamente documentado como crítico devido a mortalidade por colisões e emalhes</li>
                            <!-- <li><b>Hidrografia:</b> Muitos dos rios mais importantes do mundo, como o Amazonas e o Congo, deságuam no Oceano Atlântico.</li> -->
                        </ul>

                        <button class="button-globo full-button button-globo-interacao" id="globoInterativo" onclick="HabilitarGiro()">Globo Interativo</button>

                    </div>

                    <div class="texts text-disabled" id="textPacifico">
                        <h1>Oceano Pacífico</h1>

                        <p><span>O Oceano Pacífico localiza-se entre a América a leste, a Ásia e a Austrália a oeste, estendendo-se do Ártico no norte até a Antártida no sul. É o maior e mais profundo oceano da Terra, cobrindo quase um terço da superfície do planeta.</span></p>

                        <ul class="list-globo-text">
                            <li><b>Tamanho:</b> É o maior oceano da Terra, cobrindo cerca de um terço da superfície do planeta,Tem uma área de aproximadamente 180 milhões de km².</li>
                            <li><b>Forma:</b> Possui uma forma aproximadamente circular, com a Linha do Equador dividindo-o em duas áreas principais: Pacífico Norte e Pacífico Sul. </li>
                            <li><b>Comunicação:</b> É uma importante via de transporte marítimo para mercadorias e fundamental para os padrões climáticos globais.</li>
                            <li><b>Geologia:</b> As margens do Pacífico pertencem ao Círculo de Fogo do Pacífico, uma área de alta atividade vulcânica e sísmica. Tendo como ponto mais profundo do oceano a  Fossa das Marianas com mais de 11.000 metros. Além de que a  Placa do Pacífico está rodeada por outras placas tectônicas que causam terremotos e vulcões. </li>
                            <li><b>Hidrografia:</b> Sendo o oceano mais profundo da Terra. É caracterizado pela formação de tufões, tempestades circulares que podem causar inundações.</li>
                        </ul>

                        <h2>Situação</h2>

                        <p><span> No Oceano Pacífico, a situação também é grave e complexa: o Pacífico tem registrado vastas áreas com temperatura superficial anormalmente alta (incluindo “pontos quentes” e episódios associados a El Niño), acidificação crescente em áreas costeiras e de alta produtividade, poluição por microplásticos e poluentes industriais, e impactos de pesca industrial em estoques pelágicos e demersais. 

                        </span></p>

                        <h2>Curiosidades</h2>

                        <p><span>O Pacífico é o maior oceano do planeta e concentra uma enorme diversidade de ilhas e recifes, incluindo hotspots de endemismo em ilhas remotas e é palco de grandes sistemas de correntes que influenciam clima, biodiversidade e pesca (por exemplo, a Zona de Convergência do Pacífico e a circulação equatorial). </span></p>

                        <h3>Espécies criticamente ameaçadas ou de preocupação no Pacífico</h3>

                        <ul class="list-globo-text">
                            <li>vaquita (num trecho do alto Golfo da Califórnia embora seja tecnicamente um golfo ligado ao Pacífico, seu caso ilustra extinção local por pesca ilegal com redes)</li>
                            <li>várias populações de tartarugas marinhas</li>
                            <li>o tubarão-galha-branca </li>
                            <li>populações locais de baleias e golfinhos submetidas a captura acidental e perda de habitat.</li>
                        </ul>

                        <button class="button-globo full-button button-globo-interacao" id="globoInterativo" onclick="HabilitarGiro()">Globo Interativo</button>
                    </div>

                    <div class="texts text-disabled" id="textArtico">
                        <h1>Oceano Ártico</h1>

                        <p><span>A região do Ártico, definida como o Oceano Ártico e as terras ao redor, incluindo toda a Groenlândia e Spitsbergen, e as partes do norte do Alasca, Canadá, Noruega e Rússia, tem 14,5 milhões de quilômetros quadrados (5,5 milhões de milhas quadradas)</span></p>

                        <ul class="list-globo-text">
                            <li><b>Tamanho:</b> O Oceano Ártico cobre uma área de mais de 12 milhões de quilômetros quadrados, cerca de um sétimo do tamanho do Oceano Atlântico.largura</li>
                            <li><b>Comunicação:</b> O Oceano Ártico é único entre os oceanos do mundo por vários motivos. É amplamente coberto de gelo (grande parte durante todo o ano, o restante sazonalmente) e é relativamente isolado do resto dos oceanos do mundo, assim como o Mar Mediterrâneo. Acompanhe a água conforme ela entra e sai do Oceano Ártico. Se conecta com outras águas a partir do Estreito de Bering, Estreito da Dinamarca e Estreito de Fram. As águas mais profundas entram nos mares Nórdicos pelo ar através do Estreito de Fram.</li>
                            <li><b>Geologia:</b> O Oceano Ártico possui uma origem geológica complexa, com a presença de uma crosta oceânica fina e diversas placas tectônicas em constante movimento. Isso contribui para a formação de características únicas, como as calotas de gelo flutuantes e as plataformas de gelo que cobrem grande parte da região.</li>
                            <li><b>Hidrografia:</b> A hidrografia do Ártico é influenciada pela entrada de água de grandes rios e pelo derretimento do gelo. Isso resulta em águas mais frias e menos salinas na superfície, com a água mais densa, fria e salgada afundando e circulando nas camadas mais profundas.</li>
                            <li><b>Icebergs e calotas:</b> AAlém do gelo marinho flutuante, a região contém grandes geleiras terrestres, como na Groenlândia, que, ao derreterem, contribuem para o volume de água doce no oceano. Embora seja um oceano, é água sobre a qual você pode caminhar. Há blocos de gelo de 2 a 3 metros de espessura flutuando na água no Polo Norte.</li>
                        </ul>

                        <h2>Situação</h2>

                        <p><span>No Oceano Ártico, a rapidez das mudanças é uma das maiores preocupações científicas: o Ártico está perdendo gelo marinho em extensão e espessura a taxas aceleradas, o que afeta diretamente espécies dependentes de gelo, padrões de produtividade e mesmo as comunidades humanas costeiras. Esses efeitos foram documentados em relatórios recentes do IPCC e de centros especializados (por exemplo, NOAA Arctic Report Card), que apontam redução de gelo, aquecimento regional acelerado e consequente alteração de ecossistemas marinhos.
                        </span></p>

                        <h2>Curiosidades</h2>

                        <p><span>Uma característica incomum do Oceano Ártico é a existência de ilhas de água doce na água salgada circundante. Essa peculiaridade se explica pelo fato de que o gelo resultante do congelamento da água salgada se torna cada vez menos salino em sua constituição à medida que envelhece. O Estreito de Bering é banhado, ao norte, pelo Mar de Chukchi, parte do Oceano Ártico. Essa é a sua ligação com o Oceano Pacífico.</span></p>

                        <h3>Espécies criticamente ameaçadas ou de preocupação no Atlântico</h3>

                        <ul class="list-globo-text">
                            <li>Morsas</li>
                            <li>Focas </li>
                            <li>Certos mamíferos marinhos que dependem de gelo para reprodução e alimentação</li>
                            <li>rorqual-francal-do-atlântico-norte (North Atlantic right whale) tem sido amplamente documentado como crítico devido a mortalidade por colisões e emalhes</li>
                            <!-- <li><b>Hidrografia:</b> Muitos dos rios mais importantes do mundo, como o Amazonas e o Congo, deságuam no Oceano Atlântico.</li> -->
                        </ul>

                        <button class="button-globo full-button button-globo-interacao" id="globoInterativo" onclick="HabilitarGiro()">Globo Interativo</button>
                    </div>

                    <div class="texts text-disabled" id="textAntartico">
                        <h1>Oceano Antártico</h1>

                        <p><span>O oceano Glacial Antártico, também conhecido como oceano Austral, é uma vasta massa de água localizada ao sul do Círculo Polar Antártico (latitude 60º S), que envolve totalmente o continente da Antártida. Ele ocupa uma extensa área territorial, sendo o quarto maior oceano do planeta em extensão e volume.</span></p>

                        <ul class="list-globo-text">
                            <li><b>Tamanho:</b> O oceano cobre quase três quartos do nosso planeta e tem entre 20 e 30 milhas (32 -48 km) de largura</li>
                            <li><b>Forma:</b> Hoje, é o único oceano que flui ao redor do globo sem ser interrompido por terra, circundando a Antártida como um fosso, um círculo. </li>
                            <li><b>Comunicação:</b>  A Antártica é um continente regido por um tratado internacional e não pertence a nenhum país. Existem poucos portos importantes na sua costa por causa das limitadas atividades humanas. Alguns de seus portos são a Estação Rothera (Reino Unido), Villa Las Estrellas (Chile), Estação Palmer (EUA), e Estação Mawson (Austrália). </li>
                            <li><b>Geologia:</b>  O Oceano Antártico é considerado por muitos oceanógrafos como o mais jovem dos oceanos do mundo, formado há apenas 30 milhões de anos, durante a separação dos continentes da Gondwana - que foi um supercontinente que incluía os territórios atuais da América do Sul, África, Índia (na Ásia), além de Austrália e Antártica - Quando as duas placas se separaram, elas abriram a Passagem de Drake, permitindo que a Corrente Circumpolar Antártica começasse a se formar. </li>
                            <li><b>Hidrografia:</b> 
                                <ul>
                                    <li>Corrente Circumpolar Antártica: corrente complexa, a mais longa corrente oceânica do mundo, com 21.000 quilômetros. Ela transporta 130 milhões de metros cúbicos de água por segundo, mais do que qualquer um dos rios do mundo. Esta corrente de água é uma característica distintiva do Oceano Antártico, pois ajuda a manter as águas fluindo ao redor do continente da Antártica.</li>
                                    <li>Água de Fundo Antártica (AFA): Essa água fica logo acima do leito oceânico, é extremamente fria e salgada e se forma ao redor da costa da Antártida, especialmente onde há intensa formação de gelo marinho. Quando o gelo se forma, o sal é expulso, tornando a água abaixo mais densa. Essa água afunda e se espalha pelo fundo dos oceanos, funcionando como uma “bomba” que impulsiona a circulação oceânica global.</li>
                                </ul>
                            </li>
                        </ul>

                        <h2>Situação</h2>

                        <p><span>No Oceano Antártico, o cenário tem especificidades próprias: o Southern Ocean é fundamental para a regulação climática global e para cadeias tróficas polares, e a pesca dirigida ao krill (Euphausia superba) é um ponto sensível de manejo porque o krill é base alimentar para pinguins, focas e baleias; mudanças na abundância de krill, causadas por aquecimento e mudanças na circulação e gelo marinho, representam risco trófico para esses consumidores. O Southern Ocean também é foco de esforços regulatórios robustos (CCAMLR) para tentar equilibrar pesca e conservação, e existe uma discussão científica e política ativa sobre a criação e efetividade de Áreas Marinhas Protegidas. </span></p>

                        <h2>Curiosidades</h2>

                        <p><span>O Muitas espécies antárticas são altamente adaptadas ao frio extremo (ex.: alguns peixes com proteínas anticongelantes) e a região tem papel crítico na absorção de CO₂.</span></p>

                        <h3>Espécies criticamente ameaçadas ou de preocupação no Atlântico</h3>

                        <ul class="list-globo-text">
                            <li>pinguins-imperador</li>
                            <li>Krills</li>
                            <li>certas populações locais afetadas por perda de gelo e mudanças em cadeias alimentares;</li>
                        </ul>

                        <h2></h2>

                        <button class="button-globo full-button button-globo-interacao" id="globoInterativo" onclick="HabilitarGiro()">Globo Interativo</button>
                    </div>

                    <div class="texts text-disabled"  id="textIndico">
                        <h1>Oceano Índico</h1>

                        <p><span>O Oceano Índico está localizado principalmente no Hemisfério Oriental, entre os continentes da África, Ásia e Oceania. É o terceiro maior oceano do mundo.
                        </span></p>

                        <ul class="list-globo-text">
                            <li><b>Tamanho:</b> Cobre uma área de aproximadamente 70 a 73 milhões de km², o que representa cerca de 20% da superfície marítima da Terra.</li>
                            <li><b>Forma:</b>  Sua configuração geométrica assemelha-se a um trapézio ou, para alguns, a um triângulo, com o vértice ao norte, onde é fechado pela Ásia. Sua maior largura (cerca de 10.000 km) se dá no hemisfério sul, entre a África e a Austrália. </li>
                            <li><b>Comunicação:</b> É uma via comercial vital para o transporte de petróleo e gás. Pontos importantes de navegação incluem o Canal de Suez, o Estreito de Bab el-Mandeb, o Estreito de Ormuz e o Estreito de Malaca.</li>
                            <li><b>Geologia:</b> O oceano Índico começou a se formar há cerca de 120 milhões de anos, a partir do movimento das placas tectônicas após a separação do antigo supercontinente Gondwana.Sua geologia é bastante ativa, com falhas e dorsais oceânicas, o que causa sismos e atividades vulcânicas.O fundo oceânico é marcado por diversas cordilheiras, como a Dorsal Central Indiana e a Dorsal Sudoeste Indiana. </li>
                            <li><b>Hidrografia:</b> 
                                <ul>
                                    <li>Correntes marítimas: As correntes são influenciadas por ventos monçônicos, que mudam de direção sazonalmente.</li>
                                    <li>Corrente de Agulhas: Uma corrente quente e intensa que flui ao longo da costa leste da África e pode influenciar as correntes do Atlântico.</li>
                                    <li>Corrente Equatorial do Norte e do Sul: Movimentam-se de leste para oeste em latitudes diferentes.</li>
                                </ul>
                            </li>
                        </ul>

                        <h2>Situação</h2>

                        <p><span>No Oceano Índico, o ambiente marinho sofre pressão intensa por urbanização costeira, degradação de manguezais e recifes coralinos, despejo de efluentes e poluição e por impactos de pesca excessiva em áreas tropicais densamente povoadas. O Índico é particularmente sensível porque muitas das suas zonas costeiras são densamente povoadas e socioeconomicamente dependentes de recursos marinhos; além disso, o aquecimento e o branqueamento de corais impactam fortemente recifes tropicais que sustentam pesca e turismo. </span></p>

                        <h2>Curiosidades</h2>

                        <p><span>O Oceano Índico contém importantes hotspots de biodiversidade ao redor de arquipélagos e bacias coralinas, e sua dinâmica monçônica influência produtividade costeira e padrões de pesca.A profundidade média é de cerca de 3.741 metros. O ponto mais profundo, com aproximadamente 7.192 metros, é a Fossa de Java, localizada na Indonésia.</span></p>

                        <h3>Espécies criticamente ameaçadas ou de preocupação no Índico</h3>

                        <ul class="list-globo-text">
                            <li>incluem dugongos em áreas como o Golfo de Mannar</li>
                            <li>populações de tartarugas (hawksbill e verde)</li>
                            <li>tubarões </li>
                            <li>tubarão-baleia em certas partes do oceano</li>
                        </ul>

                        <button class="button-globo full-button button-globo-interacao" id="globoInterativo" onclick="HabilitarGiro()">Globo Interativo</button>
                    </div>

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
            <span class="footer-icon-instagram icon icon social-icon">
                <a href="#" class="link-icon"><i class="fa-brands fa-instagram"></i></a>
            </span>
            <span class="footer-icon-facebook icon icon social-icon">
                <a href="#" class="link-icon"><i class="fa-brands fa-facebook-f"></i></a>
            </span>
        </div>

    </footer>
    <script type="module" src="script/globo.js"></script>
    <script src="script/main.js"></script>
</body>

</html>