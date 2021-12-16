//
//  CollectionViewCell.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 14.12.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var yemekImageView: UIImageView!
    
    @IBOutlet weak var yemekAdi: UILabel!
    @IBOutlet weak var yemekFiyati: UILabel!
    
    func configure(ylist: Yemekler){
        var imagename = ylist.yemekAdi!.lowercased()
        yemekImageView.loadImageUrl(urlString: "http://kasimadalan.pe.hu/yemekler/resimler/\(imagename).png")
        yemekAdi.text = ylist.yemekAdi
        yemekFiyati.text = "\(ylist.yemekFiyat ?? "0") ₺"
    }
}
