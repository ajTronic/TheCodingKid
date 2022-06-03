function setup() {
  createCanvas(400, 400);
  angleMode(DEGREES);
}

function draw() {
  background('black');
  stroke('white');
  translate(width / 2, height / 2);

  drawHand(second() * 6, 120, 2);
  drawHand(minute() * 6, 90, 4);
  drawHand((hour() % 12) * 30, 60, 4);

  drawNumbers();

  circle(0, 0, 10);
}

function drawHand(rotation, length, weight) {
  strokeWeight(weight);
  push();
  rotate(rotation);
  line(0, 0, 0, -length);
  pop();
}

function drawNumbers() {
  noStroke();
  fill('white');
  textSize(30);
  textAlign(CENTER);
  for (let i = 1; i <= 12; i++) {
    text(i,
      cos(i * 30 - 90) * 150,
      sin(i * 30 - 90) * 150 + 10
    );
  }
}