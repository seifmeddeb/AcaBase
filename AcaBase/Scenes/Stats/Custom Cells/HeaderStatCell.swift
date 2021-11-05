//
//  HeaderStatCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 29/9/2021.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit
import Charts

class HeaderStatCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    
    var months: [String]!
    var unitsSold = [Double]()
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    func setup(viewModel: StatViewModel) {
//        durationLbl.text = "\(viewModel.value)"
//        titleLbl.text = viewModel.title
//        logoImageView.image = UIImage(named: viewModel.image)
        
                
        
        if let datas = viewModel.learningPathPerDays {

            axisFormatDelegate = self
            months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
            unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
            setChart(dataEntryX: months, dataEntryY: unitsSold)
        }
        
    }
    
    func setChart(dataEntryX forX:[String], dataEntryY forY: [Double]) {
        chartView.noDataText = "You need to provide data for the chart."
        var dataEntries:[ChartDataEntry] = []
        for i in 0..<forX.count{
            // print(forX[i])
            // let dataEntry = BarChartDataEntry(x: (forX[i] as NSString).doubleValue, y: Double(unitsSold[i]))
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(forY[i]) , data: months[i] as AnyObject?)
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Cours")
        chartDataSet.fillColor = primaryBlue
        chartDataSet.colors = [primaryBlue]
        chartDataSet.highlightColor = primaryBlue
        chartDataSet.lineWidth = 2.0
        chartDataSet.drawValuesEnabled = false
        chartDataSet.circleColors = [primaryBlue]
        chartDataSet.circleRadius = 4.0
        chartDataSet.mode = .cubicBezier
        let chartData = LineChartData(dataSet: chartDataSet)
        
        chartView.rightAxis.enabled = false
        chartView.xAxis.enabled = true
        chartView.borderLineWidth = 2.0
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawAxisLineEnabled = true
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        
        chartView.data = chartData
        chartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        chartView.borderColor = primaryBlue
        chartView.animate(xAxisDuration: 0.03 * Double(forX.count))
        
        let xAxisValue = chartView.xAxis
        xAxisValue.valueFormatter = axisFormatDelegate
        
    }
    
}

extension HeaderStatCell : IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "\(months[Int(value)])"
    }
}
