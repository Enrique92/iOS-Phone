//
//  ViewController.swift
//  Assignment9
//
//  Created by Enrique on 2019-05-08.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ViewController: UIViewController {
    
    let frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    
    // Compose the graph view by creating a graph, then adding any plots
    // and reference lines before adding the graph to the view hierarchy.
    let graphView = ScrollableGraphView(frame: frame, dataSource: self)
    
    let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
    let referenceLines = ReferenceLines()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.addPlot(plot: linePlot)
        graphView.addReferenceLines(referenceLines: referenceLines)
        
        // Add the graph
        view.addSubview(graphView)
    }

    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        // Return the data for each plot.
        switch(plot.identifier) {
        case "line":
            return linePlotData[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
        return numberOfDataPointsInGraph
    }

}

