//
//  SepetVc.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 14.12.2021.
//

import UIKit

class SepetVc: UIViewController {
    var sepetliste = [SepetYemekler]()
    
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?

    @IBOutlet weak var toplamFiyat: UILabel!
    @IBOutlet weak var sepetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        SepetRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetyemekleriYukle(kullanici_adi: "mustafa_gorgun")
    }

}

extension SepetVc : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetyemekListesi: Array<SepetYemekler>) {
        self.sepetliste = sepetyemekListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}

extension SepetVc : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var sum = 0
        for s in sepetliste {
            sum += Int(s.yemekFiyat!)!
        }
        toplamFiyat.text = "\(sum) ₺"
        return sepetliste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepetliste[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! TableViewCell
        cell.configure(slist: sepet)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            
            let sepet = self.sepetliste[indexPath.row]
            self.sepetPresenterNesnesi?.sil(sepet_yemek_id: sepet.sepetYemekID!, kullanici_adi: sepet.kullaniciAdi!)
            /*for s in self.sepetliste{
                self.sepetPresenterNesnesi?.sil(sepet_yemek_id: s.sepetYemekID!, kullanici_adi: s.kullaniciAdi!)
            }*/
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

