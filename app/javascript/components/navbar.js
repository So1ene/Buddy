const navbar = () => {
  const body = document.getElementById('body');
  const openMenu = document.getElementById('menuControlOpen');
  const closeMenu = document.getElementById('menuControlClose');
  const dimBackground = document.getElementById('dim-background')

  openMenu.addEventListener('click', function(e) {
  body.classList.toggle('menu--active');
  dimBackground.classList.remove("hide-dim-background");
  dimBackground.classList.add("show-dim-background");
  });

  closeMenu.addEventListener('click', function(e) {
  body.classList.toggle('menu--active');
  dimBackground.classList.remove("show-dim-background");
  dimBackground.classList.add("hide-dim-background");
  });

  dimBackground.addEventListener('click', function(e) {
  body.classList.toggle('menu--active');
  dimBackground.classList.remove("show-dim-background");
  dimBackground.classList.add("hide-dim-background");
  });
};

export { navbar };
