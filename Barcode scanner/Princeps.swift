//
//  ContentView.swift
//  Barcode scanner
//
//  Created by Gianmarco on 06/02/24.
//

import SwiftUI

struct Princeps: View {
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                Spacer()
                    .frame(height: 100)
                Label("Scan barrcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text("Not yet scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }.navigationTitle("Barcode scanner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Princeps()
    }
}
