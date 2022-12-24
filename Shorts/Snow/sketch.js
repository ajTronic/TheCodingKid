// YoutTube video: https://www.youtube.com/shorts/apM0Hr2_O0A

let snow = []
let bg

function preload() {
    bg = loadImage("./background.jpg")
}

function setup() {
    createCanvas(innerWidth, innerHeight);
    noStroke()
}

function draw() {
    background(bg);

    for (let i = 0; i < 3; i++) {
        snow.push({
            x: random(width), y: 0,
            xSpeed: random(-0.7, 0.3),
            ySpeed: random(3, 5),
            size: random(2, 9),
        });
    }

    snow.forEach(flake => {
        fill("#eff3f6")
        circle(flake.x, flake.y, flake.size);
        flake.x += flake.xSpeed
        flake.y += flake.ySpeed
    })

    snow = snow.filter(flake => flake.y < height)
}