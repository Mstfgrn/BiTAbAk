//
//  SepetInteractor.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 18.12.2021.
//

import Foundation
import Alamofire

class SepetInteractor: PresenterToInteractorSepetProtocol{
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    var sepetliste = [SepetYemekler]()
    
    func tumSepetYemekleriAl(kullanici_adi: String) {
        let params: Parameters = ["kullanici_adi":kullanici_adi]
        
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON{ response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemekCevap.self, from: data)
                    if let gelenListe = cevap.sepetYemekler {
                        self.sepetliste = gelenListe
                    }
                    self.sepetPresenter?.presenteraVeriGonder(sepetyemekListesi: self.sepetliste)
                }catch{
                    self.sepetPresenter?.presenteraVeriGonder(sepetyemekListesi: [SepetYemekler]())
                }
            }
        }

    }

    func silSepetYemek(sepet_yemek_id: String, kullanici_adi: String) {
        let params: Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{ response in
            
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        DispatchQueue.main.async {
                            self.tumSepetYemekleriAl(kullanici_adi: kullanici_adi)
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}


