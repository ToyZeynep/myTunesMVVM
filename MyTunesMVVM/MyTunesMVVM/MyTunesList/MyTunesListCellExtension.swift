//
//  MyTunesListCellExtension.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//

import Foundation

extension MyTunesListCell {

    func setUpMyTunesListCellContentView() {
        addSubview(myTunesListCellContentView)
        myTunesListCellContentView.setTop(equalTo: topAnchor)
        myTunesListCellContentView.setLeft(equalTo: leftAnchor, constant: 5)
        myTunesListCellContentView.setRight(equalTo: rightAnchor, constant: -5)
        myTunesListCellContentView.setBottom(equalTo: bottomAnchor)
        myTunesListCellContentView.setHeight(height: 375)
        myTunesListCellContentView.setWidth(width: 160)
        
        setUpCharacterImageView()
        setUpNameLabel()
        setUpStatusLabel()
        setUpSpeciesLabel()
        setUpFavoriteButton()
    }
    
    func setUpCharacterImageView()  {
        myTunesListCellContentView.addSubview(myTunesListCellImageView)
        myTunesListCellImageView.setTop(equalTo: myTunesListCellContentView.topAnchor, constant: 0)
        myTunesListCellImageView.setLeft(equalTo: myTunesListCellContentView.leftAnchor, constant: 0)
        myTunesListCellImageView.setRight(equalTo: myTunesListCellContentView.rightAnchor, constant: 0)
       // characterImageView.setWidth(width: 180)
    }
    
    func setUpNameLabel() {
        myTunesListCellContentView.addSubview(myTunesListCellNameLabel)
        myTunesListCellNameLabel.setTop(equalTo: myTunesListCellImageView.bottomAnchor, constant: 10)
        myTunesListCellNameLabel.setLeft(equalTo: myTunesListCellContentView.leftAnchor, constant: 10)
        myTunesListCellNameLabel.setRight(equalTo: myTunesListCellContentView.rightAnchor,constant: -10)

    }
    
    func setUpStatusLabel() {
        myTunesListCellContentView.addSubview(myTunesListCellTypeLabel)
        myTunesListCellTypeLabel.setTop(equalTo: myTunesListCellNameLabel.bottomAnchor, constant: 10)
        myTunesListCellTypeLabel.setLeft(equalTo: myTunesListCellContentView.leftAnchor, constant: 10)
        myTunesListCellTypeLabel.setRight(equalTo: myTunesListCellContentView.rightAnchor, constant: -10)
    }
    
    func setUpSpeciesLabel() {
        myTunesListCellContentView.addSubview(myTunesListCellKindLabel)
        myTunesListCellKindLabel.setTop(equalTo: myTunesListCellTypeLabel.bottomAnchor, constant: 10)
        myTunesListCellKindLabel.setLeft(equalTo: myTunesListCellContentView.leftAnchor, constant: 10)
        myTunesListCellKindLabel.setRight(equalTo: myTunesListCellContentView.rightAnchor, constant: -10)
        myTunesListCellKindLabel.setBottom(equalTo: myTunesListCellContentView.bottomAnchor, constant: -10)
    }
    
    func setUpFavoriteButton()  {
        myTunesListCellContentView.addSubview(myTunesListCellAddFavoriteButton)
        myTunesListCellAddFavoriteButton.setTop(equalTo: myTunesListCellImageView.topAnchor, constant: 10)
        myTunesListCellAddFavoriteButton.setRight(equalTo: myTunesListCellContentView.rightAnchor, constant: -10)
        myTunesListCellAddFavoriteButton.setWidth(width: 30)
        myTunesListCellAddFavoriteButton.setHeight(height: 30)
    }
}
