//
//  Folder+CoreDataProperties.swift
//  Noting
//
//  Created by Ethan Huang on 7/5/23.
//
//

import Foundation
import UIKit
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: K.CData.folderEntity)
    }

    @NSManaged public var icon: String?
    @NSManaged public var iconColor: UIColor?
    @NSManaged public var name: String?
    @NSManaged public var storedNotes: NSSet?

}

// MARK: Generated accessors for storedNotes
extension Folder {

    @objc(addStoredNotesObject:)
    @NSManaged public func addToStoredNotes(_ value: Note)

    @objc(removeStoredNotesObject:)
    @NSManaged public func removeFromStoredNotes(_ value: Note)

    @objc(addStoredNotes:)
    @NSManaged public func addToStoredNotes(_ values: NSSet)

    @objc(removeStoredNotes:)
    @NSManaged public func removeFromStoredNotes(_ values: NSSet)

}

extension Folder : Identifiable {

}
