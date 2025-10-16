//
//  ContentView.swift
//  helloWorld
//
//  Created by Adharsh N Jose on 13/10/25.
//

import SwiftUI
extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth:128)
            .foregroundColor(.green)
            .opacity(0.5)
    }
}
struct ContentView: View {
    private let imageUrl: String = "https://i.ytimg.com/vi/U66wCjr88tc/maxresdefault.jpg"
    var body: some View {
        //MARK: - 1. Basic
//        AsyncImage(url: URL(string:imageUrl))
        
        //Mark: -2.scale
//        AsyncImage(url: URL(string: imageUrl),scale: 3.5)
        
       //MARK: 3. PLACEHOLDER
//        AsyncImage(url: URL(string: imageUrl)){
//            image in image.imageModifier()
//                
//        } placeholder :{
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(40)
        
        //MARK 4. PHASE
//        VStack {
//                   // MARK: - AsyncImage with Phase Handling
//                   AsyncImage(url: URL(string: imageUrl)) { phase in
//                       switch phase {
//                       case .success(let image):
//                           image
//                               .imageModifier()
//                               .onAppear { print("✅ Image loaded successfully") }
//
//                       case .failure(let error):
//                           Image(systemName: "ant.circle.fill")
//                               .iconModifier()
//                               .onAppear { print("❌ Failed: \(error.localizedDescription)") }
//
//                       case .empty:
//                           Image(systemName: "photo.circle.fill")
//                               .iconModifier()
//                               .onAppear { print("⏳ Loading...") }
//
//                       @unknown default:
//                           Image(systemName: "questionmark.circle.fill")
//                               .iconModifier()
//                               .onAppear { print("⚠️ Unknown phase") }
//                       }
//                   }
//                   .padding(40)
//               }
        // MARK: 5. Animation
        AsyncImage(url: URL(string:imageUrl), transaction: Transaction(animation:Animation.snappy(duration: 1))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.move(edge: .bottom))
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                  ProgressView()
            }
        }
        .padding(40)
        
        Text("Async image and animations")
            .bold()
            .fontWeight(.heavy)
            .foregroundStyle(.red)
    }

}

#Preview {
    ContentView()
}
