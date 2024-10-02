//
//  EditAwardUIView.swift
//  app923
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

struct EditAwardUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @Binding var showAddProductSheet: Bool
    @State var award: Award
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var datePicker = false
    @State var name: String = ""
    @State var title: String = ""
    @State var date: Date = Date()
    var body: some View {
        ZStack {
            Color.secondBg.ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(width: 36, height: 5)
                    .cornerRadius(3)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(10)
                
                HStack {
                    Spacer()
                    
                    Button {
                        showAddProductSheet = false
                    } label: {
                        
                        
                        ZStack {
                            Circle()
                                .frame(height: 30)
                                .foregroundColor(.gray.opacity(0.4))
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                        }
                    }
                }
                
                HStack {
                    Text("Create a product")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom, 30)
                
                if let image = selectedImage {
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 96, height: 96)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                    
                } else {
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 96, height: 96)
                            .foregroundColor(.black.opacity(0.15))
                            .cornerRadius(5)
                        Image(systemName: "photo")
                            .foregroundColor(.white)
                            .font(.title)
                    }.onTapGesture {
                        isShowingImagePicker = true
                    }
                    
                }
                
                HStack {
                    Text("Information")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top, 30)
                VStack {
                    
                    ZStack(alignment: .leading) {
                        
                        if name.isEmpty {
                            Text("Name")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        
                        TextField("", text: $name)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if title.isEmpty {
                            Text("Brand")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        TextField("", text: $title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        HStack {
                            Text("\(formattedTime(time: date))")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white.opacity(0.5))
                            
                            
                            Spacer()
                        }.padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                            .onTapGesture {
                                datePicker.toggle()
                            }
                    }
                    if datePicker {
                        DatePicker(
                            "Choose your date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(24)
                    }
                }
                
                Spacer()
                
                Button {
                    if !name.isEmpty && !title.isEmpty {
                        viewModel.editAward(award, image: selectedImage, name: name, title: title, date: date)
                        showAddProductSheet = false
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 56)
                            .foregroundColor(.blueBtn)
                            .cornerRadius(12)
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                    }.opacity(!name.isEmpty && !title.isEmpty ? 1 : 0.3)
                }
                .onAppear {
                    selectedImage = award.image
                    name = award.name
                    title = award.title
                    date = award.date
                    
                }
            }.padding(.horizontal)
                .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
                }
        }
        
        
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
            
        }
    }
    
    private func formattedTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: time)
    }
}

#Preview {
    EditAwardUIView(viewModel: SettingsViewModel(), showAddProductSheet: .constant(true), award: Award(name: "The most brilliant beard", title: "Win a competition among other friends, take care of your vegetation and win", date: Date()))
}
