import SwiftUI
import Alamofire

struct SellWriteView: View {
    @State private var selectedImage: UIImage?
    @State private var imageURL: String = ""
    
    @State private var productname: String = ""
    @State private var category: String = ""
    @State private var explanation: String = ""
    @State private var price: Int = 0
    @State private var boxprice: Int = 0

    @State private var isImagePickerPresented: Bool = false // ImagePicker 표시 여부
    @State private var selectedCategoryIndex: Int? = nil // Index of the selected category
    
    @FocusState var focus
    
    let categories = ["채소", "과일", "해산물", "나눔"]

    var body: some View {
        VStack(alignment: .leading) {
            Text("판매글 작성하기")
                .font(.system(size: 20, weight: .regular))
                .padding(.leading, 130)
            
            VStack(alignment:.leading) {
                Text("상품정보")
                    .font(.system(size: 17, weight: .regular))
                    .padding(.leading, 20)
                
                Button(action: {
                    isImagePickerPresented.toggle()
                }) {
                    Rectangle()
                        .frame(width: 53, height: 53)
                        .foregroundColor(Color(hex: "#D9D9D9"))
                        .cornerRadius(10)
                        .padding(.leading, 23)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .overlay {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                                .padding(.leading, 23)
                        }
                }
                
                TextField("상품명", text: $productname)
                    .padding(.leading, 40)
                    .font(.system(size: 13, weight: .regular))
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                TextField("카테고리", text: $category)
                    .padding(.leading, 40)
                    .padding(.top, 10)
                    .font(.system(size: 13, weight: .regular))
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                Text("설명")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 10)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 330, height: 118)
                    .background(Color(hex: "#F0F0F0"))
                    .cornerRadius(10)
                    .padding(.leading, 31)
                    .overlay(
                        TextField("", text: $explanation)
                            .font(.system(size: 13, weight: .regular))
                            .padding(.leading, 50)
                            .padding(.bottom, 65)
                            .focused($focus)
                    )
                    .onTapGesture {
                        focus.toggle()
                    }
                
                Text("태그")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 5)
                
                HStack(spacing: 13) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        Button(action: {
                            category = categories[index]
                            selectedCategoryIndex = index
                        }) {
                            Text(categories[index])
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 80, height: 25)
                                .background(selectedCategoryIndex == index ? Color(hex: "34C831") : Color(hex: "B6F0B5"))
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.leading, 44)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 10)
                    .background(Color(hex: "D9D9D9"))
                    .padding(.top, 10)
                
                Text("가격")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 20)
                
                ZStack(alignment: .leading) {
                    if price == 0 {
                        Text("₩ 가격")
                            .foregroundColor(Color(hex: "D9D9D9"))
                            .padding(.leading, 44)
                            .padding(.top, 5)
                            .font(.system(size: 13, weight: .regular))
                    }
                    TextField("", text: Binding(
                        get: { price == 0 ? "" : String(price) },
                        set: { price = Int($0) ?? 0 })
                    )
                    .padding(.leading, 40)
                    .foregroundColor(Color(hex: "D9D9D9"))
                    .font(.system(size: 13, weight: .regular))
                    .keyboardType(.numberPad)
                }
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                Text("택배비")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.leading, 29)
                    .padding(.top, 15)
                
                ZStack(alignment: .leading) {
                    if boxprice == 0 {
                        Text("₩ 택배비")
                            .foregroundColor(Color(hex: "D9D9D9"))
                            .padding(.leading, 44)
                            .padding(.top, 5)
                            .font(.system(size: 13, weight: .regular))
                    }
                    TextField("", text: Binding(
                        get: { boxprice == 0 ? "" : String(boxprice) },
                        set: { boxprice = Int($0) ?? 0 })
                    )
                    .padding(.leading, 40)
                    .foregroundColor(Color(hex: "D9D9D9"))
                    .font(.system(size: 13, weight: .regular))
                    .keyboardType(.numberPad)
                }
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal, 40)
                
                Button(action: {
                    if let image = selectedImage {
                        uploadImage(image)
                    }
                }, label: {
                    Text("추가하기")
                        .frame(width: 302, height: 63)
                        .foregroundColor(.white)
                        .background(Color(hex: "34C831"))
                        .cornerRadius(15)
                        .font(.system(size: 23, weight: .regular))
                })
                .padding(.leading, 45)
                .padding(.top, 10)
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage, uploadAction: uploadImage)
                }
            }
        }
    }
    
    func uploadImage(_ image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            return
        }

        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "file", fileName: "file.jpg", mimeType: "image/jpeg")
            },
            to: "http://43.201.116.75:8080/api/cdn/upload",
            method: .post
        )
        .responseDecodable(of: UploadDTO.self) { result in
            switch result.result {
            case .success(let value):
                imageURL = value.url
                postProduct(imageUrl: imageURL)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func postProduct(imageUrl: String) {
        let parameters: [String: Any] = [
            "token": TokenManager.shared.getToken(),
            "title": productname,
            "delivery": boxprice,
            "price": price,
            "content": explanation,
            "img": imageUrl,
            "category": category
        ]
        
        print(parameters)
        AF.request(
            "http://43.201.116.75:8080/api/product/post", 
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: ["Content-Type": "application/json"]
        )
        .response { response in
            print(response.response?.statusCode)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var uploadAction: (UIImage) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self, uploadAction: uploadAction)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false // 편집 허용 여부
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        let uploadAction: (UIImage) -> Void

        init(_ parent: ImagePicker, uploadAction: @escaping (UIImage) -> Void) {
            self.parent = parent
            self.uploadAction = uploadAction
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
                uploadAction(uiImage)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

#Preview {
    SellWriteView()
}

struct UploadDTO: Decodable {
    let url: String
}
