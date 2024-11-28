import { Application } from "@hotwired/stimulus"


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }


const nav = document.getElementById("navbar");

// Applique la position fixe via JavaScript
// nav.style.position = "fixed";
// nav.style.top = "0";
// nav.style.left = "0";
// nav.style.right = "0";
// nav.style.zIndex = "1000"; // Pour s'assurer qu'elle est au-dessus d'autres éléments

// Listener pour maintenir la visibilité en cas de scroll
// window.addEventListener("scroll", () => {
//   nav.style.top = "0";
//   nav.style.position = "fixed";
//   console.log("Navbar is visible while scrolling!");
// });

// window.addEventListener("scroll", () => {
//   //console.log("Test !");
//   //console.log(window.scrollY);
//   console.log(window.scrollY)

//   if (window.scrollY == 0) {
//     nav.style.top = "0";
//   } else if (window.scrollY > 0) {
//     nav.style.top = "0";
//   }
// });
