//
//  ListSectionView.swift
//  Noting
//
//  Created by Ethan Huang on 7/6/23.
//

import UIKit
import CoreData

class TableSectionView: UIViewController {

    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var tableView: ContentSizedTableView!
    
    var items = [NSManagedObject]()
    var sectionTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadNib()
        print("TableSectionView viewDidLoad")
        view.translatesAutoresizingMaskIntoConstraints = false
//        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.folderCellNibName, bundle: nil ), forCellReuseIdentifier: K.folderCellIdentifier)
        tableView.layer.cornerRadius = 10
    }
    
    @IBAction func sectionItemAdded(_ sender: UIButton) {
        // TODO: present some UI to add a name for this section item
        // saves to core data
        print("table section view: section item added")
        // later: show a dropdown list of notes to add to the section
    }
}

// MARK: - UITableViewDataSource

extension TableSectionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        UIListContentConfiguration to modify
        let regularCell = tableView.dequeueReusableCell(withIdentifier: K.folderCellIdentifier, for: indexPath)
        
        guard let cell = regularCell as? TableViewCell else {
            return regularCell
        }
        
        let item = items[indexPath.row]
        
        switch item {
        case let folder as Folder:
            cell.iconImage.image = UIImage(systemName: folder.icon!)
            cell.iconImage.tintColor = folder.iconColor!
            cell.titleLabel.text = folder.name
            cell.countLabel.text = String(folder.storedNotes?.count ?? 0)
        default:
            break
        }
        
        return cell
    }
    
}



// MARK: - loadNib

extension UIViewController {
    func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        nib.instantiate(withOwner: self)
    }
}
