//
//  Color+Extensions.swift
//  
//
//  Created by Vince Davis on 10/11/22.
//

import SwiftUI

//extension Color {
//    init(
//        light lightModeColor: @escaping @autoclosure () -> Color,
//        dark darkModeColor: @escaping @autoclosure () -> Color
//    ) {
//        self.init(UIColor(
//            light: UIColor(lightModeColor()),
//            dark: UIColor(darkModeColor())
//        ))
//    }
//    
//    static var main: Self {
//        Self(light: .black,
//             dark: .white)
//        }
//    
//    static var mainReversed: Self {
//        Self(light: .white,
//             dark: .black)
//        }
//}
//
//extension UIColor {
//    convenience init(
//        light lightModeColor: @escaping @autoclosure () -> UIColor,
//        dark darkModeColor: @escaping @autoclosure () -> UIColor
//     ) {
//        self.init { traitCollection in
//            switch traitCollection.userInterfaceStyle {
//            case .light:
//                return lightModeColor()
//            case .dark:
//                return darkModeColor()
//            case .unspecified:
//                return lightModeColor()
//            @unknown default:
//                return lightModeColor()
//            }
//        }
//    }
//}
//
//struct AdaptiveForegroundColorModifier: ViewModifier {
//    var lightModeColor: Color
//    var darkModeColor: Color
//    
//    @Environment(\.colorScheme) private var colorScheme
//    
//    func body(content: Content) -> some View {
//        content.foregroundColor(resolvedColor)
//    }
//    
//    private var resolvedColor: Color {
//        switch colorScheme {
//        case .light:
//            return lightModeColor
//        case .dark:
//            return darkModeColor
//        @unknown default:
//            return lightModeColor
//        }
//    }
//}
//
//extension View {
//    func foregroundColor(
//        light lightModeColor: Color,
//        dark darkModeColor: Color
//    ) -> some View {
//        modifier(AdaptiveForegroundColorModifier(
//            lightModeColor: lightModeColor,
//            darkModeColor: darkModeColor
//        ))
//    }
//}

