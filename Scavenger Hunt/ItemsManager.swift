//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Nathan5x on 1/27/16.
//  Copyright © 2016 MyWebGround. All rights reserved.
//

import UIKit

class ItemsManager {
    
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        if let documentsPath = directoryList.first {
            return documentsPath + "/ScanvengerHuntItems"
        }
        
        
        assertionFailure("Could not determine where to store file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile: theArchivePath) {
                print("Saved successfully")
            } else {
                assertionFailure("Could not save file");
            }
        }
    }
    
    init() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
}
