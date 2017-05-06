//
//  MIDINote.swift
//  ToucanBoard
//
//  Created by Spencer Collins on 4/15/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit
import AVFoundation

class MIDINote: NSObject {

    // MARK: Properties
    var engine: AVAudioEngine?
    var soundbank: URL?
    var sampler: AVAudioUnitSampler?
    
    let melodicBank = UInt8(kAUSampler_DefaultMelodicBankMSB)
    let drumBank = UInt8(kAUSampler_DefaultPercussionBankMSB)
    
    override init() {
        engine = AVAudioEngine()
        soundbank = Bundle.main.url(forResource: "gs_instruments", withExtension: "dls")
        sampler = AVAudioUnitSampler()
        
        engine?.attach(sampler!)
        engine?.connect(sampler!, to: (engine?.mainMixerNode)!, format: nil)
        
        do {
            try engine?.start()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setPatch(num: Int, drum: Bool) {
        let newPatch = UInt8(num)
        let bank = drum ? drumBank : melodicBank
        
        do {
            try sampler?.loadSoundBankInstrument(at: soundbank!, program: newPatch, bankMSB: bank, bankLSB: 0)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
