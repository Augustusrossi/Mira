const carrossel = document.getElementById('carousel-track'); 
const cards = document.querySelectorAll('.card-item');    
const cardsPorTela = 4;                                  
let indiceAtual = 0;                                      

function atualizarCarrossel(carrosselTrack, indiceAtual, cardsPorTela) {

    const cards = carrosselTrack.querySelectorAll('.card-container');
    const container = carrosselTrack.parentElement;
    const containerWidth = container.offsetWidth;
    
    // Calcula a largura visível por card (incluindo gap)
    const larguraCard = containerWidth / cardsPorTela;


    carrosselTrack.style.transform = `translateX(-${indiceAtual * larguraCard}px)`; // Move os cards para mostrar o grupo correto
}
function proximo(btn) {

    const carrosselTrack = btn.parentElement.querySelector('.carousel-track');
    const cards = carrosselTrack.querySelectorAll('.card-item');
    const cardsPorTela = calcularCardsPorTela();
    let indiceAtual = parseInt(carrosselTrack.getAttribute('data-indice')) || 0;
    const maxIndice = Math.max(cards.length - cardsPorTela, 0);



    if (indiceAtual < maxIndice) {
        indiceAtual++;
        
    } else {
        indiceAtual = 0;
        
    }
    carrosselTrack.setAttribute('data-indice', indiceAtual);
    atualizarCarrossel(carrosselTrack, indiceAtual, cardsPorTela);
}


function anterior(btn) {
    const carrosselTrack = btn.parentElement.querySelector('.carousel-track');
    const cards = carrosselTrack.querySelectorAll('.card-item');
    const cardsPorTela = calcularCardsPorTela();
    let indiceAtual = parseInt(carrosselTrack.getAttribute('data-indice')) || 0;
    const maxIndice = Math.max(cards.length - cardsPorTela, 0);



    if (indiceAtual < maxIndice) {
        indiceAtual--;
        
    } else {
        indiceAtual = 0;
        
    }
    carrosselTrack.setAttribute('data-indice', indiceAtual);
    atualizarCarrossel(carrosselTrack, indiceAtual, cardsPorTela);
}

function calcularCardsPorTela() {
    const larguraTela = window.innerWidth;
    
    if (larguraTela <= 720) { // 45em ≈ 720px
        return 2;
    } else if (larguraTela <= 1454) { // 90.875em ≈ 1454px
        return 3;
    } else {
        return 4;
    }
}


window.addEventListener('resize', function() {
    const carrosselTrack = document.getElementById('carousel-track');
    const indiceAtual = parseInt(carrosselTrack.getAttribute('data-indice')) || 0;
    const cardsPorTela = calcularCardsPorTela();
    
    atualizarCarrossel(carrosselTrack, indiceAtual, cardsPorTela);
});

// Inicialize o carrossel quando a página carregar
window.addEventListener('load', function() {
    const carrosselTrack = document.getElementById('carousel-track');
    carrosselTrack.setAttribute('data-indice', 0);
    atualizarCarrossel(carrosselTrack, 0, calcularCardsPorTela());
});