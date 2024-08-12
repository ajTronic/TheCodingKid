function solve(path) {
  if (path.length == NUM_ROWS ** 2) return true // we're done

  const lastSquare = path[path.length - 1]
  const availableSquares = lastSquare.getMoves(path)

  // cannot solve
  if (availableSquares.length == 0) return false

  // Warnsdof's rule (https://en.wikipedia.org/wiki/Knight%27s_tour#Warnsdorf's_rule)
  availableSquares.sort((a, b) => a.getMoves(path).length - b.getMoves(path).length)

  // try each available square
  for (let i = 0; i < availableSquares.length; i++) {
    const sqr = availableSquares[i];
    path.push(sqr)

    if (solve(path)) return true
    else path.pop()
  }

  // since we haven't found any good squares
  return false
}