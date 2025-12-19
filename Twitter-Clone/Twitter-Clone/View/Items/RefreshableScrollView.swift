//
//  RefreshableScrollView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 19/12/2025.
//

import SwiftUI

struct RefreshableScrollView<Content: View>: UIViewRepresentable {

    var content: Content
    var onRefresh: (UIRefreshControl) -> ()
    var refreshControl = UIRefreshControl()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let uiscrollView = UIScrollView()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull Me")
        refreshControl.tintColor = UIColor(red: 0.114, green: 0.631, blue: 0.949, alpha: 1)
        refreshControl.addTarget(context.coordinator, action: #selector(context.coordinator.onRefresh), for: .valueChanged)
        
        setUpView(uiscrollView: uiscrollView)
        
        uiscrollView.refreshControl = refreshControl
        
        return uiscrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        setUpView(uiscrollView: uiView)
    }
    
    func setUpView(uiscrollView: UIScrollView){
        let hostView = UIHostingController(rootView: content.frame(maxHeight: .infinity, alignment: .top))
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        uiscrollView.subviews.last?.removeFromSuperview()
        uiscrollView.addSubview(hostView.view)
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: uiscrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: uiscrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: uiscrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: uiscrollView.trailingAnchor),
            
            hostView.view.widthAnchor.constraint(equalTo: uiscrollView.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: uiscrollView.heightAnchor, constant: 1),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    class Coordinator: NSObject{
        
        var parent: RefreshableScrollView
        init(parent: RefreshableScrollView) {
            self.parent = parent
        }
        
        @objc func onRefresh(){
            parent.onRefresh(parent.refreshControl)
        }
        
    }
}
