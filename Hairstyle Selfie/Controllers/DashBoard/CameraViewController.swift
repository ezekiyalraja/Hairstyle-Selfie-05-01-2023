//
//  CameraViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet var styleTextField: UITextField!
    
    @IBOutlet var captureButton: UIButton!
    
    @IBOutlet var captureImageView: UIImageView!
    
    @IBOutlet var cameraView: UIView!
    
    //MARK:- Properties
    var captureSession : AVCaptureSession!
    
    var backCamera : AVCaptureDevice!
    var frontCamera : AVCaptureDevice!
    var frontInput : AVCaptureInput!
    
    var previewLayer : AVCaptureVideoPreviewLayer!
    
    var videoOutput : AVCaptureVideoDataOutput!
    
    var takePicture = false
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        styleTextField.addBorder(radius: 8, borderColor: UIColor(named: "Text")!, borderWidth: 1)
        captureButton.layer.cornerRadius = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkPermissions()
        setupAndStartCaptureSession()
    }
    
    //MARK:- Camera Setup
    func setupAndStartCaptureSession(){
        DispatchQueue.global(qos: .userInitiated).async{
            self.captureSession = AVCaptureSession()
            self.captureSession.beginConfiguration()
            
            if self.captureSession.canSetSessionPreset(.photo) {
                self.captureSession.sessionPreset = .photo
            }
            self.captureSession.automaticallyConfiguresCaptureDeviceForWideColor = true
            
            self.setupInputs()
            
            DispatchQueue.main.async {
                self.setupPreviewLayer()
            }
            
            //setup output
            self.setupOutput()
            self.captureSession.commitConfiguration()
            self.captureSession.startRunning()
        }
    }
    
    func setupInputs(){

        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            frontCamera = device
        } else {
            fatalError("no front camera")
        }
        
        guard let fInput = try? AVCaptureDeviceInput(device: frontCamera) else {
            fatalError("could not create input device from front camera")
        }
        frontInput = fInput
        if !captureSession.canAddInput(frontInput) {
            fatalError("could not add front camera input to capture session")
        }
        
        captureSession.addInput(frontInput)
    }
    
    func setupOutput(){
        videoOutput = AVCaptureVideoDataOutput()
        let videoQueue = DispatchQueue(label: "videoQueue", qos: .userInteractive)
        videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            fatalError("could not add video output")
        }
        
        videoOutput.connections.first?.videoOrientation = .portrait
    }
    
    func setupPreviewLayer(){
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        previewLayer.frame = cameraView.bounds
        
        cameraView.layer.addSublayer(previewLayer!)
        
    }
    
    //MARK:- Permissions
    func checkPermissions() {
        let cameraAuthStatus =  AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch cameraAuthStatus {
          case .authorized:
            return
          case .denied:
            abort()
          case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler:
            { (authorized) in
              if(!authorized){
                abort()
              }
            })
          case .restricted:
            abort()
          @unknown default:
            fatalError()
        }
    }
    
    // MARK: - Button Action
    @IBAction func captureAction(_ sender: Any) {
        takePicture = true
        captureSession.stopRunning()
    }
    

}

// MARK: - AVCapture VideoData Output Sample Buffer Delegate
extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if !takePicture {
            return //we have nothing to do with the image buffer
        }
        
        //try and get a CVImageBuffer out of the sample buffer
        guard let cvBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        //get a CIImage out of the CVImageBuffer
        let ciImage = CIImage(cvImageBuffer: cvBuffer)
        
        //get UIImage out of CIImage
        let uiImage = UIImage(ciImage: ciImage)
        
        DispatchQueue.main.async {
            self.captureImageView.image = uiImage
            self.takePicture = false
        }
    }
        
}
