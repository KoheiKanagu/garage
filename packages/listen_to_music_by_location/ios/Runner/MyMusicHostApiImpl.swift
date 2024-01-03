import MusicKit

class MyMusicHostApiImpl: MyMusicHostApi {

  func requestPermission(
    completion: @escaping (
      Result<String, Error>
    ) -> Void
  ) {
    Task {
      let result = await MusicAuthorization.request()
      completion(
        .success(result.rawValue)
      )
    }
  }

  func currentPermissionStatus() throws -> String {
    return MusicAuthorization.currentStatus.rawValue
  }

  func play(id: String) throws {
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
