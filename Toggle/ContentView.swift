//
//  ContentView.swift
//  Toggle
//
//  Created by Amir on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.item, id: \.id) { item in
                    HStack {
                        segment(item: item, viewModel: viewModel)
                        toggle(item: item, viewModel: viewModel)
                    }
                }
            }
        }
        .padding()
    }
}

func segment(item: Config, viewModel: Updatable) -> some View {
    Picker("", selection: Binding<Int>(
        get: {item.option},
        set: {
            item.option = $0
            viewModel.updateModel(row: item)
        })) {
        Text("0").tag(0)
        Text("1").tag(1)
        Text("2").tag(2)
    }
    .pickerStyle(.segmented)
}

func toggle(item: Config, viewModel: Updatable) -> some View {
    Toggle(isOn: Binding<Bool>(
        get: {item.toggle},
        set: {
            item.toggle = $0
            viewModel.updateModel(row: item)
        }), label: {})
}

#Preview {
    ContentView()
}
