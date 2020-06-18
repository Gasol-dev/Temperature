//
//  ChartsController.swift
//  Temperature
//
//  Created by Admin on 18.06.2020.
//  Copyright © 2020 Lezya Alexander. All rights reserved.
//

import Foundation
import AAInfographics

class DetailViewController: UIViewController {
    
    private let chartView: AAChartView = {
        let chartView = AAChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()
    
    var currentsModels = [EntryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aaChartModel = AAChartModel()
            .chartType(.spline)
            .animationType(.bounce)
            .title("Sample Data")
            .categories(currentsModels.map { $0.date })
            .colorsTheme(["#7811fe"])
            .series([
                AASeriesElement()
                    .name("Temperature")
                    .data(currentsModels.compactMap { Double($0.temperature) } )])
        
        
        chartView.aa_drawChartWithChartModel(aaChartModel)
        view.addSubview(chartView)
        NSLayoutConstraint.activate([chartView.topAnchor.constraint(equalTo: view.topAnchor),
                                     chartView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     chartView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
}
