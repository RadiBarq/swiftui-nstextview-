//
//  CustomTextView.swift
//  SwiftUINSTextView (macOS)
//
//  Created by Radi Barq on 29/06/2021.
//

import Foundation
import SwiftUI

struct CustomTextView: NSViewRepresentable {
    @Binding var foregroundColor: NSColor
    @Binding var text: String
    private(set) var font: NSFont
    
    func makeNSView(context: NSViewRepresentableContext<CustomTextView>) -> NSTextView {
        let textView = NSTextView()
        textView.font = font
        textView.isEditable = true
        textView.isSelectable = true
        textView.textContainer?.maximumNumberOfLines = 5
        textView.backgroundColor = .clear
        textView.textColor = foregroundColor
        textView.alignment = .center
        textView.delegate = context.coordinator
        return textView
    }
    
    func updateNSView(_ uiView: NSTextView, context: NSViewRepresentableContext<CustomTextView>) {
        uiView.textColor = foregroundColor
        uiView.string = text
    }
    
    func makeCoordinator() -> CustomTextView.Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, NSTextViewDelegate {
        @Binding var text: String
        init(text: Binding<String>) {
            _text = text
        }
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else {
                return
            }
            text = textView.string
        }
    }
}
