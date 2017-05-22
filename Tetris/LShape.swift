class LShape:Shape {
    /*
    
    Orientation 0
    
        | 0•|
        | 1 |
        | 2 | 3 |
    
    Orientation 90

          •
    | 2 | 1 | 0 |
    | 3 |
    
    Orientation 180
    
    | 3 | 2•|
        | 1 |
        | 0 |
    
    Orientation 270
    
          • | 3 |
    | 0 | 1 | 2 |
    
    • marks the row/column indicator for the shape
    
    Pivots about `1`
    
    */
    
    /*override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
    return nil
    }*/
    
    /*override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
    return nil
    }*/
}
