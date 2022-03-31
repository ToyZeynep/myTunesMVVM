//
//  MyTunesDetailsViewController.swift
//  MyTunesMVVM
//
//  Created by MacOS on 31.03.2022.
//

import UIKit
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action

class MyTunesDetailViewController: UIViewController, BindableType, UICollectionViewDelegate {
  
    let disposeBag = DisposeBag()
    var myTunesDetailView = MyTunesDetailsView()
    var viewModel: MyTunesDetailsViewModel!
    
    
    override func loadView() {
        view = myTunesDetailView
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
    }
    
    
    override func viewDidLoad() {
    }

func bindViewModel() {
    
    viewModel.output.wrapperType.bind(to: myTunesDetailView.myTunesDetailsWrapperTypeLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.kind.bind(to: myTunesDetailView.myTunesDetailsKindLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.primaryGenreName.bind(to: myTunesDetailView.myTunesDetailsPrimaryGenreLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.trackName.bind(to: myTunesDetailView.myTunesDetailsTrackNameLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.country.bind(to: myTunesDetailView.myTunesDetailsCountryLabel.rx.text).disposed(by: disposeBag)
    viewModel.output.artworkUrl100.subscribe(onNext: { [weak self] (artworkUrl100) in
        self?.myTunesDetailView.myTunesDetailsImageView.kf.setImage(with: URL(string: artworkUrl100))
    }).disposed(by: disposeBag)

   }
}
