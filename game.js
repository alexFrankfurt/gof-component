var BC, CS, GC, M, N, acc, aliveNeighboursNumber, ann, arr, changeLife, genArr, i, j, k, l, m, newArr, nextGen, num, ref, ref1, ref2, status;

M = 30;

N = 30;

CS = 5;

BC = "#388338";

GC = "#919199";

genArr = function() {};

arr = [];

acc = function() {
  var a, k, num, ref;
  a = [];
  for (num = k = 0, ref = N - 1; 0 <= ref ? k <= ref : k >= ref; num = 0 <= ref ? ++k : --k) {
    a.push(0);
  }
  return a;
};

for (num = k = 0, ref = M - 1; 0 <= ref ? k <= ref : k >= ref; num = 0 <= ref ? ++k : --k) {
  arr.push(acc());
}

arr;

changeLife = function(arr, x, y, status) {};

aliveNeighboursNumber = function() {
  num = 0;
  if (arr[x - 1] !== void 0 && arr[x - 1][y - 1] === 1) {
    num += 1;
  }
  if (arr[x][y - 1] === 1) {
    num += 1;
  }
  if (arr[x + 1] !== void 0 && arr[x + 1][y - 1] === 1) {
    num += 1;
  }
  if (arr[x - 1] !== void 0 && arr[x - 1][y] === 1) {
    num += 1;
  }
  if (arr[x + 1] !== void 0 && arr[x + 1][y] === 1) {
    num += 1;
  }
  if (arr[x - 1] !== void 0 && arr[x - 1][y + 1] === 1) {
    num += 1;
  }
  if (arr[x][y + 1] === 1) {
    num += 1;
  }
  if (arr[x + 1] !== void 0 && arr[x + 1][y + 1] === 1) {
    num += 1;
  }
  return num;
};

ann = aliveNeighboursNumber();

if (ann > 3) {
  0;
} else if (ann < 2) {
  0;
} else if (status === 1) {
  1;
} else if (ann === 3 && status === 0) {
  1;
} else {
  0;
}

nextGen = function(arr) {};

newArr = genArr();

for (j = l = 0, ref1 = N - 1; 0 <= ref1 ? l <= ref1 : l >= ref1; j = 0 <= ref1 ? ++l : --l) {
  for (i = m = 0, ref2 = M - 1; 0 <= ref2 ? m <= ref2 : m >= ref2; i = 0 <= ref2 ? ++m : --m) {
    status = arr[i][j];
    newArr[i][j] = changeLife(arr, i, j, status);
  }
}

newArr;
