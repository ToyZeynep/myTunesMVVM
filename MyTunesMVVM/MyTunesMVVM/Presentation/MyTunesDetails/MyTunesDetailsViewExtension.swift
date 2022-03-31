//
//  MyTunesDetailsViewExtension.swift
//  MyTunesMVVM
//
//  Created by MacOS on 31.03.2022.
//

import UIKit
import Foundation

extension MyTunesDetailsView {
    func setUpMyTunesDetailsContentView()  {
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        addSubview(myTunesDetailsContentView)
        if #available(iOS 11.0, *) {
            myTunesDetailsContentView.setTop(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20)
        } else {
        }
        myTunesDetailsContentView.setLeft(equalTo: leftAnchor, constant: 30)
        myTunesDetailsContentView.setRight(equalTo: rightAnchor, constant: -30)
        myTunesDetailsContentView.setBottom(equalTo: bottomAnchor, constant: -30)
        
        setUptoolBarLineView()
        setUpImageView()
        setUpWrapperTypeLabel()
        setUpKindLabel()
        setUpCountryLabel()
        setUpPrimaryGenreLabel()
    }
    
    func setUptoolBarLineView() {
        addSubview(myTunesDetailsToolBarLineView)
        myTunesDetailsToolBarLineView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        myTunesDetailsToolBarLineView.setLeft(equalTo: leftAnchor)
        myTunesDetailsToolBarLineView.setRight(equalTo: rightAnchor)
        myTunesDetailsToolBarLineView.setHeight(height: 1)
    }
    
    
    func  setUpImageView() {
        myTunesDetailsContentView.addSubview(myTunesDetailsImageView)
        myTunesDetailsImageView.setTop(equalTo: myTunesDetailsContentView.topAnchor, constant: 20)
        myTunesDetailsImageView.setCenterX(equalTo: myTunesDetailsContentView.centerXAnchor)
        myTunesDetailsImageView.setHeight(height: 200)
        myTunesDetailsImageView.setWidth(width: 200)
    }
    
    func setUpWrapperTypeLabel() {
        myTunesDetailsContentView.addSubview(myTunesDetailsWrapperTypeLabel)
        myTunesDetailsWrapperTypeLabel.setTop(equalTo: myTunesDetailsImageView.bottomAnchor, constant: 20)
        myTunesDetailsWrapperTypeLabel.setLeft(equalTo: myTunesDetailsContentView.leftAnchor, constant: 20)
        myTunesDetailsWrapperTypeLabel.setRight(equalTo: myTunesDetailsContentView.rightAnchor, constant: -20)
    }
    
    
    func setUpKindLabel() {
        myTunesDetailsContentView.addSubview(myTunesDetailsKindLabel)
        myTunesDetailsKindLabel.setTop(equalTo: myTunesDetailsWrapperTypeLabel.bottomAnchor, constant: 20)
        myTunesDetailsKindLabel.setLeft(equalTo: myTunesDetailsContentView.leftAnchor, constant: 20)
        myTunesDetailsKindLabel.setRight(equalTo: myTunesDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpCountryLabel() {
        myTunesDetailsContentView.addSubview(myTunesDetailsCountryLabel)
        myTunesDetailsCountryLabel.setTop(equalTo: myTunesDetailsKindLabel.bottomAnchor, constant: 20)
        myTunesDetailsCountryLabel.setLeft(equalTo: myTunesDetailsContentView.leftAnchor, constant: 20)
        myTunesDetailsCountryLabel.setRight(equalTo: myTunesDetailsContentView.rightAnchor, constant: -20)
    }
    
    func setUpPrimaryGenreLabel() {
        myTunesDetailsContentView.addSubview(myTunesDetailsPrimaryGenreLabel)
        myTunesDetailsPrimaryGenreLabel.setTop(equalTo: myTunesDetailsCountryLabel.bottomAnchor, constant: 20)
        myTunesDetailsPrimaryGenreLabel.setLeft(equalTo: myTunesDetailsContentView.leftAnchor, constant: 20)
        myTunesDetailsPrimaryGenreLabel.setRight(equalTo: myTunesDetailsContentView.rightAnchor, constant: -20)
    }
 
}
