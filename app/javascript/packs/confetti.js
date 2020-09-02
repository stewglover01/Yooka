import ConfettiGenerator from "confetti-js";


const dropConfetti = () => {
  const confettiElement = document.getElementById('my-canvas');
  const confettiSettings = { target: confettiElement }
  const confetti = new ConfettiGenerator(confettiSettings);
  console.log('jello')
  confetti.render();
};

export { dropConfetti };


//
// max: 80,size: 1,animate: true, props:["circle","square","triangle","line",{"type":"svg","src":"site/hat.svg","size":25,"weight":0.2}],colors:[[165,104,246],[230,61,135],[0,199,228],[253,214,126]],clock: 25, rotate:false, start_from_edge: false,respawn: true
