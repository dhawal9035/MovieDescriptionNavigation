//
//  AddMovieController.swift
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

class AddMovieController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var releasedTF: UITextField!
    @IBOutlet weak var runTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!
    @IBOutlet weak var genreTF: UITextField!
    @IBOutlet weak var actorTF: UITextField!
    @IBOutlet weak var plotTF: UITextField!
    @IBOutlet var genrePicker: UIPickerView!
    
    var movieTable: MovieTableController?
    var movies:[String : MovieDescription] = [String:MovieDescription]()
    var genreArray : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for eachMovie in self.movies as [String:MovieDescription]{
            let x : MovieDescription = eachMovie.1
            
            var genreAR = (x.genre as String).characters.split(",")
            if (genreAR.count > 1){
                for each in genreAR {
                    if (!self.genreArray.containsObject(String(each))){
                        let str : String = String(each)
                        self.genreArray.addObject(str as String)
                    }
                    
                }
            }else{
                if (self.genreArray.containsObject(String(genreAR[0]))) {
                    
                }else if(self.genreArray.containsObject(" \(String(genreAR[0]))")){
                    
                }
                else{
                    self.genreArray.addObject(String(genreAR[0]))
                }
            }
        }
        
        self.genrePicker = UIPickerView()
        self.genrePicker.delegate = self
        self.genrePicker.dataSource = self
        self.genreTF.inputView = self.genrePicker
        self.title = "Add Movie"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.titleTF.resignFirstResponder()
        self.releasedTF.resignFirstResponder()
        self.yearTF.resignFirstResponder()
        self.ratingTF.resignFirstResponder()
        self.runTF.resignFirstResponder()
        self.plotTF.resignFirstResponder()
        self.actorTF.resignFirstResponder()
        self.genreTF.resignFirstResponder()
        self.ratingTF.resignFirstResponder()
    }
    
    
    

    @IBAction func buttonClicked(sender: AnyObject) {
        let dict : NSDictionary = NSDictionary()
        let md : MovieDescription = MovieDescription(jsonStr: dict)
        md.title = self.titleTF.text! as String
        md.year = self.yearTF.text! as String
        md.runTime = self.runTF.text! as String
        md.released = self.releasedTF.text! as String
        md.actors = self.actorTF.text! as String
        md.plot = self.plotTF.text! as String
        md.genre = self.genreTF.text! as String
        md.rated = self.ratingTF.text! as String
        
        self.movies[md.title] = md
        self.movieTable?.movies = self.movies
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // functions for the picker view delegate and datasource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreArray.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreArray[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genreTF.text = genreArray[row] as? String
        self.genreTF.resignFirstResponder()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
