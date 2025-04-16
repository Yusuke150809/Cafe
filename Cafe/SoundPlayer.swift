import UIKit
import AVFoundation

class SoundPlayer: NSObject, AVAudioPlayerDelegate {
    let sumpleData: Data?
    let dripcoffeeData: Data?
    let customersData: Data?
    let coffeecupData: Data?
    let coffeemakerData: Data?
    let sunnydayData: Data?
    let rainydayData: Data?
    var sumplayer: AVAudioPlayer?
    var dripcoffeePlayer: AVAudioPlayer?
    var customersPlayer: AVAudioPlayer?
    var coffeecupPlayer: AVAudioPlayer?
    var coffeemakerPlayer: AVAudioPlayer?
    var sunnydayPlayer: AVAudioPlayer?
    var rainydayPlayer: AVAudioPlayer?

    override init() {
        self.sumpleData = NSDataAsset(name: "sample")?.data
        self.dripcoffeeData = NSDataAsset(name: "dripcoffee")?.data
        self.customersData = NSDataAsset(name: "customers")?.data
        self.coffeecupData = NSDataAsset(name: "coffeecup")?.data
        self.coffeemakerData = NSDataAsset(name: "coffeemaker")?.data
        self.sunnydayData = NSDataAsset(name: "sunnyday")?.data
        self.rainydayData = NSDataAsset(name: "rainyday")?.data
        super.init()
    }

    func sumplePlay() {
        guard let sumpleData = sumpleData else {
            print("Error loading sample audio file")
            return
        }
        if let player = sumplayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = sumplayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                sumplayer = try AVAudioPlayer(data: sumpleData)
                sumplayer?.delegate = self
                sumplayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }
    
    func dripcoffeePlay() {
        guard let dripcoffeeData = dripcoffeeData else {
            print("Error loading dripcoffee audio file")
            return
        }
        if let player = dripcoffeePlayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = dripcoffeePlayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                dripcoffeePlayer = try AVAudioPlayer(data: dripcoffeeData)
                dripcoffeePlayer?.delegate = self
                dripcoffeePlayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }

    func customersPlay() {
        guard let customersData = customersData else {
            print("Error loading customers audio file")
            return
        }
        if let player = customersPlayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = customersPlayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                customersPlayer = try AVAudioPlayer(data: customersData)
                customersPlayer?.delegate = self
                customersPlayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }

    func coffeecupPlay() {
        guard let coffeecupData = coffeecupData else {
            print("Error loading coffeecup audio file")
            return
        }
        if let player = coffeecupPlayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = coffeecupPlayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                coffeecupPlayer = try AVAudioPlayer(data: coffeecupData)
                coffeecupPlayer?.delegate = self
                coffeecupPlayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }

    func coffeemakerPlay() {
        guard let coffeemakerData = coffeemakerData else {
            print("Error loading coffeemaker audio file")
            return
        }
        if let player = coffeemakerPlayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = coffeemakerPlayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                coffeemakerPlayer = try AVAudioPlayer(data: coffeemakerData)
                coffeemakerPlayer?.delegate = self
                coffeemakerPlayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }

    func sunnydayPlay() {
        guard let sunnydayData = sunnydayData else {
            print("Error loading sunnyday audio file")
            return
        }
        if let player = sunnydayPlayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = sunnydayPlayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                sunnydayPlayer = try AVAudioPlayer(data: sunnydayData)
                sunnydayPlayer?.delegate = self
                sunnydayPlayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }

    func rainydayPlay() {
        guard let rainydayData = rainydayData else {
            print("Error loading rainyday audio file")
            return
        }
        if let player = rainydayPlayer, player.isPlaying {
            player.pause() // 再生中の場合は一時停止
        } else if let player = rainydayPlayer {
            player.play() // 一時停止後の再開
        } else {
            do {
                rainydayPlayer = try AVAudioPlayer(data: rainydayData)
                rainydayPlayer?.delegate = self
                rainydayPlayer?.play() // 新規に再生を開始
            } catch {
                print("Cafeでエラーが発生しました")
            }
        }
    }

    func stopSumple() {
        sumplayer?.pause() // 一時停止
    }

    func stopDripcoffee() {
        dripcoffeePlayer?.pause() // 一時停止
    }

    func stopCustomers() {
        customersPlayer?.pause() // 一時停止
    }

    func stopCoffeecup() {
        coffeecupPlayer?.pause() // 一時停止
    }
    
    func stopCoffeemaker() {
        coffeemakerPlayer?.pause() // 一時停止
    }

    func stopSunnyday() {
        sunnydayPlayer?.pause() // 一時停止
    }

    func stopRainyday() {
        rainydayPlayer?.pause() // 一時停止
    }
    
    // 再生が終了したときに呼び出されるデリゲートメソッド
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.play() // 再生を再開
    }
}

