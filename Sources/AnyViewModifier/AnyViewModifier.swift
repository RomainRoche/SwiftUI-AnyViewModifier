//
//  AnyViewModifier.swift
//  AnyModifier
//
//  Created by Romain Roche on 30/12/2024.
//

import SwiftUI

/// A type erasing `ViewModifier`.
///
/// Allows to have conditional modifiers and wrap it in a common type.
public struct AnyViewModifier: ViewModifier {
    
    /// The modification closure.
    private let modifier: (Content) -> AnyView
    
    /// Init the modifier.
    /// - Parameter modifier: The modifier we want to wrap.
    public init(_ modifier: some ViewModifier) {
        self.modifier = {
            AnyView($0.modifier(modifier))
        }
    }
    
    public func body(content: Content) -> some View {
        modifier(content)
    }
    
}

public extension View {
    
    /// Apply a `ViewModifier` if a condition applies.
    /// - Parameter modify: The condition to apply the modifier.
    /// - Parameter modifier: The modifier.
    /// - Returns: A modified `View`.
    func modifier(
        if modify: Bool,
        _ modifier: some ViewModifier
    ) -> some View {
        self.modifier(modify ? AnyViewModifier(modifier) : AnyViewModifier(EmptyModifier()))
    }
    
}
