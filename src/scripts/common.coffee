# Height
M = 30

# Width
N = 30
# Cell Size
CS = 5

# Background colour
BC = "#388338"

# Grid colour
GC = "#919199"



# Generate array of zero's MxN
genArr = ->
  arr = []
  acc = ->
    a = []
    a.push 0 for num in [0..N - 1]
    a
  arr.push acc() for num in [0..M - 1]
  arr

# Given array and position and live status look for 8 neighbours
# and if 1) > 3 of them are alive, then die
#        2) < 2 of them are alive, then die
#        3) 2 or 3 of them alive, this alive, then live
#        4) 3 of them alive, this dead, then become alive.
# Borders are dead.
changeLife = (arr, x, y, status) ->
  aliveNeighboursNumber = ->
    num = 0
    if arr[x - 1] != undefined and arr[x - 1][y - 1] == 1
      num += 1
    if arr[x][y - 1] == 1
      num += 1
    if arr[x + 1] != undefined and arr[x + 1][y - 1] == 1
      num += 1
    if arr[x - 1] != undefined and arr[x - 1][y] == 1
      num += 1
    if arr[x + 1] != undefined and arr[x + 1][y] == 1
      num += 1
    if arr[x - 1] != undefined and arr[x - 1][y + 1] == 1
      num += 1
    if arr[x][y + 1] == 1
      num += 1
    if arr[x + 1] != undefined and arr[x + 1][y + 1] == 1
      num += 1
    num

  ann = aliveNeighboursNumber()

  # # Debug
  # if ann > 1
  #   console.log "pos: " + x + " : " + y
  #   console.log ann

  if ann > 3
    0
  else if ann < 2
    0
  else if status == 1
    1
  else if ann == 3 and status == 0
    1
  else
    0

# Generate new generation based on previous
nextGen = (arr) ->
  newArr = genArr()
  ((
    status = arr[i][j]
    newArr[i][j] = changeLife arr, i, j, status
  ) for i in [0..M - 1]) for j in [0..N - 1]
  newArr


componentRoot = document.querySelector('game-of-life').shadowRoot



startButton = componentRoot.querySelector(".control-panel>#run")
runNButton  = componentRoot.querySelector(".control-panel>#run-n")
stopButton  = componentRoot.querySelector(".control-panel>#stop")

arr = genArr()

canvas = componentRoot.querySelector('#canvas');
# canvas = document.querySelector("#canvas")
ctx = canvas.getContext "2d"


canvas.onclick = (e) ->
  x = e.pageX - canvas.offsetLeft
  y = e.pageY - canvas.offsetTop
  j = Math.floor x / 5
  i = Math.floor y / 5
  arr[i][j] = 1
  drawGrid arr


# arr 2 1 to 1
arr[1][1] = 1
arr[2][1] = 1
arr[3][1] = 1

drawGrid = (arr) ->
  width = CS * N
  height = CS * M
  ctx.fillStyle = BC
  ctx.fillRect 0, 0, width, height
  ((
    ctx.strokeStyle = GC
    ctx.strokeRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]
  ctx.fillStyle = "lime"
  ((
    if arr[row][col] == 1
      ctx.fillRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]


draw = (arr, num) ->
  drawGrid arr
  ctx.fillStyle = "lime"
  ((
    if arr[row][col] == 1
      ctx.fillRect col * CS, row * CS, CS, CS
  ) for row in [0..M - 1]) for col in [0..N - 1]
  await new Promise((r) -> setTimeout(r, 500))
  console.log "one step"
  if num < 0
    0
  else
    draw nextGen(arr), num -= 1

drawGrid arr

startButton.onclick = () ->
  draw(arr, Infinity)

runNButton.onclick = () -> draw(arr, 20)

onmessage = (e) ->
  switch e 
    when "start" then 
      
      draw(arr, Infinity)

