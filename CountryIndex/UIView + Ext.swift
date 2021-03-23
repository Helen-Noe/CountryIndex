//
//  UIView + Ext.swift
//  CountryIndex
//
//  Created by Thin Myat Noe on 23/3/21.
//

import UIKit

extension UIView{
	func pin (superView: UIView){
		translatesAutoresizingMaskIntoConstraints							= false
		topAnchor.constraint(equalTo: superView.topAnchor).isActive 		= true
		leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
		trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
		bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive	= true
	}
}
