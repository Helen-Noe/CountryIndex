//
//  CountryManager.swift
//  CountryIndex
//
//  Created by Thin Myat Noe on 23/3/21.
//

import Foundation

struct CountryManager{
	
	let urlString = "https://uat-web.automic.com.au/er/public/api/countries"
	
	func fetchData(){
		let url = URL(string: urlString)!
		let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
			guard  let data = data else {
				print("No data available")
				return
			}
			
			guard let countries = try? JSONDecoder().decode(CountryList.self, from: data) else{
				print("Cannot decode data")
				return
			}
			
			print(countries.country)
		}
		task.resume()
	}
	
}
