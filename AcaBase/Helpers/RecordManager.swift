//
//  RecordManager.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/3/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import AVKit

class RecordManager {
    private var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder?
    var callingViewController : AVAudioRecorderDelegate!
    private var finishRecordCompletion : ((Bool)->())?
    
    private var audioFileUrl : URL?
    
    func checkPermission(completion: @escaping((Bool) -> ())){
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { allowed in
                DispatchQueue.main.async {
                    if allowed {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        } catch {
            completion(false)
        }
    }
    
    @discardableResult
    func startRecording() ->  AVAudioRecorder? {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording\(fileDateComplement()).m4a")
        self.audioFileUrl = audioFilename
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.isMeteringEnabled = true
            audioRecorder?.delegate = callingViewController
            audioRecorder?.record()
            return audioRecorder
        } catch {
            stopRecording(success: false)
        }
        return nil
    }
    
    func stopRecording(success: Bool) {
        audioRecorder?.stop()
        audioRecorder = nil
        finishRecordCompletion?(success)
    }
    
    func recordTapped() -> Bool {
        if audioRecorder == nil {
            startRecording()
            return true
        } else {
            if audioRecorder!.isRecording {
                audioRecorder!.pause()
                return false
            } else {
                audioRecorder!.record()
                return true
            }
        }
    }
    
    @discardableResult
    func finishCompletion(_ completion: ((Bool)->Void)?) ->Self {
        self.finishRecordCompletion = completion
        return self
    }
    
    // MARK: File related actions
//    func export(fileType: AVFileType = .m4a, completion: @escaping ((URL?) -> Void)) {
//
//        let asset = AVAsset(url: audioFileUrl!)
//        guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetAppleM4A) else {
//            return
//        }
//        exportSession.outputFileType = fileType
//        exportSession.metadata = asset.metadata
//        exportSession.shouldOptimizeForNetworkUse = true
//        let outPutUrl = exportOutputURL
//        exportSession.outputURL = outPutUrl
//        exportSession.exportAsynchronously {
//            print("Export finished.")
//            completion(exportSession.outputURL)
//        }
//    }
    func deleteRecordingFile() -> Bool {
        if let url = audioFileUrl {
            do {
                try FileManager.default.removeItem(at: url)
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    func getRecordingFile() -> Attachement? {
        guard let url = audioFileUrl else {
            return nil
        }
        let attachement = Attachement(name: url.lastPathComponent, objectUrl: url, size: getFileSize(url: url), isAudio: true, duration: getRecordedAudioDuration(url: url))
        return attachement
    }
    
    private func getRecordedAudioDuration(url: URL) -> Double {
        let audioAsset = AVURLAsset.init(url: url, options: nil)
        let duration = audioAsset.duration
        return CMTimeGetSeconds(duration)
    }
    
}
extension RecordManager {
    static var `default`: RecordManager = {
        return RecordManager()
    }()
}
