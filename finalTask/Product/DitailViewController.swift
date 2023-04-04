//
//  ProductViewController.swift
//  finalTask
//
//  Created by Абдулла-Бек on 3/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var timeList: [String] = []
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.text = "Detail"
        label.textColor = .black
        return label
    }()
     
    private let favoriteImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "favorite")
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var pizzaImage =  UIImageView()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose the size"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private let timeCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout ()
        layout.sectionInset = UIEdgeInsets (top: 0, left: 26, bottom: 0, right: 26)
        layout.itemSize = CGSize(width: 100, height: 38)
        layout.scrollDirection = .horizontal
        
        let categoriesCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        categoriesCV.backgroundColor = Color.mainGrey
        categoriesCV.showsHorizontalScrollIndicator = false
        return categoriesCV
    }()
    
     var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Color.mainGreen
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
        
    }
    private func initData() {
        timeList = ["8 inch", "20 inch", "32 inch"]
    }
    
    private func initUI() {
        view.backgroundColor = Color.mainGrey
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
        }
        
        view.addSubview(favoriteImage)
        favoriteImage.snp.makeConstraints { make in
            make.centerY.equalTo(detailLabel)
            make.leading.equalTo(detailLabel.snp.trailing).offset(90)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(detailLabel.snp.bottom).offset(56)
            make.width.equalTo(205)
            make.height.equalTo(98)
        }
        
        view.addSubview(pizzaImage)
        pizzaImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(35)
            make.height.equalTo(240)
            make.width.equalTo(300)
        }
        
        view.addSubview(sizeLabel)
        sizeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pizzaImage.snp.bottom).offset(43)
        }
        
        view.addSubview(timeCollectionView)
        timeCollectionView.dataSource = self
        
        timeCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        timeCollectionView.snp.makeConstraints { make in
            make.height.equalTo(38)
            make.top.equalTo(sizeLabel.snp.bottom).offset(44)
            make.leading.trailing.equalToSuperview().inset(0)
        }
        
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(26)
            make.bottom.equalToSuperview().offset(38)
        }
    }

}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        timeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 10
        let label = UILabel(frame: cell.contentView.bounds)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = timeList[indexPath.row]
        label.textColor = .lightGray
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        return cell
    }
}

