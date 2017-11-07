//
//  ViewController.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 06.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var weatherViewModel : WeatherViewModel?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkManager = NetworkManager()
        self.weatherViewModel = WeatherViewModel(networkManager: networkManager)
        // Do any additional setup after loading the view, typically from a nib.
        weatherViewModel?.cityName.bind(to: cityNameLabel.rx.text)
        .addDisposableTo(disposeBag)
        
        weatherViewModel?.degrees.bind(to: degreesLabel.rx.text)
        .addDisposableTo(disposeBag)
        
        weatherViewModel?.wind.bind(to: windLabel.rx.text)
        .addDisposableTo(disposeBag)
        
        weatherViewModel?.descriptionLabel.bind(to: descriptionLabel.rx.text)
        .addDisposableTo(disposeBag)
        
        self.nameTextField.rx.text.subscribe (onNext: { text in
            self.weatherViewModel?.searchText.onNext(text!)
        })
        //NetworkManager().getInfoWeather(query: "Kaliningrad")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

