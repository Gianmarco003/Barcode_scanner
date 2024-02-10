//
//  BarcodeScannerViewModel.swift
//  Barcode scanner
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
}
