//
//  MovieDescription.swift
//  MovieDescriptionNavigation
//  Copyright 2016 Dhawal Soni
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  Created by dssoni on 2/22/16.
//  Copyright © 2016 dssoni. All rights reserved.
//

import Foundation

public class MovieDescription{
    var title: String
    var year: String
    var rated: String
    var released:String
    var runTime:String
    var genre:String
    var actors:String
    var plot:String
    init (jsonStr: NSDictionary){
        self.title = ""
        self.year=""
        self.rated=""
        self.released=""
        self.runTime=""
        self.genre=""
        self.actors=""
        self.plot=""
        // prevent the error when adding the string
        if(jsonStr.count > 0){
            self.title = (jsonStr["Title"] as? String)!
            self.year = (jsonStr["Year"] as? String)!
            self.rated = (jsonStr["Rated"] as? String)!
            self.released = (jsonStr["Released"] as? String)!
            self.runTime = (jsonStr["Runtime"] as? String)!
            self.genre = (jsonStr["Genre"] as? String)!
            self.actors = (jsonStr["Actors"] as? String)!
            self.plot = (jsonStr["Plot"] as? String)!
        }
    }
}
