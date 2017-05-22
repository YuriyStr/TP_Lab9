let NumColumns = 10
let NumRows = 20

let StartingColumn = 4
let StartingRow = 0

let PreviewColumn = 12
let PreviewRow = 1

let PointsPerLine = 10
let LevelThreshold = 1000

protocol TetrisDelegate {
    func gameDidEnd(tetris: Tetris)
    func gameDidBegin(tetris: Tetris)
    func gameShapeDidLand(tetris: Tetris)
    func gameShapeDidMove(tetris: Tetris)
    func gameShapeDidDrop(tetris: Tetris)
    func gameDidLevelUp(tetris: Tetris)
}

class Tetris {
    var blockArray:Array2D<Block>
    var nextShape:Shape?
    var fallingShape:Shape?
    var delegate:TetrisDelegate?
    
    var score:Int
    var level:Int
    
    init() {
        score = 0
        level = 1
        fallingShape = nil
        nextShape = nil
        blockArray = Array2D<Block>(columns: NumColumns, rows: NumRows)
    }
    
    func beginGame() {
        
    }
    
    func newShape() -> (fallingShape:Shape?, nextShape:Shape?) {
        return (nil, nil)
    }
    
    func detectIllegalPlacement() -> Bool {
        return false
    }
    
    func settleShape() {
    }
    
    
    func detectTouch() -> Bool {
        return false
    }
    
    func endGame() {
    }
    
    /*func removeAllBlocks() -> Array<Array<Block>> {
        return nil
    }*/
    
    /*func removeCompletedLines() -> (linesRemoved: Array<Array<Block>>, fallenBlocks: Array<Array<Block>>) {
        return ()
    }*/
    
    func dropShape() {
        
    }
    
    func letShapeFall() {
    }
    
    func rotateShape() {
    }
    
    
    func moveShapeLeft() {
    }
    
    func moveShapeRight() {
    }
}