const NUM_ROWS = 8

const SQUARE_SIZE = 100
const ANIM_SPEED = 4

let finalPath = []
let knightImg;

function setup() {
  createCanvas(SQUARE_SIZE * 8, SQUARE_SIZE * 8)
  noStroke()
  img = loadImage("knight.png")
  finalPath = [new Square(int(random(0, 8)), int(random(0, 8)))]
  solve(finalPath)
}

function draw() {
  background(220)

  for (let col = 0; col < 8; col++) {
    for (let row = 0; row < 8; row++) {
      const index = row * 5 + col
      fill(index % 2 == 0 ? "orange" : "black")
      square(col * SQUARE_SIZE, row * SQUARE_SIZE, SQUARE_SIZE)
    }
  }

  if (frameCount < 50) return

  finalPath.forEach((sqr, i) => {
    if (i > (frameCount - 50) * ANIM_SPEED / 100) return

    fill('white')
    image(
      img,
      (sqr.col) * SQUARE_SIZE,
      (sqr.row) * SQUARE_SIZE,
      SQUARE_SIZE,
      SQUARE_SIZE,
    )
  })
}
