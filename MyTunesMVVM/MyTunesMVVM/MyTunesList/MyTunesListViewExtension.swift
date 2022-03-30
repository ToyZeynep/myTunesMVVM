//
//  MyTunesListViewExtension.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//


import Foundation
import UIKit
extension MyTunesListView {
    func setUpMyTunesListContentView()  {
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        addSubview(myTunesListContentView)
        if #available(iOS 11.0, *) {
            myTunesListContentView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        }
        myTunesListContentView.setLeft(equalTo: leftAnchor)
        myTunesListContentView.setRight(equalTo: rightAnchor)
        myTunesListContentView.setBottom(equalTo: bottomAnchor)
        
        setUpToolbarView()
        setUpCityListToolBarLineView()
        setCityListCollectionView()
        
    }
    
    func setUpToolbarView() {
        myTunesListContentView.addSubview(myTunesListToolBarView)
        myTunesListToolBarView.setTop(equalTo: myTunesListContentView.topAnchor)
        myTunesListToolBarView.setLeft(equalTo: myTunesListContentView.leftAnchor)
        myTunesListToolBarView.setRight(equalTo: myTunesListContentView.rightAnchor)
        myTunesListToolBarView.setHeight(height: 40)
        setUpStackView()
    }
    
    func setUpStackView(){
        myTunesListToolBarView.addSubview(stackView)
        stackView.setTop(equalTo: myTunesListToolBarView.topAnchor)
        stackView.setLeft(equalTo: myTunesListToolBarView.leftAnchor)
        stackView.setBottom(equalTo: myTunesListToolBarView.bottomAnchor)
        stackView.setRight(equalTo: myTunesListToolBarView.rightAnchor)
    }
    
    func setUpCityListToolBarLineView() {
        myTunesListContentView.addSubview(myTunesListToolBarLineView)
        myTunesListToolBarLineView.setTop(equalTo:  myTunesListToolBarView.bottomAnchor)
        myTunesListToolBarLineView.setLeft(equalTo: myTunesListContentView.leftAnchor)
        myTunesListToolBarLineView.setRight(equalTo: myTunesListContentView.rightAnchor)
        myTunesListToolBarLineView.setHeight(height: 1)
    }
    
    func setCityListCollectionView()  {
        myTunesListContentView.addSubview(myTunesListCollectionView)
        myTunesListCollectionView.setTop(equalTo: myTunesListToolBarLineView.bottomAnchor , constant: 15)
        myTunesListCollectionView.setLeft(equalTo: myTunesListContentView.leftAnchor)
        myTunesListCollectionView.setRight(equalTo: myTunesListContentView.rightAnchor)
        myTunesListCollectionView.setBottom(equalTo: myTunesListContentView.bottomAnchor)
        
    }
}
