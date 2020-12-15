//
//  AccountCreation.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/13/20.
//

import SwiftUI
import Firebase

struct AccountCreation : View {
    
    @Binding var show : Bool
    @State var name = ""
    @State var about = ""
    @State var picker = false
    @State var loading = false
    @State var imagedata : Data = .init(count: 0)
    @State var alert = false
    var userImage = UIImage(named: "user")
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("Awesome !!! Create An Account").font(.title)
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    self.picker.toggle()
                    
                }) {
                    
                    if self.imagedata.count == 0{
                        
                       Image(systemName: "person.crop.circle.badge.plus").resizable().frame(width: 90, height: 70).foregroundColor(.gray)
                    }
                    else{
                        
                        Image(uiImage: UIImage(data: self.imagedata)!).resizable().renderingMode(.original).frame(width: 90, height: 90).clipShape(Circle())
                    }
                    
                    
                }
                
                Spacer()
            }
            .padding(.vertical, 15)
            
            Text("Enter User Name")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 12)

            TextField("Name", text: self.$name)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color("Color"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 15)
            
            Text("About You")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 12)

            TextField("About", text: self.$about)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color("Color"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.top, 15)
            
            if self.loading{
                
                HStack{
                    
                    Spacer()
                    
                    Indicator()
                    
                    Spacer()
                }
            }
                
            else{
                
                Button(action: {
                    
                    if self.name != "" && self.about != ""{
                        
                        self.loading.toggle()
                        createUser(name: self.name, about: self.about, imagedata: (self.userImage?.pngData())!) { (status) in
                            
                            if status{
                                
                                self.show.toggle()
                            }
                        }
                    }
                    else{
                        
                        self.alert.toggle()
                    }
                    
                    
                }) {
                    

                Text("Create").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                         
                }.foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10)
                
            }
            
        }
        .padding()
        .sheet(isPresented: self.$picker, content: {
            
//            ImagePicker(sourceType: .photoLibrary) { image in
//                self.imagedata = image.jpegData(compressionQuality: 0.45)!
//            }
//            
            ImagePicker(selectedImage: self.$imagedata, sourceType: self.sourceType)
//            ImagePicker(picker: self.$picker, imagedata: self.$imagedata)
        })
        .alert(isPresented: self.$alert) {
            
            Alert(title: Text("Message"), message: Text("Please Fill The Contents"), dismissButton: .default(Text("Ok")))
        }
    }
}




//struct AccountCreation_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountCreation()
//    }
//}
