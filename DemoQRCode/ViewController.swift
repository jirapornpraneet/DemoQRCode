//
//  ViewController.swift
//  DemoQRCode
//
//  Created by iOS Dev on 4/11/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qrImageView: UIImageView!
    
    var passenger: Passenger?
    var encrypted: String?
    
    var key: String {
        return Configuration.Screening.screeningEncryptKey
    }
    
    var iv: String {
        return Configuration.Screening.screeningEncryptIV
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func passUserDataIfNeeded() {
        let pssger = Passenger()
        pssger.id = "\(111111)"
        self.passenger = pssger
    }
    
    func encodeIfNeeded() {
        
        guard let psg = self.passenger else { return }
        guard let jsonString = psg.toJSONString() else { return }

        print(jsonString)
        let encode = try! jsonString.aesEncrypt(key: key, iv: iv)

        self.generateQR(encode)
        encrypted = encode
    }
    
    func generateQR(_ text: String) {
        
        // Get define string to encode
        let myString = text
        // Get data from the string
        let data = myString.data(using: String.Encoding.ascii)
        // Get a QR CIFilter
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        // Input the data
        qrFilter.setValue(data, forKey: "inputMessage")
        // Get the output image
        guard let qrImage = qrFilter.outputImage else { return }
        
        // Scale the image
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        
        // Color
        let colorParameters = [
            "inputColor0": CIColor(color: UIColor.black),   // Foreground
            "inputColor1": CIColor(color: UIColor.white)    // Background
        ]
        let colored = scaledQrImage.applyingFilter("CIFalseColor", parameters: colorParameters)
        
        // Processing to get the UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(colored, from: colored.extent) else { return }
        
        // Display QR
        qrImageView.image = UIImage(cgImage: cgImage)
    }
}

