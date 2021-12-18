//
//  SepetProtocol.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 18.12.2021.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepetyemekleriYukle(kullanici_adi: String)
    func sil(sepet_yemek_id: String, kullanici_adi: String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func tumSepetYemekleriAl(kullanici_adi: String)
    func silSepetYemek(sepet_yemek_id: String, kullanici_adi: String)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetyemekListesi:Array<SepetYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetyemekListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVc)
}
