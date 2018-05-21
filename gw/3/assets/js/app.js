/* default dom id (particles-js) */
//particlesJS();

/* config dom id */
//particlesJS('dom-id');

/* config dom id (optional) + config particles params */
particlesJS('particles-js', {
  particles: {
    color: '#fff',
    shape: 'circle', // "circle", "edge" or "triangle"
    opacity: 0.4,
    size: 6,
    size_random: true,
    nb: 150,
    line_linked: {
      enable_auto: true,
      distance: 200,
      color: '#aaa',
      opacity: 0.7,
      width: 1,
      condensed_mode: {
        enable: false,
        rotateX: 600,
        rotateY: 600
      }
    },
    anim: {
      enable: true,
      speed: 0.6
    }
  },
  interactivity: {
    enable: true,
    mouse: {
      distance: 300
    },
    detect_on: 'canvas', // "canvas" or "window"
    mode: 'grab',
    line_linked: {
      opacity: 0.5
    },
    events: {
      onclick: {
        enable: true,
        mode: 'push', // "push" or "remove"
        nb: 4
      }
    }
  },
  /* Retina Display Support */
  retina_detect: true
});