//
//  ContentView.swift
//  Product
//
//  Created by 若生優希 on 2023/01/14.
//


import SwiftUI

struct ContentView: View {
    @State var selectedTag = 1
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedTag) {
                ZStack{
                    HomeTabView().tag(1)
                    CardModalView()
                }
                WeatherTabView().tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
        }
    }
}





















struct CardModalView: View {
    @State private var offsets = (top: CGFloat.zero, middle: CGFloat.zero, bottom: CGFloat.zero)
    @State private var offset: CGFloat = .zero
    @State private var lastOffset: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 30) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 5)
                Text("CardModal")
                    .font(.largeTitle)
                Spacer()
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.yellow)
            .animation(.interactiveSpring())
            .onAppear {
                self.offsets = (
                    top: .zero,
                    middle: geometry.size.height / 2,
                    bottom: geometry.size.height * 9 / 10
                )
                self.offset = self.offsets.bottom
                self.lastOffset = self.offset
            }
            .offset(y: self.offset)
            .gesture(DragGesture(minimumDistance: 5)
                .onChanged { v in
                    let newOffset = self.lastOffset + v.translation.height
                    if (newOffset > self.offsets.top && newOffset < self.offsets.bottom) {
                        self.offset = newOffset
                    }
                }
                .onEnded{ v in
                    if (self.lastOffset == self.offsets.top && v.translation.height > 0) {
                        if (v.translation.height < geometry.size.height / 2) {
                            self.offset = self.offsets.middle
                        } else {
                            self.offset = self.offsets.bottom
                        }
                    } else if (self.lastOffset == self.offsets.middle) {
                        if (v.translation.height < 0) {
                            self.offset = self.offsets.top
                        } else {
                            self.offset = self.offsets.bottom
                        }
                    } else if (self.lastOffset == self.offsets.bottom && v.translation.height < 0) {
                        if (abs(v.translation.height) > geometry.size.height / 2) {
                            self.offset = self.offsets.top
                        } else {
                            self.offset = self.offsets.middle
                        }
                    }
                    self.lastOffset = self.offset
                }
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeTabView: View {
    @State var isModal: Bool = false
    var body: some View {
            VStack {
                Image(systemName: "music.note.house")
                    .scaleEffect(x: 3.0, y: 3.0)
                    .frame(width: 100, height: 100)
                Text("HOME").font(.system(size: 20))
                Text("まつもとぱいせん")
                    .font(.system(size: 100))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.5, green: 0.9, blue: 0.9))
            .ignoresSafeArea()
        }
}

struct SomeView: View {
    var body: some View {
        Text("おためし")
            .presentationDetents([.medium])
    }
}

struct WeatherTabView: View {
    var body: some View {
        VStack {
            Button(action: {
                // Do something
            }) {
                Image(systemName: "pencil")
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            Button(action: {
                // Do something
            }) {
                Image(systemName: "pencil")
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            Button(action: {
                // Do something
            }) {
                Image(systemName: "pencil")
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            Button(action: {
                // Do something
            }) {
                Image(systemName: "pencil")
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            Button(action: {
                // Do something
            }) {
                Image(systemName: "pencil")
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 1.0, green: 0.9, blue: 1.0))
        .ignoresSafeArea()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
