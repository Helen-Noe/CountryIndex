//
//  Country.swift
//  CountryIndex
//
//  Created by Thin Myat Noe on 23/3/21.
//

import Foundation

struct CountryList: Codable{
	let country: [Country]
}


struct Country: Codable {
	let isoCode: String
	let isoCode2: String
	let countryName: String
	
}
