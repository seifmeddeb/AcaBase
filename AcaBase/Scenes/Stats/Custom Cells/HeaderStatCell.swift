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
    @IBOutlet weak var pieChartView: PieChartView!
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    var currentStatIndex = 0
    var labels : [String]!
    
    func setup(viewModel: StatViewModel, index: Int) {
        
        self.currentStatIndex = index
        
        let chartEntry = viewModel.chartEntries[currentStatIndex]
        
        durationLbl.text = "\(chartEntry.title)"
        
        switch chartEntry {
            case .line(let labels, let values):
                axisFormatDelegate = self
                self.labels = labels
                setLineChart(dataEntryX: labels, dataEntryY: values)
                chartView.isHidden = false
                pieChartView.isHidden = true
            case .hologram(let labels, let values):
                setPieChart(dataEntryX: labels, dataEntryY: values)
                chartView.isHidden = true
                pieChartView.isHidden = false
        }
        
    }
    
    func setLineChart(dataEntryX forX:[String], dataEntryY forY: [Double]) {
        chartView.noDataText = "Pas de données pour le moment 😢"
        var dataEntries:[ChartDataEntry] = []
        for i in 0..<forX.count{
            // print(forX[i])
            // let dataEntry = BarChartDataEntry(x: (forX[i] as NSString).doubleValue, y: Double(unitsSold[i]))
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(forY[i]) , data: forX[i] as AnyObject?)
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Questions")
        chartDataSet.fillColor = primaryBlue
        chartDataSet.colors = [primaryBlue]
        chartDataSet.highlightColor = primaryBlue
        chartDataSet.lineWidth = 2.0
        chartDataSet.drawValuesEnabled = false
        chartDataSet.circleColors = [primaryBlue]
        chartDataSet.circleRadius = 4.0
        chartDataSet.mode = .cubicBezier
        let chartData = LineChartData(dataSet: chartDataSet)
        chartData.setValueFont(UIFont(name: "Roboto-Medium", size: 10) ?? UIFont.systemFont(ofSize: CGFloat(10)))
        
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
 
    func setPieChart(dataEntryX forX:[String], dataEntryY forY: [Double]) {
        chartView.noDataText = "Pas de données pour le moment 😢"
        var dataEntries:[PieChartDataEntry] = []
        for i in 0..<forX.count {
            // print(forX[i])
            // let dataEntry = BarChartDataEntry(x: (forX[i] as NSString).doubleValue, y: Double(unitsSold[i]))
            let dataEntry = PieChartDataEntry(value: Double(forY[i]) , data: forX[i] as AnyObject?)
            dataEntry.label = forX[i]
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        chartDataSet.colors = pieChartColors
        chartDataSet.valueColors = [.black]
        chartDataSet.valueTextColor = NSUIColor.black
        chartDataSet.entryLabelColor = NSUIColor.clear
        chartDataSet.drawValuesEnabled = false
        chartDataSet.valueFormatter = BarValueFormatter()
        
        let chartData = PieChartData(dataSet: chartDataSet)
        chartData.setDrawValues ( true )
        chartData.setValueTextColor(  NSUIColor.black )
        chartData.setValueFont(UIFont(name: "Roboto-Medium", size: 10) ?? UIFont.systemFont(ofSize: CGFloat(10)))
        
        let l = pieChartView.legend
        l.font = UIFont(name: "Roboto-Medium", size: 10) ?? UIFont.systemFont(ofSize: CGFloat(10))
        l.yEntrySpace = 0
        
        pieChartView.data = chartData
        
        pieChartView.borderColor = primaryBlue
        pieChartView.animate(xAxisDuration: 0.5, yAxisDuration: 0.5, easingOption: .easeInBounce)
    }
    
    
}

extension HeaderStatCell : IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "\(labels[Int(value)])"
    }
}

class BarValueFormatter : NSObject, IValueFormatter {

    // This method is  called when a value (from labels inside the chart) is formatted before being drawn.
    func stringForValue(_ value: Double,
                        entry: ChartDataEntry,
                        dataSetIndex: Int,
                        viewPortHandler: ViewPortHandler?) -> String {
        let digitWithoutFractionValues = String(format: "%.0f", value)
        return digitWithoutFractionValues
    }

}
