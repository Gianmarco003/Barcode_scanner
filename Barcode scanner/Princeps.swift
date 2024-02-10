//
//  ContentView.swift
//  Barcode scanner
//
//  Created by Gianmarco on 06/02/24.
//

import SwiftUI

struct Princeps: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                Spacer()
                    .frame(height: 100)
                Label("Scan barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Princeps()
    }
}
