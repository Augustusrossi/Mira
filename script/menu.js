// function Menu(config){
//     this.nav = ( typeof config.container === 'string') ? document.querySelector(config.container) : config.container
    
//     this.btnOpen = ( typeof config.toggleBtn === 'string') ? document.querySelector(config.toggleBtn) : config.toggleBtn
    
//     this.btnClose = ( typeof config.toggleBtnClose === 'string') ? document.querySelector(config.toggleBtnClose) : config.toggleBtnClose
    
//     this.maxWidth = config.widthEnabled || false;

//     var $nav_menu = document.querySelector('nav-menu-links')


//     var _opened = false;
//     var _this = this;
    
//     this.btnOpen.removeAttribute('style')
//     closeMenu()
    

    
//     this.btnOpen.addEventListener('click', openOrClose )
//     this.btnClose.addEventListener('click', openOrClose )
    
//     function openOrClose(){
//         if(!_opened){
//             openMenu()
//         } else {
//             closeMenu()
//         }
//     }
    
//     function openMenu(){
//         var _top = _this.nav.getBoundingClientRect().top + 'px'
        
//         var _style = {
//             maxWidth: '20%',
//             width: '20%',
//             overflowY: 'auto',
//         }

//         document.querySelector('.header-button-menu-bar-icon').style.display = 'none';
//         document.querySelector('.header-button-menu-close-icon').style.display = 'block';

//         if (window.innerWidth <= 768) {
//             _style.width = '50%';
//             _style.maxWidth = '50%';
//         }
            
//         if (window.innerWidth <= 480) {
//             _style.width = '80%';
//             _style.maxWidth = '80%';
//         }
        
//         applyStyleToNav(_style)
        
//         _opened = true;
//     }
    
//     function applyStyleToNav(_style){
//         Object.keys(_style).forEach( stl => {
//             _this.nav.style[stl] = _style[stl]
//         } )
//     }

//     function applyStyleToButtonOpen(_style){
//         Object.keys(_style).forEach( stl => {
//             _this.nav.style[stl] = _style[stl]
//         } )
//     }
    
//     function applyStyleToButtonClose(_style){
//         Object.keys(_style).forEach( stl => {
//             _this.nav.style[stl] = _style[stl]
//         } )
//     }
    
//     function closeMenu(){
//         var _style = {
//             maxWidth: '0%',
//             width: '0%',
//             overflowY: 'auto'
//         }

//         document.querySelector('.header-button-menu-bar-icon').style.display = 'block';
//         document.querySelector('.header-button-menu-close-icon').style.display = 'none';
        
//         applyStyleToNav(_style)
        
//         _opened = false;
//     }
// }







//------------------------------------------------------------------------
