var arr, canvas, canvasLeft, canvasTop, ctx, draw, drawGrid, runNButton, startButton, stopButton;

startButton = document.querySelector(".control-panel>#run");

runNButton = document.querySelector(".control-panel>#run-n");

stopButton = document.querySelector(".control-panel>#stop");

arr = genArr();

canvas = document.querySelector("#canvas");

canvasLeft = canvas.offsetLeft;

canvasTop = canvas.offsetTop;

ctx = canvas.getContext("2d");

canvas.onclick = function(e) {
  var i, j, x, y;
  x = e.pageX - canvasLeft;
  y = e.pageY - canvasTop;
  j = Math.floor(x / 5);
  i = Math.floor(y / 5);
  arr[i][j] = 1;
  return drawGrid(arr);
};

arr[1][1] = 1;

arr[2][1] = 1;

arr[3][1] = 1;

drawGrid = function(arr) {
  var col, height, k, l, m, ref, ref1, ref2, results, row, width;
  width = CS * N;
  height = CS * M;
  ctx.fillStyle = BC;
  ctx.fillRect(0, 0, width, height);
  for (col = k = 0, ref = N - 1; 0 <= ref ? k <= ref : k >= ref; col = 0 <= ref ? ++k : --k) {
    for (row = l = 0, ref1 = M - 1; 0 <= ref1 ? l <= ref1 : l >= ref1; row = 0 <= ref1 ? ++l : --l) {
      ctx.strokeStyle = GC;
      ctx.strokeRect(col * CS, row * CS, CS, CS);
    }
  }
  ctx.fillStyle = "lime";
  results = [];
  for (col = m = 0, ref2 = N - 1; 0 <= ref2 ? m <= ref2 : m >= ref2; col = 0 <= ref2 ? ++m : --m) {
    results.push((function() {
      var n, ref3, results1;
      results1 = [];
      for (row = n = 0, ref3 = M - 1; 0 <= ref3 ? n <= ref3 : n >= ref3; row = 0 <= ref3 ? ++n : --n) {
        results1.push(arr[row][col] === 1 ? ctx.fillRect(col * CS, row * CS, CS, CS) : void 0);
      }
      return results1;
    })());
  }
  return results;
};

draw = async function(arr, num) {
  var col, k, l, ref, ref1, row;
  drawGrid(arr);
  ctx.fillStyle = "lime";
  for (col = k = 0, ref = N - 1; 0 <= ref ? k <= ref : k >= ref; col = 0 <= ref ? ++k : --k) {
    for (row = l = 0, ref1 = M - 1; 0 <= ref1 ? l <= ref1 : l >= ref1; row = 0 <= ref1 ? ++l : --l) {
      if (arr[row][col] === 1) {
        ctx.fillRect(col * CS, row * CS, CS, CS);
      }
    }
  }
  await new Promise(function(r) {
    return setTimeout(r, 500);
  });
  console.log("one step");
  if (num < 0) {
    return 0;
  } else {
    return draw(nextGen(arr), num -= 1);
  }
};

drawGrid(arr);

startButton.onclick = function() {
  return draw(arr, 2e308);
};

runNButton.onclick = function() {
  return draw(arr, 20);
};
