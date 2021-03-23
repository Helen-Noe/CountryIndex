//
//  CountryCell.swift
//  CountryIndex
//
//  Created by Thin Myat Noe on 23/3/21.
//

import UIKit

class CountryCell: UITableViewCell {
	
	var countryName = UILabel()
	var isoCode = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubview(countryName)
		addSubview(isoCode)
		
		setCountryNameConstraints()
		setiSOCodeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func set(country: Country){
		countryName.text = "Country Name: \(country.countryName)"
		isoCode.text = "ISO Code: \(country.isoCode)"
	}
	
	func setCountryNameConstraints(){
		countryName.translatesAutoresizingMaskIntoConstraints 									= false
		countryName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive 	= true
		countryName.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive 	= true
	}
	
	func setiSOCodeConstraints(){
		isoCode.translatesAutoresizingMaskIntoConstraints 									= false
		isoCode.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive 	= true
		isoCode.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 5).isActive = true
	}
	
}

//extension CountryListVC{
//
//	func fetchData() -> [Country]{
//		if let url = URL(string: "https://uat-web.automic.com.au/er/public/api/countries"){
//			let session = URLSession(configuration: .default)
//			let task = session.dataTask(with: url) { (data, response, error) in
//				if error != nil{
//					print(error!)
//					return
//				}
//
//				if let safeData = data {
//					self.parseJSON(countryData: safeData)
//				}
//			}
//			task.resume()
//		}
		
		
		
		
		
		
//		let country1 = Country(countryName: "Myanmar", isoCode: "MYN")
//		let country2 = Country(countryName: "Australia", isoCode: "AUS")
//
//		return [country1, country2]
//	}
	
//	func parseJSON(countryData: Data) -> [Country]{
//		let decoder = JSONDecoder()
//		do{
//			let decodedData = try decoder.decode(Country.self, from: countryData)
//			return Country(countryName: decodedData.countryName, isoCode: decodedData.isoCode)
//		} catch{
//			print(error)
//		}
//
//	}
//}
