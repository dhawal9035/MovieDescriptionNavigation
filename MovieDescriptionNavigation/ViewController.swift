//
//  ViewController.swift
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

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var runLbl: UILabel!
    @IBOutlet weak var ratedLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var actorTV: UITextView!
    @IBOutlet weak var plotTV: UITextView!
    
    var selectedMovie : String = ""
    var movies:[String : MovieDescription] = [String:MovieDescription]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = selectedMovie
        self.yearLbl.text = (self.movies[self.selectedMovie ]! as MovieDescription).year
        self.releasedLbl.text = (self.movies[self.selectedMovie ]! as MovieDescription).released
        self.ratedLbl.text = (self.movies[self.selectedMovie ]! as MovieDescription).rated
        self.runLbl.text = (self.movies[self.selectedMovie ]! as MovieDescription).runTime
        self.actorTV.text = (self.movies[self.selectedMovie ]! as MovieDescription).actors
        self.plotTV.text = (self.movies[self.selectedMovie ]! as MovieDescription).plot
        self.genreLbl.text = (self.movies[self.selectedMovie]! as MovieDescription).genre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

