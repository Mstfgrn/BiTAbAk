//
//  YemekDetayVc.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 13.12.2021.
//

import UIKit
import Foundation
class YemekDetayVc: UIViewController {
    var yemek: Yemekler?
    
    @IBOutlet weak var minusButtonOut: UIButton!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var yemekdetayAdi: UILabel!
    @IBOutlet weak var yemekdetayFiyat: UILabel!
    @IBOutlet weak var imagedetay: UIImageView!
    
    var yemekDetayPresenterNesnesi:ViewToPresenterYemekDetayProtocol?
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minusButtonOut.isEnabled = false
        if let ydata = yemek{
            imagedetay.loadImageUrl(urlString: "http://kasimadalan.pe.hu/yemekler/resimler/\(ydata.yemekResimAdi!)")
            yemekdetayAdi.text = ydata.yemekAdi
        }
        
        YemekDetayRouter.createModule(ref: self)
        
    }
    func multi(fiyat: Int, counter: Int)-> Int{
        let mul = fiyat * counter
        return mul
    }
    @IBAction func minusButton(_ sender: Any) {
        if count.text == "0" {
            minusButtonOut.isEnabled = false
        }else{counter -= 1}
        count.text = "\(counter)"
        
        yemekdetayFiyat.text = " \(counter * Int(yemek?.yemekFiyat ?? "0")!) ₺"
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        counter += 1
        count.text = "\(counter)"
        minusButtonOut.isEnabled = true
        if let ydata = yemek{
            yemekdetayFiyat.text = " \(counter * Int(ydata.yemekFiyat!)!)  ₺"
            
        }
    }
    
    @IBAction func sepeteEkle(_ sender: Any) {
        if let ydata = yemek, counter != 0{
            let alert = UIAlertController(title: "SEPET ", message: "\(counter) adet \(ydata.yemekAdi!) sepete ekleniyor?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Devam", style: .default){ action in
                self.yemekDetayPresenterNesnesi?.ekle(yemek_adi: ydata.yemekAdi!, yemek_resim_adi: ydata.yemekResimAdi!, yemek_fiyat: self.counter*Int(ydata.yemekFiyat!)!, yemek_siparis_adet: self.counter, kullanici_adi: "mustafa_gorgun")
                
            })
            alert.addAction(UIAlertAction(title: "İptal", style: .destructive){ action in})
            self.present(alert, animated: true)

        }
        
    }
}

