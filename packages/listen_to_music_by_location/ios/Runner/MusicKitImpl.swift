import AVFAudio
import MusicKit

class MusicKitImpl: MusicKit {

  func requestPermission(
    completion: @escaping (
      Result<MusicAuthorizationStatus, Error>
    ) -> Void
  ) {
    Task {
      let result = await MusicAuthorization.request()
      completion(
        .success(result.musicAuthorizationStatus)
      )
    }
  }

  func currentPermissionStatus() throws -> MusicAuthorizationStatus {
    return MusicAuthorization.currentStatus.musicAuthorizationStatus
  }

  func songDetails(
    id: String,
    artworkSize: Int64,
    completion: @escaping (
      Result<SongDetails, Error>
    ) -> Void
  ) {
    Task {
      let request = MusicCatalogResourceRequest<Song>(
        matching: \.id,
        equalTo: MusicItemID(id)
      )

      let response = try await request.response()
      if let item = response.items.first {
        completion(
          .success(
            SongDetails(
              id: item.id.rawValue,
              title: item.title,
              artistName: item.artistName,
              artworkUrl: item.artwork?.url(
                width: Int(artworkSize),
                height: Int(artworkSize)
              )?.absoluteString,
              songUrl: item.url?.absoluteString
            )
          )
        )
      }
    }
  }

  func play(
    id: String
  ) throws {
    Task {
      let response = try await MusicCatalogResourceRequest<Song>(
        matching: \.id,
        equalTo: MusicItemID(id)
      ).response()

      // キューに値が入っている場合はinsertする
      if SystemMusicPlayer.shared.queue.currentEntry != nil {
        try await SystemMusicPlayer.shared.queue.insert(
          response.items,
          position: .afterCurrentEntry
        )
        try await SystemMusicPlayer.shared.skipToNextEntry()
      } else {
        // 何も再生しておらず、キューが空の場合はキューを初期化
        SystemMusicPlayer.shared.queue = .init(
          for: response.items
        )
      }
      try await SystemMusicPlayer.shared.play()
    }
  }

  func audioSessionBuiltInSpeaker() throws -> Bool {
    return AVAudioSession.sharedInstance().currentRoute.outputs.contains(where: {
      $0.portType == AVAudioSession.Port.builtInSpeaker
    })
  }
}

extension MusicAuthorization.Status {
  var musicAuthorizationStatus: MusicAuthorizationStatus {
    switch self {
    case .notDetermined:
      return .notDetermined
    case .denied:
      return .denied
    case .restricted:
      return .restricted
    case .authorized:
      return .authorized
    @unknown default:
      return .notDetermined
    }
  }
}
