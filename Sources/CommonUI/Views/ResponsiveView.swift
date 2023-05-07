//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 10/17/22.
//

import SwiftUI

// MARK: Custom View Which will Give Useful Properties for Adpotable UI
//public struct ResponsiveView<Content: View>: View {
//    var content: (ResponsiveProperties) -> Content
//    
//    public init(@ViewBuilder content: @escaping (ResponsiveProperties) -> Content) {
//        self.content = content
//    }
//    
//    public var body: some View {
//        GeometryReader { proxy in
//            let size = proxy.size
//            let isLandscape = size.width > size.height
//            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
//            let isMaxSplit = isSplit() && size.width < 400
//            
//            // MARK: In Vertical Hiding Side Bar Completely
//            // In Horizontal Showing Side bar for 0.75 Fraction
//            
//            let isAdoptable = isIpad && (isLandscape ? !isMaxSplit : !isSplit())
//            let properties = ResponsiveProperties(isLandscape: isLandscape, isiPad: isIpad, isSplit: isSplit(), isMaxSplit: isMaxSplit,isAdoptable: isAdoptable, size: size)
//            
//            content(properties)
//                .frame(width: size.width, height: size.height)
//        }
//    }
//    
//    // MARK: Simple Way to Find it the app is in Split View
//    func isSplit() -> Bool {
//        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return false}
//        return screen.windows.first?.frame.size != screen.screen.bounds.size
//    }
//}

//struct ResponsiveView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

public struct ResponsiveProperties {
    var isLandscape: Bool
    var isiPad: Bool
    var isSplit: Bool
    // MARK: If the App size is reduced more than 1/3 in split mode on iPad
    var isMaxSplit: Bool
    var isAdoptable: Bool
    var size: CGSize
}
