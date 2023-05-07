//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/10/22.
//

import SwiftUI

// MARK: Info Cards And Sample Data
public struct InfoCardItem: Identifiable {
    public var id: String = UUID().uuidString
    public var title: String
    public var amount: String
    public var percentage: Int
    public var loss: Bool = false
    public var icon: String
    public var iconColor: Color
    
    static var demo: InfoCardItem {
        InfoCardItem(title: "Expenses",
                     amount: "$2500.00",
                     percentage: 54,
                     icon: "house.fill",
                     iconColor: .green)
    }
}

public struct InfoCardView: View {
    var info: InfoCardItem
    
    public init(info: InfoCardItem) {
        self.info = info
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 15){
                Text(info.title)
                    .font(.title3.bold())
                
                Spacer()
                
                HStack(spacing: 8) {
                    Image(systemName: info.loss ? "arrow.down" : "arrow.up")
                    Text("\(info.percentage)%")
                }
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(info.loss ? .red : .green)
            }
            
            HStack(spacing: 18) {
                Image(systemName: info.icon)
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background {
                        Circle()
                            .fill(info.iconColor)
                    }
                
                Text(info.amount)
                    .font(.title.bold())
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
    }
}

    struct InfoCardView_Previews: PreviewProvider {
        static var previews: some View {
            InfoCardView(info: InfoCardItem.demo)
        }}
}
