class Square {
    constructor(row, col) {
        this.row = row
        this.col = col
    }

    getMoves(path) {
        if (!path) throw new Error("path was null.")

        const r = this.row
        const c = this.col

        return [
            new Square(r + 1, c + 2),
            new Square(r + 1, c - 2),
            new Square(r - 1, c + 2),
            new Square(r - 1, c - 2),
            new Square(r + 2, c + 1),
            new Square(r - 2, c + 1),
            new Square(r + 2, c - 1),
            new Square(r - 2, c - 1),
        ].filter(m => m.isValid(path))
    }

    isValid(path) {
        if (!path) throw new Error("path was null.")

        // is it already taken
        for (let i = 0; i < path.length; i++) {
            const sqr = path[i]
            if (sqr.row == this.row && sqr.col == this.col) return false
        }

        // is it on the board
        return (this.row >= 0 && this.row < NUM_ROWS) &&
            (this.col >= 0 && this.col < NUM_ROWS)
    }
}