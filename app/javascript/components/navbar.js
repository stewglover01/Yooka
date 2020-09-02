const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.top-navbar-container');
  // console.log(navbar)
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 188) {
        // console.log(navbar)
        navbar.classList.add('top-navbar-white');
      } else {
        navbar.classList.remove('top-navbar-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
