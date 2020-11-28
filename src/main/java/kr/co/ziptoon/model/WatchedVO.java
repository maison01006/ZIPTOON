package kr.co.ziptoon.model;

public class WatchedVO {
	private String userId;
	private String webtoonId;
	private String episode;
	private int click;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getWebtoonId() {
		return webtoonId;
	}
	public void setWebtoonId(String webtoonId) {
		this.webtoonId = webtoonId;
	}
	public String getEpisode() {
		return episode;
	}
	public void setEpisode(String episode) {
		this.episode = episode;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
}
