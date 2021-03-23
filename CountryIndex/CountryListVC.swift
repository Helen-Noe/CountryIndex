//
//  CountryListVC.swift
//  CountryIndex
//
//  Created by Thin Myat Noe on 23/3/21.
//

import UIKit

class CountryListVC: UIViewController {

	var tableView = UITableView()
	var countries: [Country] = []
	var countryManager = CountryManager()
	let searchBar = UISearchBar()
	
	struct Cells{
		static let countryCell = "CountryCell"
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		countryManager.fetchData()
		
//		countries = fetchData()  // ****
		configureTableView()
		configureNavBar()
		configureSearchBar()
    }
	
	// helper func for selector
	@objc func handleShowSearchBar(){
		search(shouldShow: true)
		searchBar.becomeFirstResponder()
	}
	
	// search bar func
	func showSearchBarButton(shouldShow: Bool){
		if shouldShow{
			navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
		}else{
			navigationItem.rightBarButtonItem = nil
		}
	}
	func search(shouldShow: Bool){
		showSearchBarButton(shouldShow: !shouldShow)
		searchBar.showsCancelButton = shouldShow
		navigationItem.titleView = shouldShow ? searchBar : nil
	}
	
	// configure UI
	func configureSearchBar(){
		setSearchBarDelegates()
		showSearchBarButton(shouldShow: true)
		searchBar.sizeToFit()
	}
	
	func configureTableView(){
		view.addSubview(tableView)
		
		// set delegate
		setTableViewDelegates()
		
		// set row height
		tableView.rowHeight = 90
		
		// register cells
		tableView.register(CountryCell.self, forCellReuseIdentifier: Cells.countryCell)
		
		// set constraints
		tableView.pin(superView: view)
	}
	func configureNavBar(){
		navigationItem.title = "Country Index"
		navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.4745098054, blue: 0.4745098054, alpha: 1)
//		navigationController?.navigationBar.isTranslucent = false
//		navigationController?.navigationBar.barStyle = .black
		
	}
	
	// set delegates
	func setTableViewDelegates(){
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	func setSearchBarDelegates(){
		searchBar.delegate = self
	}

}

// MARK: - UITableViewDelegate, DataSource

extension CountryListVC: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return countries.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: Cells.countryCell) as! CountryCell
		let country = countries[indexPath.row]
		cell.set(country: country)
		
		return cell
	}
	
	
}

// MARK: - UISearchBarDelegate

extension CountryListVC: UISearchBarDelegate {
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		search(shouldShow: false)
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
	}

}
