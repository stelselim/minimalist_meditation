abstract class AudioPlayerRepositoryModel {
  void playUrl(String url);

  void resume();

  void pause();

  void stop();

  bool isPlaying();

  void onSeekComplete();

  void onPlayerComplete();

  Future<int> getDuration();

  Future<int> getCurrentTime();

  Future<double> getPercentage();

  Future<int> seekTo(Duration position);
}
