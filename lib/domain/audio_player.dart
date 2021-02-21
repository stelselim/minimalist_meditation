abstract class AudioPlayerRepositoryModel {
  void playUrl(String url);

  void resume();

  void pause();

  void stop();

  void previous();

  void next();

  bool isPlaying();

  void onSeekComplete();

  void saveListenTime();

  void onPlayerComplete();

  Future<int> getDuration();

  Future<int> getCurrentTime();

  Future<int> getPercentage();

  Future<int> seekTo(Duration position);
}
