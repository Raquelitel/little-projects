//
//  MyAppProgress.swift
//  little-projects
//
//  Created by Raquel on 31/5/23.
//

import SwiftUI

struct MyAppProgress: View {
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                MyProgressView(progress: progress)
                Text("\(progress * 100, specifier: "%.0f")%")
                    .font(.largeTitle)
                    .bold()
            }.frame(width: 200, height: 200)
            Spacer()
            HStack {
                Button("Add") {
                    sumProgress()
                }.buttonStyle(.borderedProminent)
                Slider(value: $progress, in: 0...1)
                Button("Remove") {
                    restProgress()
                }.buttonStyle(.borderedProminent)
                    .tint(.red)
            }.padding()
        }
    }
    
    func restProgress() {
        if(progress>0.1) {
            progress -= 0.1
        }

    }
    func sumProgress() {
        if(progress < 0.9) {
            progress += 0.1
        }
    }
 }

struct MyAppProgress_Previews: PreviewProvider {
    static var previews: some View {
        MyAppProgress()
    }
}
