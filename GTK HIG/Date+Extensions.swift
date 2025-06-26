//
//  Date+Extensions.swift
//  GTK HIG
//
//  Created by Muhammad Irfan on 26/06/25.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy, HH:mm"
        return formatter.string(from: self)
    }
}
