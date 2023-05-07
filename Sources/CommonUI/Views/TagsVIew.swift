//
//  TagsView.swift
//  
//
//  Created by Vince Davis on 10/10/22.
//

import SwiftUI

public struct TagsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: TagsViewModel
    
    public init(viewModel: TagsViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            VStack {
                TagViewLayout(alignment:.leading, spacing: 10){
                    ForEach($viewModel.tags) { $tag in
                        // MARK: New Toggle API
                        Toggle(tag.name, isOn: $tag.isSelected)
                        #if os(iOS) || os(macOS)
                            .toggleStyle(.button)
                        #endif
                            .buttonStyle(.bordered)
                            .tint(tag.isSelected ? .red : .gray)
                    }
                }
                .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6), value: 0)
                .padding()
                .emptyState($viewModel.tags.isEmpty) {
                    EmptyStateView(modelType: .tag, action: {})
                }
                //.border(.green)
//                .background {
//                    RoundedRectangle(cornerRadius: 15, style: .continuous)
//                        .fill(.white)
//                }
                
                Spacer()
                
                HStack {
                    // MARK: New API
                    // Multi Line TextField
                    TextField("Tag", text: $viewModel.text,axis: .vertical)
                        //.textFieldStyle(.roundedBorder)
                    // Line Limit
                    // If It Exceeds Then It will Enable ScrollView
                        .lineLimit(1...5)
                    
                    Button("Add"){
                        withAnimation(.spring()){
                            viewModel.tags.append(TagItem(name: viewModel.text))
                            viewModel.text = ""
                        }
                    }
                    .buttonStyle(.bordered)
                    #if os(iOS)
                    .buttonBorderShape(.roundedRectangle(radius: 4))
                    #endif
                    .tint(.red)
                    .disabled(viewModel.isDisabled)
                }
                .padding()
            }
            .padding(5)
            .navigationTitle(Text("Add Tags"))
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                NavSaveCancelToolbar(save: {
                    //action(tags.filter({ $0.isSelected == true }))
                    viewModel.selectedTags = viewModel.tags.filter({ $0.isSelected == true })
                    dismiss()
                }, cancel: {
                    dismiss()
                })
            }
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(viewModel: TagsViewModel.preview)
    }
}
