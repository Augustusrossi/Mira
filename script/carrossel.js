// carrossel poluição

const slider = document.querySelectorAll('.carrossel-item');
const btnPrev = document.getElementById('prev-button');
const btnNext = document.getElementById('next-button');


let currentSlide = 0;

function hideSlide() {
    slider.forEach(item => item.classList.remove('on')) 
}

function showSlider() {
    slider[currentSlide].classList.add('on');
}




function nextSlide() {

    hideSlide();
    if (currentSlide == slider.length - 1) {
        currentSlide = 0;
    } else{
        currentSlide++;
    }

    showSlider();

}

function prevSlide() {

    hideSlide();
    if (currentSlide == 0) {
        currentSlide = slider.length - 1;
    } else{
        currentSlide--;
    }

    showSlider();

}


btnNext.addEventListener('click', nextSlide);
btnPrev.addEventListener('click', prevSlide);


//carrossel animais em risco



