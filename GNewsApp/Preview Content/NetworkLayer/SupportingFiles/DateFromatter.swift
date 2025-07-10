//
//  DateFromatter.swift
//  GNewsApp
//
//  Created by Suresby on 09/07/25.
//
import Foundation

func convertUTCtoLocal(utcDateString: String) -> String? {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // adjust format to your input string
    inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
    // Convert string to Date
    guard let date = inputFormatter.date(from: utcDateString) else {
        return nil
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "MMM d, yyyy h:mm a" // your desired output format
    outputFormatter.timeZone = TimeZone.current // local time zone
    
    // Convert Date to local string
    let localDateString = outputFormatter.string(from: date)
    return localDateString
}

