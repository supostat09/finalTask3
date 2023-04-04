//
//  HomeViewController.swift
//  finalTask
//
//  Created by Абдулла-Бек on 2/4/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var categoriesList: [String] = []
    private var productsList: [Products] = []

    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Mehrab"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back !"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    private let kolImageView: UIImageView = {
        let kolImage = UIImageView()
        kolImage.image = UIImage(named: "kol")
        return kolImage
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    private let filterImageView: UIImageView = {
        let filterImage = UIImageView()
        filterImage.image = UIImage(named: "filter")
        return filterImage
    }()
    
    private let categoriesCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout ()
        layout.sectionInset = UIEdgeInsets (top: 0, left: 24, bottom: 0, right: 24)
        layout.itemSize = CGSize(width: 100, height: 35)
        layout.scrollDirection = .horizontal
        
        let categoriesCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        categoriesCV.backgroundColor = Color.mainGrey
        categoriesCV.showsHorizontalScrollIndicator = false
        return categoriesCV
    }()
    
    private let productTabelView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Color.mainGrey
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
  
    }
    
    private func initData() {
        categoriesList = ["All", "Pizza", "Fast Food", "Vegan", "Soup", "Salad"]
        productsList = [Products(imageProduct: "pizza1",
                                 nameProduct: "Pizza with Mushrooms",
                                 timeImageProduct: "time",
                                 timeProduct: "14-20 minutes",
                                 priceProduct: "$12",
                                 detailPizza: "pizzaMush"),
                        Products(imageProduct: "pizza2",
                                 nameProduct: "Pepperoni Cheese Pizza",
                                 timeImageProduct: "time",
                                 timeProduct: "18-25 minutes",
                                 priceProduct: "$14",
                                 detailPizza: "pizzaPep")]
    }
    
    private func initUI() {
        view.backgroundColor = UIColor.systemGray5
        
        view.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(10)
            make.leading.equalTo(helloLabel.snp.leading)
        }
        
        view.addSubview(kolImageView)
        kolImageView.snp.makeConstraints { make in
            make.centerY.equalTo(helloLabel.snp.bottom)
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(26)
            make.height.equalTo(32)
        }
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(36)
            make.leading.equalTo(welcomeLabel.snp.leading)
            make.width.equalTo(302)
            make.height.equalTo(55)
        }
        
        view.addSubview(filterImageView)
        filterImageView.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar.snp.centerY)
            make.leading.equalTo(searchBar.snp.trailing).offset(10)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        
        view.addSubview(categoriesCollectionView)
        categoriesCollectionView.dataSource = self
        
        categoriesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.top.equalTo(searchBar.snp.bottom).offset(46)
            make.leading.trailing.equalToSuperview().inset(0)
        }
        
        view.addSubview(productTabelView)
        productTabelView.dataSource = self
        productTabelView.delegate = self
        
        productTabelView.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
        
        productTabelView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 10
        let label = UILabel(frame: cell.contentView.bounds)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = categoriesList[indexPath.row]
        label.textColor = .lightGray
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        cell.backgroundColor = Color.mainGrey
        cell.setData(imageProduct: productsList[indexPath.row].imageProduct,
                     nameProduct: productsList[indexPath.row].nameProduct,
                     timeProduct: productsList[indexPath.row].timeProduct,
                     priceProduct: productsList[indexPath.row].priceProduct)
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.nameLabel.text = productsList[indexPath.row].nameProduct
        vc.pizzaImage.image = UIImage(named: productsList[indexPath.row].detailPizza)
        vc.priceLabel.text = productsList[indexPath.row].priceProduct
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
