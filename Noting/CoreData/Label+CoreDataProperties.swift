//
//  Label+CoreDataProperties.swift
//  Noting
//
//  Created by Ethan Huang on 7/5/23.
//
//

import Foundation
import CoreData
import UIKit

extension Label {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Label> {
        return NSFetchRequest<Label>(entityName: K.CData.labelEntity)
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var name: String?
    @NSManaged public var taggedNotes: NSSet?

}

// MARK: Generated accessors for taggedNotes
extension Label {

    @objc(addTaggedNotesObject:)
    @NSManaged public func addToTaggedNotes(_ value: Note)

    @objc(removeTaggedNotesObject:)
    @NSManaged public func removeFromTaggedNotes(_ value: Note)

    @objc(addTaggedNotes:)
    @NSManaged public func addToTaggedNotes(_ values: NSSet)

    @objc(removeTaggedNotes:)
    @NSManaged public func removeFromTaggedNotes(_ values: NSSet)

}

extension Label : Identifiable {

}
