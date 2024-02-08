//
//  ContentView.swift
//  Barcode scanner
//
//  Created by Gianmarco on 06/02/24.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid device input",
                                              message: "Something wrong with the camera.",
                                              dismissButton: .default(Text("Ok")))
    static let invalidScannedType = AlertItem(title: "Invalid scan type",
                                              message: "Value scanned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismissButton: .default(Text("Ok")))
}

struct Princeps: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                Spacer()
                    .frame(height: 100)
                Label("Scan barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not yet scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode scanner")
            .alert(item: $alertItem) { alertItem in
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
