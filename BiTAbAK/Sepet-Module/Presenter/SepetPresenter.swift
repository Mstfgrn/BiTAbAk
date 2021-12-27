//
//  SepetPresenter.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 18.12.2021.
//

import Foundation
class SepetPresenter : ViewToPresenterSepetProtocol{
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetyemekleriYukle(kullanici_adi: String) {
        sepetInteractor?.tumSepetYemekleriAl(kullanici_adi: kullanici_adi)
    }
    
    func sil(sepet_yemek_id: String, kullanici_adi: String) {
        sepetInteractor?.silSepetYemek(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}
extension SepetPresenter: InteractorToPresenterSepetProtocol{
    func presenteraVeriGonder(sepetyemekListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(sepetyemekListesi: sepetyemekListesi)
    }
}
