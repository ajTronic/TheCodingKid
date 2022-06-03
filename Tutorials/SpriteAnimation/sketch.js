let spriteImages = [];

function setup() {
  createCanvas(800, 600);
  frameRate(30);

  for (let i = 1; i <= 15; i++) {
    spriteImages.push(loadImage('images/png/Run (' + i + ').png'));
  }
}

function draw() {
  background('black');
  image(spriteImages[frameCount % 15], 200, 240, 400, 400);
}