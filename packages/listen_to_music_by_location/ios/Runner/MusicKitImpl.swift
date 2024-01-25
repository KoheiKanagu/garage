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
      let request = MusicCatalogResourceRequest<Song>(
        matching: \.id,
        equalTo: MusicItemID(id)
      )

      let response = try await request.response()

      try await SystemMusicPlayer.shared.queue.insert(
        response.items,
        position: .afterCurrentEntry
      )

      try await SystemMusicPlayer.shared.skipToNextEntry()
      try await SystemMusicPlayer.shared.play()
    }
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
