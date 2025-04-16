import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var isPlayingSumple = false
    @State private var isPlayingDripcoffee = false
    @State private var isPlayingCustomers = false
    @State private var isPlayingCoffeecup = false
    @State private var isPlayingCoffeemaker = false
    @State private var isPlayingSunnyday = false
    @State private var isPlayingRainyday = false
    
    @State private var volumeSumple: Float = 0.5
    @State private var volumeDripcoffee: Float = 0.5
    @State private var volumeCustomers: Float = 0.5
    @State private var volumeCoffeecup: Float = 0.5
    @State private var volumeCoffeemaker: Float = 0.5
    @State private var volumeSunnyday: Float = 0.5
    @State private var volumeRainyday: Float = 0.5

    let soundplayer = SoundPlayer()

    var body: some View {
        ZStack {
            SceneKitView()
                .edgesIgnoringSafeArea(.all)
                .zIndex(0)

            ScrollView {
                VStack(spacing: 20) {
                    soundControlRow(label: "CafeBGM", isPlaying: $isPlayingSumple, volume: $volumeSumple, play: {
                        soundplayer.sumplePlay()
                    }, stop: {
                        soundplayer.stopSumple()
                    }, player: {
                        soundplayer.sumplayer
                    })

                    soundControlRow(label: "Drip coffee", isPlaying: $isPlayingDripcoffee, volume: $volumeDripcoffee, play: {
                        soundplayer.dripcoffeePlay()
                    }, stop: {
                        soundplayer.stopDripcoffee()
                    }, player: {
                        soundplayer.dripcoffeePlayer
                    })

                    soundControlRow(label: "Customers", isPlaying: $isPlayingCustomers, volume: $volumeCustomers, play: {
                        soundplayer.customersPlay()
                    }, stop: {
                        soundplayer.stopCustomers()
                    }, player: {
                        soundplayer.customersPlayer
                    })

                    soundControlRow(label: "Coffee cup", isPlaying: $isPlayingCoffeecup, volume: $volumeCoffeecup, play: {
                        soundplayer.coffeecupPlay()
                    }, stop: {
                        soundplayer.stopCoffeecup()
                    }, player: {
                        soundplayer.coffeecupPlayer
                    })

                    soundControlRow(label: "Coffee maker", isPlaying: $isPlayingCoffeemaker, volume: $volumeCoffeemaker, play: {
                        soundplayer.coffeemakerPlay()
                    }, stop: {
                        soundplayer.stopCoffeemaker()
                    }, player: {
                        soundplayer.coffeemakerPlayer
                    })

                    soundControlRow(label: "Sunny day", isPlaying: $isPlayingSunnyday, volume: $volumeSunnyday, play: {
                        soundplayer.sunnydayPlay()
                    }, stop: {
                        soundplayer.stopSunnyday()
                    }, player: {
                        soundplayer.sunnydayPlayer
                    })

                    soundControlRow(label: "Rainy day", isPlaying: $isPlayingRainyday, volume: $volumeRainyday, play: {
                        soundplayer.rainydayPlay()
                    }, stop: {
                        soundplayer.stopRainyday()
                    }, player: {
                        soundplayer.rainydayPlayer
                    })

                    // Pause All
                    VStack {
                        HStack {
                            Text("Pause")
                                .foregroundColor(.black)
                                .font(Font.custom("Noteworthy-Bold", size: 16))
                                .frame(maxHeight: .infinity, alignment: .top)
                            
                            Button {
                                soundplayer.stopSumple()
                                soundplayer.stopDripcoffee()
                                soundplayer.stopCustomers()
                                soundplayer.stopCoffeecup()
                                soundplayer.stopCoffeemaker()
                                soundplayer.stopSunnyday()
                                soundplayer.stopRainyday()
                                
                                isPlayingSumple = false
                                isPlayingDripcoffee = false
                                isPlayingCustomers = false
                                isPlayingCoffeecup = false
                                isPlayingCoffeemaker = false
                                isPlayingSunnyday = false
                                isPlayingRainyday = false
                            } label: {
                                Image(systemName: "pause.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                                    .padding(.top, -5)
                            }
                        }
                    }
                }
                .padding(.top, 60)
                .padding(.bottom, 80)
                .background(Color.white.opacity(0.001)) // 背景透明でタッチ通す
                .zIndex(1)
            }
        }
    }

    // 共通コンポーネント：音声操作
    func soundControlRow(
        label: String,
        isPlaying: Binding<Bool>,
        volume: Binding<Float>,
        play: @escaping () -> Void,
        stop: @escaping () -> Void,
        player: @escaping () -> AVAudioPlayer?
    ) -> some View {
        VStack {
            HStack {
                Text(label)
                    .foregroundColor(.black)
                    .font(Font.custom("Noteworthy-Bold", size: 16))
                    .frame(maxHeight: .infinity, alignment: .top)

                Button {
                    if isPlaying.wrappedValue {
                        stop()
                    } else {
                        play()
                    }
                    isPlaying.wrappedValue.toggle()
                } label: {
                    Image(systemName: isPlaying.wrappedValue ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .padding(.top, -5)
                }
            }

            Slider(value: Binding(
                get: { volume.wrappedValue },
                set: { newVolume in
                    volume.wrappedValue = newVolume
                    player()?.volume = newVolume
                }
            ), in: 0...1)
            .accentColor(.black)
            .frame(width: UIScreen.main.bounds.width * 0.5)
            .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
        }
    }
}

#Preview {
    ContentView()
}

