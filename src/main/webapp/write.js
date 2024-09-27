const writeBt = document.querySelector('.header-upper__writeBt');
 const writeMenu = document.querySelector('.header-upper__lists');

 const openWriteMenu = (event) => {
   event.stopPropagation(); // 클릭 이벤트가 상위로 전파되지 않도록
   writeMenu.classList.add('openWriteMenu');
 }

 const closeWriteMenu = (event) => {
   // writeBt와 writeMenu 외부를 클릭했을 때만 메뉴 닫기
   if (!writeMenu.contains(event.target) && event.target !== writeBt) {
     writeMenu.classList.remove('openWriteMenu');
   }
 }

 // 버튼 클릭 시 메뉴 열기
 writeBt.addEventListener("click", openWriteMenu);

 // 외부 클릭 시 메뉴 닫기
 window.addEventListener("click", closeWriteMenu);

 // 디버깅용 콘솔 로그
 console.log(writeBt, writeMenu);