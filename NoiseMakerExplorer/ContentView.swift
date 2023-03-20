//
//  ContentView.swift
//  NoiseExplorer
//
//  Created by Carlyn Maw on 3/10/23.
//

import SwiftUI
import Charts
import NoiseMaker
import SwiftLIBPNG

struct ContentView: View {
    let myVals = NoiseMaker.blurredRandomArray(count: 16, octaves: 8, scalingBias: 1)
    let my2DVals = NoiseMaker.blurredRandomBuffer2D(width: 16, height: 16, octaves: 8, scalingBias: 1)
    let testInt = 123
    
    var body: some View {
        VStack {
            Chart(Array(myVals.enumerated()), id: \.offset) { item in
                LineMark(x: .value("index", item.offset), y: .value("value", item.element))
                
            }

            Button("Print 2d") {
                print2D()
            }
            Button("Verify libpng") {
                version()
            }
            Button("Test Image Creation") {
                testPNGCreation()
            }
        }
        .padding()
    }
    
    func print2D() {
        my2DVals.asciiBWPrint()
        let noise = NoiseMaker.perlinWrapper(x: Double.random(in: 0...1), y: Double.random(in: 0...1))
        print("\nperlin: \(noise)")
    }
    
    func version() {
        print("version")
        SwiftLIBPNG.version()
    }
    
    func testPNGCreation() {
        let _ = SwiftLIBPNG.makeTestImage(width:200, height:200, red:102, green:153, blue:204)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
