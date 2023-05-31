//
//  MyProgressView.swift
//  little-projects
//
//  Created by Raquel on 31/5/23.
//

import SwiftUI

struct MyProgressView: View {
    
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
    
//    @State private var progress = 0.0
//
//    var body: some View {
//        Button("+") {
//            if progress < 1.0 {
//                withAnimation {
//                    progress += 0.2
//                }
//            }
//        }
//        ZStack{
//            ProgressView(value: progress, total: 1.0)
//                .progressViewStyle(GaugeProgressStyle())
//                .frame(width: 200, height: 200)
//                .contentShape(Rectangle())
//        }
//
//    }
}

//struct GaugeProgressStyle: ProgressViewStyle {
//    var strokeColor = Color.blue
//    var strokeWidth = 25.0
//
//    func makeBody(configuration: Configuration) -> some View {
//        let fractionCompleted = configuration.fractionCompleted ?? 0
//
//        return ZStack {
//            Circle()
//                .trim(from: 0, to: fractionCompleted)
//                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//
//        }
//    }
//}

//
//
//struct MyProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyProgressView()
//    }
//}
