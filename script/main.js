const btnMenu = document.getElementById("button-menu")
const menu = document.getElementById("lista-menu")
const divbtnMenu = document.getElementById("divBtnMenu")

let _opened = false;


btnMenu.classList.add("hamburguer-button-js-enabled")
divbtnMenu.classList.add("div-hamburguer-button-js-enabled")
btnMenu.setAttribute("aria-expanded", "false")
menu.setAttribute("aria-hidden", "true")
divbtnMenu.classList.add("menu-closed")

btnMenu.addEventListener("click", openOrClose)

function openOrClose(){
   if(!_opened){
      openMenu()
   } else {
      closeMenu()
   }
}

function openMenu(){

   let expanded = btnMenu.getAttribute("aria-expanded") === "true" ? true : false

   if (expanded) {
      menu.classList.add("menu-closed")
      divbtnMenu.classList.add("menu-closed")
   } else{
      menu.classList.remove("menu-closed")
      divbtnMenu.classList.remove("menu-closed")
   }

   btnMenu.setAttribute("aria-expanded", !expanded)
   menu.setAttribute("aria-hidden", expanded)

}


function closeMenu() {
   _opened = false;
}