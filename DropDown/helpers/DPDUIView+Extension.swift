//
//  UIView+Constraints.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

import UIKit

//MARK: - Constraints

internal extension UIView {
	//添加约束
	func addConstraints(format: String, options: NSLayoutConstraint.FormatOptions = [], metrics: [String: AnyObject]? = nil, views: [String: UIView]) {
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: metrics, views: views))
	}
	//添加通用的约束
	func addUniversalConstraints(format: String, options: NSLayoutConstraint.FormatOptions = [], metrics: [String: AnyObject]? = nil, views: [String: UIView]) {
        //水平
		addConstraints(format: "H:\(format)", options: options, metrics: metrics, views: views)
        //垂直
		addConstraints(format: "V:\(format)", options: options, metrics: metrics, views: views)
	}
	
}



//MARK: - Bounds

internal extension UIView {
	//转成相对于父视图的Frame
	var windowFrame: CGRect? {
		return superview?.convert(frame, to: nil)
	}
	
}

internal extension UIWindow {
	
	static func visibleWindow() -> UIWindow? {
        //keyWindow
		var currentWindow = UIApplication.shared.keyWindow
		
		if currentWindow == nil {
            //反转
			let frontToBackWindows = Array(UIApplication.shared.windows.reversed()) 
			
			for window in frontToBackWindows {
                //normal的window
				if window.windowLevel == UIWindow.Level.normal {
					currentWindow = window
					break
				}
			}
		}
		
		return currentWindow
	}
	
}
