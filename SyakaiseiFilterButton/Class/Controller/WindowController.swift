//
//  WindowController.swift
//  SyakaiseiFilterTouchBar
//
//  ウィンドウが開いている時の処理を扱う
//

import Cocoa
import AVFoundation

class WindowController: NSWindowController, AVAudioPlayerDelegate {

    // MARK:- Var on fields
    /// AudioPlayer
    var AudioPlayer = AVAudioPlayer ()

    // MARK:- Life Cicle Method
    override func windowDidLoad() {
        super.windowDidLoad()
        // 再生する音声ファイル指定
        let soundFilePath = NSURL(fileURLWithPath:Bundle.main.path(forResource: "line-girl1-hee1", ofType: "mp3")!)

        AudioPlayer = try! AVAudioPlayer(contentsOf: soundFilePath as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.delegate = self
    }

    // MARK:- TouchBarButtonイベント
    /// へぇボタン押下時の処理
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func touchHeButton(_ sender: Any) {
        AudioPlayer.currentTime = 0
        // 音の再生
        AudioPlayer.play()
    }

}
