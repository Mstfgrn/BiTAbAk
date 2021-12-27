//
//  TableViewCell.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 18.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var sepetImage: UIImageView!
    @IBOutlet weak var sepetYemekAdi: UILabel!
    @IBOutlet weak var sepetUrunadet: UILabel!
    @IBOutlet weak var sepetUrunFiyat: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(slist: SepetYemekler){
        sepetImage.loadImageUrl(urlString: "http://kasimadalan.pe.hu/yemekler/resimler/\(slist.yemekResimAdi!)")
        sepetYemekAdi.text = slist.yemekAdi!
        sepetUrunadet.text = "Adet: \(slist.yemekSiparisAdet!)"
        sepetUrunFiyat.text = "\(slist.yemekFiyat ?? "0") ₺"
    }

}
