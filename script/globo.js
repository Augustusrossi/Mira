import * as THREE from "three";
import { OrbitControls } from 'three/addons/controls/OrbitControls.js'; // Corrigido

const canvasDOM = document.getElementById("meuCanvas");

const renderer = new THREE.WebGLRenderer({
    canvas: canvasDOM,
    antialias: true,
    alpha: true
});


function updateSize() {

    const windowWidth = canvasDOM.clientWidth;
    const windowHeight = canvasDOM.clientHeight;
    renderer.setPixelRatio(window.devicePixelRatio);

    renderer.setSize(windowWidth, windowHeight, false);

    camera.aspect = windowWidth / windowHeight;
    camera.updateProjectionMatrix();

    renderer.render(cena, camera);
}

const campoVisao = 75;
const aspecto = canvasDOM.clientWidth / canvasDOM.clientHeight;
const perto = .1;
const longe = 10;
const camera = new THREE.PerspectiveCamera(campoVisao, aspecto, perto, longe)
camera.position.z = 4;

const cena = new THREE.Scene();


//detalhes
renderer.shadowMap.enabled = true;


const geo = new THREE.SphereGeometry(2, 100, 100);
const textLoader = new THREE.TextureLoader();
const textura = textLoader.load('imagens/oceanos.jpg');

//forma geométrica
const material = new THREE.MeshStandardMaterial({
    map: textura
})
const mesh = new THREE.Mesh(geo, material)
cena.add(mesh);

const wireframe = new THREE.MeshBasicMaterial({
    color: 0xccccff,
    wireframe: true,
});

const wireframeMesh = new THREE.Mesh(geo, wireframe);
// mesh.add(wireframeMesh);


//luzes:
const luzes = new THREE.HemisphereLight(0xffffff)
cena.add(luzes);


const luzDirecionada = new THREE.DirectionalLight(0xffffff, 3);
luzDirecionada.position.set(5, 9, 5);
luzDirecionada.castShadow = true;
luzDirecionada.shadow.mapSize.width = 2048;
luzDirecionada.shadow.mapSize.height = 2048;
cena.add(luzDirecionada);


//sombra
mesh.castShadow = true;

//chão para sombra
const chaoForma = new THREE.CircleGeometry(1000);
const chaoMaterial = new THREE.MeshStandardMaterial({
    color: 0xECF8FB,
    roughness: .8,
    transparent: true,
    opacity: .1
});

const chao = new THREE.Mesh(chaoForma, chaoMaterial);
chao.rotation.x = -Math.PI / 2;
chao.position.y = -2;
// chao.position.z =  2;
chao.receiveShadow = true;
cena.add(chao);

// let rotationX = 0;
// let rotationY = 0;
// const multRotation = 0.05;

function rotateToWithAnimation(x, y) {
    console.log(x, y);

    mesh.rotation.x = THREE.MathUtils.degToRad(x);
    mesh.rotation.y = THREE.MathUtils.degToRad(y);
}



// const resizeObserver = new ResizeObserver(updateSize);
// resizeObserver.observe(canvasDOM);


//-----------------------------

//Botões de oceanos e seus respectivos textos


var textPacifico = document.getElementById("textPacifico");
var textArtico = document.getElementById("textArtico");
var textAntartico = document.getElementById("textAntartico");
var textIndico = document.getElementById("textIndico");


const divBotoes = document.getElementById("divBtnOceanos")
const divTextOceanos = document.getElementById("texts-oceanos");

const botaoControle = document.getElementById("globoInterativo");


divBotoes.addEventListener('click', openTexts);


function openTexts(event) {

    if (event.target.tagName === 'BUTTON') {

        const botaoClicado = event.target;
        console.log('Botão clicado:', botaoClicado.id || botaoClicado.textContent);

        divTextOceanos.classList.add("div-disabled-js")

        textPacifico.classList.add("text-closed");
        textArtico.classList.add("text-closed");
        textAntartico.classList.add("text-closed");
        textIndico.classList.add("text-closed");
        textAtlantico.classList.add("text-closed");


        let globoDisabled = false;
        controleGlobo(globoDisabled);



        if (botaoClicado.id == 'oceanoAtlantico') {
            // rotateToWithAnimation(15, -45)
            divTextOceanos.classList.remove("div-disabled-js")
            textAtlantico.classList.remove("text-closed");



        } else if (botaoClicado.id == 'oceanoPacifico') {
            divTextOceanos.classList.remove("div-disabled-js")
            textPacifico.classList.remove("text-closed");


        } else if (botaoClicado.id == 'oceanoArtico') {
            divTextOceanos.classList.remove("div-disabled-js")
            textArtico.classList.remove("text-closed");


        } else if (botaoClicado.id == 'oceanoAntartico') {
            divTextOceanos.classList.remove("div-disabled-js")
            textAntartico.classList.remove("text-closed");


        } else if (botaoClicado.id == 'oceanoIndico') {
            divTextOceanos.classList.remove("div-disabled-js")
            textIndico.classList.remove("text-closed");

        }

    }

setTimeout(() => {
        const textoAberto = document.querySelector('.texts:not(.text-closed)');
        if (textoAberto) {
            textoAberto.scrollIntoView({ behavior: 'smooth', block: 'start' });
            window.scrollBy(0, -80);
        }
     }, 200);

}

 


// controle globo
const controls = new OrbitControls(camera, canvasDOM);
controls.enableDamping = true;
controls.dampingFactor = 0.05;

let globoHabilitado = true;

function controleGlobo(globoHabilitado) {
    if (globoHabilitado) {
        controls.update()
    } else {
        controls.enabled = false;
        console.log(0);
    }
}

function habilitarGiro() {

    openTexts = function () { };
    divTextOceanos.classList.add("div-disabled-js");


    globoHabilitado = true;
    controls.enabled = true;
    controleGlobo(globoHabilitado);



    console.log("Giro do globo habilitado");

}


//--------------------------------------------------



function animate(t = 0) {
    requestAnimationFrame(animate);
    //mesh.rotation.y = t * 0.0001;
    //mesh.rotation.y = t / 100
    //mesh.rotation.z = t / 100
    // mesh.rotation.y += (rotationY - mesh.rotationY) *multRotation
    // mesh.rotation.x += (rotationX - mesh.rotationX) * multRotation;
    controleGlobo(globoHabilitado);
    renderer.render(cena, camera)
}

animate();
updateSize();

window.Rotation = rotateToWithAnimation; // ou rotateToWithAnimation para versão com animação
window.HabilitarGiro = habilitarGiro; // para habilitar o giro do globo

window.addEventListener("resize", updateSize);


