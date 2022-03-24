//
//  WorryBookApp.swift
//  WorryBook
//
//  Created by cognophile
//

import SwiftUI
import Foundation
import LocalAuthentication

@main
struct WorrybookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var isUnlocked = false
    @State private var encounteredBiometricProblem = false
    
    private let colorHelper = ColorHelper()
    private let quote = QuoteHelper.getRandomQuote()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if isUnlocked {
                    HomeView()
                }
                else {
                    ZStack {
                        colorHelper.getPrimaryColor().edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            HStack {
                                Image("Worrybook_title_colour_large-trans")
                                    .resizable()
                                    .frame(width: 300, height: 100)
                                    .padding(5)
                            }
                            Spacer()
                            Image("Worrybook_trans_logo_xl")
                                .resizable()
                                .frame(width: 150, height: 150)
                            Spacer()
                            HStack {
                                Text("\(self.quote)")
                                    .fontWeight(.light)
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .onAppear(perform: authenticate)
            .alert(isPresented: self.$encounteredBiometricProblem) {
                Alert(
                    title: Text("Oops!"),
                    message: Text("It looks like we can't authenticate you. If you continue to encounter issues, please report the issue via the website."),
                    dismissButton: .default(Text("Try again"))
                )
            }
        }
    }
    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to verify you to gain access to your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    self.isUnlocked = true
                }
                else {
                    self.encounteredBiometricProblem = true
                }
            }
        } else {
            // todo: add passcode
            self.isUnlocked = true
        }
    }
}
