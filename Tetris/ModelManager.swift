//
//  ModelManager.swift
//  Tetris
//
//  Created by Admin on 23.05.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

import Foundation
import UIKit


class ModelManager: NSObject
{
    private struct SubStruct {
        static let sharedInstance = ModelManager()
    }
    var database: FMDatabase = FMDatabase()
    private var getInstanceCalled: Bool = false
    
    class func getInstance() -> ModelManager {
        if (!SubStruct.sharedInstance.getInstanceCalled) {
            SubStruct.sharedInstance.database = FMDatabase(path: Util.getPath("Lab9.sqlite"))
            SubStruct.sharedInstance.getInstanceCalled = true
        }
        return SubStruct.sharedInstance
    }
    
    func addPlayer(player: PlayerInfo) -> Bool {
        SubStruct.sharedInstance.database.open()
        let isInserted = SubStruct.sharedInstance.database.executeUpdate("INSERT Into Players (Login, Password, email) VALUES (?, ?, ?)", withArgumentsInArray: [player.login, player.pass, player.email])
        SubStruct.sharedInstance.database.close()
        return isInserted
    }
    
    func findPlayerWithSameLogin(player: PlayerInfo) -> Bool {
        SubStruct.sharedInstance.database.open()
        let resultSet: FMResultSet! = SubStruct.sharedInstance.database.executeQuery("SELECT * FROM Players WHERE Login = ?", withArgumentsInArray: [player.login])
        var returnValue = resultSet != nil && resultSet.next()
        SubStruct.sharedInstance.database.close()
        return returnValue
    }
    
    func selectAllPlayers() -> NSMutableArray {
        SubStruct.sharedInstance.database.open()
        let resultSet: FMResultSet! = SubStruct.sharedInstance.database.executeQuery("SELECT * FROM Players", withArgumentsInArray: nil)
        let playersInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let playerInfo : PlayerInfo? = PlayerInfo()
                playerInfo?.login = resultSet.stringForColumn("Login")
                playerInfo?.pass = resultSet.stringForColumn("Password")
                playerInfo?.email = resultSet.stringForColumn("email")
                playerInfo?.longitude = resultSet.doubleForColumn("longitude")
                playerInfo?.latitude = resultSet.doubleForColumn("latitude")
                playersInfo.addObject(playerInfo!)
            }
        }
        SubStruct.sharedInstance.database.close()
        return playersInfo
    }
    
    func locationUpdate(player: PlayerInfo) -> Bool {
        SubStruct.sharedInstance.database.open()
        let isUpdated = SubStruct.sharedInstance.database.executeUpdate("UPDATE Players set longitude = ?, latitude = ? WHERE Login = ?", withArgumentsInArray: [player.longitude, player.latitude, player.login])
        SubStruct.sharedInstance.database.close()
        return isUpdated
    }
    
    func getPlayer(login: String, pass: String) -> PlayerInfo? {
        SubStruct.sharedInstance.database.open()
        let resultSet: FMResultSet! = SubStruct.sharedInstance.database.executeQuery("SELECT * FROM Players WHERE Login = ? AND Password = ?", withArgumentsInArray: [login, pass])
        let playerInfo : PlayerInfo? = PlayerInfo()
        if (resultSet != nil && resultSet.next()) {
            playerInfo?.login = resultSet.stringForColumn("Login")
            playerInfo?.pass = resultSet.stringForColumn("Password")
            playerInfo?.email = resultSet.stringForColumn("email")
            SubStruct.sharedInstance.database.close()
            return playerInfo
        }
        SubStruct.sharedInstance.database.close()
        return nil
    }
}