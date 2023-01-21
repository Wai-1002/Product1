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
                    HomeTabView().tag(1)
                WeatherTabView().tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
        }
    }
}

struct HomeTabView: View {
    @State var isModal: Bool = true
    var body: some View {
            VStack {
                Image(systemName: "music.note.house")
                    .scaleEffect(x: 3.0, y: 3.0)
                    .frame(width: 100, height: 100)
                Text("ここにカレンダーを入れる").font(.system(size: 20))
                Button(action:{
                    isModal = true
                }) {
                    Text("test")
                }
                .sheet(isPresented: $isModal){
                    SomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.5, green: 0.9, blue: 0.9))
            .ignoresSafeArea()
        }
}

struct SomeView: View {
    @State var name: String = ""
    var body: some View {
        Text("ここに何してたかを入れる")

        TextField("その他", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 250)
        Text("編集可能のボタンを追加する")
        Text("色分けするボダンを追加する")
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
            Text("ここで分析する")
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
