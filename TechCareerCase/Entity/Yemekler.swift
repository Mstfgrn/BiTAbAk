//
//  Yemekler.swift
//  TechCareerCase
//
//  Created by MstfGrgn on 14.12.2021.
//

import Foundation

// MARK: - Welcome
class YemeklerCevap: Codable {
    let yemekler: [YemeklerCevap]?
    let success: Int?

    init(yemekler: [YemeklerCevap]?, success: Int?) {
        self.yemekler = yemekler
        self.success = success
    }
}

// MARK: - Yemekler
class Yemekler: Codable {
    let yemekID, yemekAdi, yemekResimAdi, yemekFiyat: String?

    enum CodingKeys: String, CodingKey {
        case yemekID = "yemek_id"
        case yemekAdi = "yemek_adi"
        case yemekResimAdi = "yemek_resim_adi"
        case yemekFiyat = "yemek_fiyat"
    }

    init(yemekID: String?, yemekAdi: String?, yemekResimAdi: String?, yemekFiyat: String?) {
        self.yemekID = yemekID
        self.yemekAdi = yemekAdi
        self.yemekResimAdi = yemekResimAdi
        self.yemekFiyat = yemekFiyat
    }
}
