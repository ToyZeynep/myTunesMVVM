//
//  FavoriteListCellExtension.swift
//  MyTunesMVVM
//
//  Created by MacOS on 2.04.2022.
//


import Foundation

extension FavoritesListCell {

    func setUpFavoritesListCellContentView() {
        addSubview(favoriteListCellContentView)
        favoriteListCellContentView.setTop(equalTo: topAnchor)
        favoriteListCellContentView.setLeft(equalTo: leftAnchor, constant: 5)
        favoriteListCellContentView.setRight(equalTo: rightAnchor, constant: -5)
        favoriteListCellContentView.setBottom(equalTo: bottomAnchor)
        favoriteListCellContentView.setHeight(height: 375)
        favoriteListCellContentView.setWidth(width: 160)
        
        setUpFavoritesImageView()
        setUpFavoritesNameLabel()
        setUpFavoritesStatusLabel()
        setUpFavoritesSpeciesLabel()
        setUpFavoritesButton()
    }
    
    func setUpFavoritesImageView()  {
        favoriteListCellContentView.addSubview(favoriteListCellImageView)
        favoriteListCellImageView.setTop(equalTo: favoriteListCellContentView.topAnchor, constant: 0)
        favoriteListCellImageView.setLeft(equalTo: favoriteListCellContentView.leftAnchor, constant: 0)
        favoriteListCellImageView.setRight(equalTo: favoriteListCellContentView.rightAnchor, constant: 0)
       // characterImageView.setWidth(width: 180)
    }
    
    func setUpFavoritesNameLabel() {
        favoriteListCellContentView.addSubview(favoriteListCellNameLabel)
        favoriteListCellNameLabel.setTop(equalTo: favoriteListCellImageView.bottomAnchor, constant: 10)
        favoriteListCellNameLabel.setLeft(equalTo: favoriteListCellContentView.leftAnchor, constant: 10)
        favoriteListCellNameLabel.setRight(equalTo: favoriteListCellContentView.rightAnchor,constant: -10)

    }
    
    func setUpFavoritesStatusLabel() {
        favoriteListCellContentView.addSubview(favoriteListCellTypeLabel)
        favoriteListCellTypeLabel.setTop(equalTo: favoriteListCellNameLabel.bottomAnchor, constant: 10)
        favoriteListCellTypeLabel.setLeft(equalTo: favoriteListCellContentView.leftAnchor, constant: 10)
        favoriteListCellTypeLabel.setRight(equalTo: favoriteListCellContentView.rightAnchor, constant: -10)
    }
    
    func setUpFavoritesSpeciesLabel() {
        favoriteListCellContentView.addSubview(favoriteListCellKindLabel)
        favoriteListCellKindLabel.setTop(equalTo: favoriteListCellTypeLabel.bottomAnchor, constant: 10)
        favoriteListCellKindLabel.setLeft(equalTo: favoriteListCellContentView.leftAnchor, constant: 10)
        favoriteListCellKindLabel.setRight(equalTo: favoriteListCellContentView.rightAnchor, constant: -10)
        favoriteListCellKindLabel.setBottom(equalTo: favoriteListCellContentView.bottomAnchor, constant: -10)
    }
    
    func setUpFavoritesButton()  {
        favoriteListCellContentView.addSubview(favoriteListCellDeleteButton)
        favoriteListCellDeleteButton.setTop(equalTo: favoriteListCellContentView.topAnchor, constant: 10)
        favoriteListCellDeleteButton.setRight(equalTo: favoriteListCellContentView.rightAnchor, constant: -10)
        favoriteListCellDeleteButton.setWidth(width: 30)
        favoriteListCellDeleteButton.setHeight(height: 30)
    }
}
