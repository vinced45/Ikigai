//
//  File.swift
//  
//
//  Created by Vince Davis on 10/12/22.
//

import SwiftUI


public extension NavigationLink where Label == EmptyView, Destination == EmptyView {
  static var empty: NavigationLink {
    self.init(destination: EmptyView(), label: { EmptyView() })
  }
}
