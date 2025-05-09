//
//  ContentView.swift
//  AdamTipCalculator
//
//  Created by Adam Reid on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var billTotal = ""
    @State private var tipPercent = 20.0
    
    //calculations
    var tipTotal: Double {
        let bill = Double(billTotal) ?? 0
        return bill * tipPercent / 100
    }
    
    var totalBill: Double {
        (Double(billTotal) ?? 0) + tipTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bill Amount")) {
                    TextField("Enter Tab...", text: $billTotal)
                        .keyboardType(.decimalPad)
                }
                Section(header:  Text("Preferred Tip Percent")) {
                    Slider(value: $tipPercent, in: 10...25, step: 2.5)
                    Text("Tip Percent: \(tipPercent)%")
                }
                //Calc results
                Section(header: Text("Calculations")) {
                    Text("Tip: $\(tipTotal, specifier: "%.2f")")
                    Text("Total: $\(totalBill, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Adam's Tip Calculator")
        }
    }
}
        

#Preview {
    ContentView()
}

