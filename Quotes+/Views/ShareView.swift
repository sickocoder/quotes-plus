//
//  ShareView.swift
//  Quotes+
//
//  Created by José Tony on 25/07/23.
//

import SwiftUI

struct ShareView: UIViewControllerRepresentable {
  let activityItems: [Any]
  let applicationActivities: [UIActivity]? = nil
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ShareView>) ->
  UIActivityViewController {
    return UIActivityViewController(activityItems: activityItems,
                                    applicationActivities: applicationActivities)
  }
  
  func updateUIViewController(_ uiViewController: UIActivityViewController,
                              context: UIViewControllerRepresentableContext<ShareView>) {
    // empty
  }
}

#Preview {
  ShareView(activityItems: [])
}

