//
//  HeroViewController.swift
//  IOS_Marvel
//
//  Created by phan.xuan.thuan on 9/20/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HeroViewController: BaseViewController, ViewModelViewController {
    
    private struct Constans {
        static let NUMBER_SECTION = 1
        static let NUMBER_ITEM_SECTION = 2
    }
    
    @IBOutlet weak var searchBarHero: UISearchBar!
    @IBOutlet weak var collectionHero: UICollectionView!
    fileprivate let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    fileprivate let itemsPerRow: CGFloat = 2
    var viewModel: HeroViewModel!
    
    override func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        collectionHero.delegate = self
        collectionHero.dataSource = self
        collectionHero.registerCell(HomeCollectionViewCell.self)
    }
    
    override func bindViewModel() {
        let indexSelected = collectionHero.rx.itemSelected.asDriver().map({$0.row})
        let kq = searchBarHero.rx.text.asDriver().debounce(0.5)

        let input = HeroViewModel.Input(viewWillAppearTrigger:rx.viewWillAppear.asDriver().mapToVoid(),
                                        indexSelected: indexSelected,
                                        keyWork: kq)
        let output = viewModel.transform(input: input, with: bag)
        
        output.fetchHero.drive(onNext:{ [weak self] _ in
            self?.collectionHero.reloadData()
        }).disposed(by: self)
        
        output.searchHero.drive(onNext: {[weak self] _ in
            self?.collectionHero.reloadData()
        }).disposed(by: self)

        viewModel.errorTracker.asDriver().drive(onNext:{ [weak self] error in
            self?.showErrorAlert(error: error.localizedDescription)
        }).disposed(by: self)
        
        viewModel.activityIndicator.asDriver().drive(rx.isLoading).disposed(by: self)
    
    }
    
    private func showErrorAlert(error: String){
        let alert = UIAlertController(title: "Error", message:error , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension HeroViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constans.NUMBER_SECTION
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hero = viewModel.hero(at: indexPath.row)
        let cell = collectionView.dequeueCell(HomeCollectionViewCell.self, forIndexPath: indexPath)
        cell.bindHero(hero)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
