//
//  MyTunesListView.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//


import Foundation
import UIKit
import Material

class MyTunesListView: UIView {
    
    lazy var myTunesListContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var myTunesListToolBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF3F3F3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myTunesListSearchBar,myTunesListFilterButton, myTunesListFavoritesButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = UIColor(rgb: 0xF5F5F5)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    lazy var myTunesListSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = " Search Tunes"
        searchBar.subviews.first?.backgroundColor =  UIColor(rgb: 0xF5F5F5)
        searchBar.sizeToFit()
        searchBar.layer.cornerRadius = 10.5
        searchBar.layer.masksToBounds = true
        return searchBar
    }()
    
    lazy var myTunesListFilterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "filter.png")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
       // button.imageEdgeInsets = EdgeInsets(top: 5 , left: 5, bottom: 5, right: 5)
        button.setHeight(height: 40)
        button.setWidth(width: 45)
        button.clipsToBounds = true
        return button
    }()
    
    lazy var myTunesListFavoritesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "favorite")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = EdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setHeight(height: 40)
        button.setWidth(width: 45)
        button.clipsToBounds = true
        return button
    }()
    
    lazy var myTunesListToolBarLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var myTunesListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpMyTunesListContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
