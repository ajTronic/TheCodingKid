let trail = [];

function setup() {
  createCanvas(700, 500);
  noStroke();
}

function draw() {
  background(0);

  fill('#ff5733aa');

  trail.push(createVector(mouseX, mouseY));

  if (trail.length > 100) {
    trail.shift();
  }

  for (let i = 0; i < trail.length; i++) {
    const curr = trail[i];
    circle(curr.x, curr.y, i / 2);
  }
}