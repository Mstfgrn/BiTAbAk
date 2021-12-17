//
//  YemekDetayProtocol.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 16.12.2021.
//

import Foundation
protocol ViewToPresenterYemekDetayProtocol {
    var yemekDetayInteractor:PresenterToInteractorYemekDetayProtocol? {get set}
    
    func ekle(yemek_id:Int,yemek_ad:String,yemek_tel:String)
}

protocol PresenterToInteractorYemekDetayProtocol {
    func sepeteEkle(yemek_id:Int,yemek_ad:String,yemek_tel:String)
}

protocol PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVc)
}
