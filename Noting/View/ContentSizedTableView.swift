//
//  ContentSizedTableView.swift
//  Noting
//
//  Created by Ethan Huang on 7/5/23.
//

import UIKit

class ContentSizedTableView: UITableView {
    override var contentSize: CGSize {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
