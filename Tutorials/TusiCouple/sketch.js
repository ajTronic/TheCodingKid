const RANGE = 500
const NUM_LINES = 10
const colors = []

function setup() {
  createCanvas(innerWidth, innerHeight)
  angleMode(DEGREES)
  for (let i = 0; i < NUM_LINES; i++) {
    colors.push([
      random(255),
      random(255),
      random(255)
    ])
  }
}

function draw() {
  background('black')
  translate(width / 2, height / 2,)

  // outer circle
  noFill()
  stroke('white')
  strokeWeight(3)
  circle(0, 0, RANGE)

  // lines
  for (let i = 0; i < NUM_LINES; i++) {
    push()
    const gap = 180 / NUM_LINES
    rotate(i * gap)
    strokeWeight(2)
    stroke(200)
    line(0, -RANGE / 2, 0, RANGE / 2)
    pop()
  }

  // circles
  for (let i = 0; i < NUM_LINES; i++) {
    push()
    noStroke()
    fill(colors[i])
    const gap = 180 / NUM_LINES
    const offset = i * gap
    rotate(offset)
    circle(0, sin((frameCount * 2) + offset) * RANGE / 2, 30)
    pop()
  }
}