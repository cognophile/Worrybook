//
//  AboutView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct AboutView: View {
    @Binding var show: Bool
    
    private let colorHelper = ColorHelper()
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    private let feedbackEmail = "worrybook@gmail.com";
    private let websiteUrl = "https://worrybook.webflow.io";
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    HStack {
                        Text("What is Worrybook?")
                            .font(.title3)
                            .padding([.leading, .trailing, .top], 10)
                            .foregroundColor(colorHelper.getTextColor())
                    }
                    Divider()
                        .padding([.leading, .trailing], 10)
                    
                    HStack {
                        Text("Worrybook was built to serve as a convenient in-your-pocket solution to help practice the popular Cognitive Behavioural Therapy (CBT) techniques Worry Time, Worry Diary, and Gratitude Diary. It aims to support you in forming and adhering to these mental wellbeing habits. By recording, reviewing, and addressing your worries at regular intervals, it can help reduce the intensity and frequency of anxiety.")
                            .lineLimit(nil)
                            .font(.caption)
                            .padding([.leading, .trailing], 10)
                            .foregroundColor(colorHelper.getTextColor())
                    }
                    
                    HStack {
                        Text("Anxiety is a normal part of human behaviour and everyone experiences it to a degree, from time to time. However, some people experience it stronger and more frequently. The good news is there's an abundance of 1information, techniques, and support available for those suffering all types of anxiety. The links below are a great starting point to help you understand and manage anxiety, and best utilise Worrybook.")
                            .lineLimit(nil)
                            .font(.caption)
                            .padding([.leading, .trailing], 10)
                            .foregroundColor(colorHelper.getTextColor())
                    }
                    HStack {
                        HStack {
                            Link("Understanding anxiety", destination:
                                    URL(string: "https://www.nhs.uk/oneyou/every-mind-matters/anxiety")!
                            )
                            .font(.caption)
                            .padding([.leading, .trailing], 10)
                        }
                        
                        HStack {
                                Link("Managing anxiety", destination:
                                    URL(string: "https://www.nhs.uk/oneyou/every-mind-matters/anxiety#custom-2column-share-shelf")!
                                )
                                .font(.caption)
                                .padding([.leading, .trailing], 10)
                        }
                    }
                }
                .padding(.bottom, 30)
                
                Group {
                    HStack {
                        Text("Disclaimer and Support")
                            .font(.title3)
                            .padding([.leading, .trailing], 10)
                            .foregroundColor(colorHelper.getTextColor())
                    }
                    
                    Divider()
                        .padding([.leading, .trailing], 10)
                    
                    HStack {
                        Text("This application has been designed and developed to support the practice of existing psycho-therapy methods, which vary in effectiveness per-person, but does not claim to treat or resolve mental health issues. It has not been designed, developed, or consulted upon by or with medical professionals, but by an individuals with personal experience of mental health management techniques, habit forming, and a desire to help others. By using Worrybook, you acknowledge and agree to this disclaimer. \n\nIf you're experiencing thoughts of self-harm or suicide, remember that though these can be complex and frightening, you're not alone and support is available. It's important to talk to someone such as family, your doctor, or mental crisis support services.")
                            .lineLimit(nil)
                            .font(.caption)
                            .padding([.leading, .trailing], 10)
                            .foregroundColor(colorHelper.getTextColor())
                    }
                    
                    HStack {
                        Link("Mental health support and crisis services", destination:
                                URL(string: "https://www.nhs.uk/oneyou/every-mind-matters/urgent-support/")!
                        )
                        .font(.caption)
                        .padding([.leading, .trailing], 10)
                    }
                }
                .padding(.bottom, 20)
                
                Group {
                    VStack {
                        HStack {
                            Text("Diagnostics and Feedback")
                                .font(.title3)
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(colorHelper.getTextColor())
                        }
                        Divider()
                            .padding([.leading, .trailing], 10)
                        
                        VStack {
                            Text("App Version: \(self.appVersion)")
                                .font(.footnote)
                                .padding([.leading, .trailing, .bottom], 5)
                            Text("\(DeviceDetailHelper.getDeviceDetails()) (\(DeviceDetailHelper.getMachineName()) - iOS \(DeviceDetailHelper.getOperatingSystemVersion())")
                                .font(.footnote)
                                .padding([.leading, .trailing, .bottom], 5)
                        }
                        
                        Spacer()
                        VStack {
                            Link("Got feedback? Email us!", destination:
                                    URL(string: "mailto:\(self.feedbackEmail)")!
                            )
                                .font(.caption)
                                .padding([.leading, .trailing], 10)
                            
                            Link("Checkout the website!", destination:
                                    URL(string: "\(self.websiteUrl)")!
                            )
                                .font(.caption)
                            .padding([.leading, .trailing, .top], 10)
                        }
                    }
                }
                
                Spacer()
                Group {
                    HStack {
                        Text("Thanks for choosing Worrybook ❤️")
                            .font(.footnote)
                            .padding([.leading, .trailing, .bottom], 10)
                    }
                }
            }
        }
    }
}
