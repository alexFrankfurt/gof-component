
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
