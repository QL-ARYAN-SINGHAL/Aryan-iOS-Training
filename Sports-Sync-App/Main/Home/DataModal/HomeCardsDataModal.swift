//
//  HomeCardsDataModal.swift
//  Sports-Sync-App
//
//  Created by ARYAN SINGHAL on 24/04/25.
//

import Foundation


struct HomeCardsDataModal:Codable,Hashable {
    

    var imageName : String = ""
    var sportsName : String = ""
    var location : String = ""
    var rating : String = ""
    var description : String  = ""
    var stadiumName : String = ""
    var eventDate : String = ""
    var eventTime : String = ""
    var searchText = ""
   
}
