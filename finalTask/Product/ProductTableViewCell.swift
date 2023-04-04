//
//  ProductTableViewCell.swift
//  finalTask
//
//  Created by Абдулла-Бек on 3/4/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let productImageView = UIImageView()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "time")
        return imageView
    }()
    
    private let taimLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Color.mainGreen
        return label
    }()
    
    private let addImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "addbutton")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(36)
            make.height.equalTo(180)
        }
        
        bgView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        bgView.addSubview(productNameLabel)
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(180)
            make.width.equalTo(150)
            make.height.equalTo(68)
        }
        
        bgView.addSubview(timeImageView)
        timeImageView.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(16)
            make.leading.equalTo(productNameLabel.snp.leading)
        }
        
        bgView.addSubview(taimLabel)
        taimLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeImageView)
            make.leading.equalTo(timeImageView.snp.trailing).offset(8)
        }
        
        bgView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(timeImageView.snp.leading)
            make.top.equalTo(taimLabel.snp.bottom).offset(20)
        }
        
        bgView.addSubview(addImageView)
        addImageView.snp.makeConstraints { make in
            make.leading.equalTo(priceLabel.snp.trailing).offset(50)
            make.centerY.equalTo(priceLabel)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(imageProduct: String, nameProduct: String, timeProduct: String, priceProduct: String) {
        productImageView.image = UIImage(named: imageProduct)
        productNameLabel.text = nameProduct
        taimLabel.text = timeProduct
        priceLabel.text = priceProduct
    }
}
