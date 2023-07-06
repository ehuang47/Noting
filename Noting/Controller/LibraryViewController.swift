//
//  ViewController.swift
//  Noting
//
//  Created by Ethan Huang on 6/29/23.
//

import UIKit

class LibraryViewController: UIViewController {
    let coreDataStack = AppDelegate.sharedAppDelegate.coreDataStack
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addItemButton: UIButton!
    
    var folders = [Folder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.folderCellNibName, bundle: nil ), forCellReuseIdentifier: K.folderCellIdentifier)
        guard let folderList = coreDataStack.getData(entity: K.CData.folderEntity) as? [Folder] else { return }
        folders = folderList
    }
}

// MARK: - UITableViewDataSource

extension LibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        UIListContentConfiguration to modify
        print("cell for row at")
        let x = folders[indexPath.row]
        print(x, x.name)
        
        let regularCell = tableView.dequeueReusableCell(withIdentifier: K.folderCellIdentifier, for: indexPath)
        
        guard let cell = regularCell as? FolderTableViewCell else {
            return regularCell
        }
        
        let folder = folders[indexPath.row]
        print(cell, folder)
        
        cell.iconImage.image = UIImage(systemName: folder.icon!)
        cell.iconImage.tintColor = folder.iconColor
        cell.titleLabel.text = folder.name
        cell.countLabel.text = String(folder.storedNotes?.count ?? 0)

        return cell
    }
    
    
}


// MARK: - UITableViewDelegate

extension LibraryViewController: UITableViewDelegate {
    
}
