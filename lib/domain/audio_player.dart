abstract class AudioPlayerRepositoryModel {
  void playUrl(String url);

  void resume();

  void pause();

  void stop();

  Future<int> getDuration();

  Future<int> getCurrentTime();

  Future<double> getPercentage();

  Future<int> seekTo(Duration position);
}
