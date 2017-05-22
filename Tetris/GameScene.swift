//
//  GameScene.swift
//  Tetris
//
//  Created by Admin on 22.05.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

import SpriteKit

let BlockSize:CGFloat = 20.0

let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
    let gameLayer = SKNode()
    let shapeLayer = SKNode()
    let LayerPosition = CGPoint(x: 20, y: -40)
    
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    var textureCache = Dictionary<String, SKTexture>()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 25, y: -40)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
        
        addChild(gameLayer)
        
        let gameBoardTexture = SKTexture(imageNamed: "gameboard")
        let gameBoard = SKSpriteNode(texture: gameBoardTexture, size: CGSizeMake(BlockSize * CGFloat(NumColumns), BlockSize * CGFloat(NumRows)))
        gameBoard.anchorPoint = CGPoint(x:0, y:1.0)
        gameBoard.position = LayerPosition
        
        shapeLayer.position = LayerPosition
        shapeLayer.addChild(gameBoard)
        gameLayer.addChild(shapeLayer)
        
        runAction(SKAction.repeatActionForever(SKAction.playSoundFileNamed("theme.mp3", waitForCompletion: true)))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    func playSound(sound:String) {
        
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
    
    func startTicking() {
    }
    
    func stopTicking() {
    }
    
    /*func pointForColumn(column: Int, row: Int) -> CGPoint {
        return nil
    }*/
    
    func addPreviewShapeToScene(shape:Shape, completion:() -> ()) {
    }
    
    func movePreviewShape(shape:Shape, completion:() -> ()) {
    }
    
    func redrawShape(shape:Shape, completion:() -> ()) {
    }
    
    func animateCollapsingLines(linesToRemove: Array<Array<Block>>, fallenBlocks: Array<Array<Block>>, completion:() -> ()) {
    }
}
