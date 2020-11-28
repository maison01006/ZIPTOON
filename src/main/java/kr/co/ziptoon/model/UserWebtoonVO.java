package kr.co.ziptoon.model;

public class UserWebtoonVO {
	private String userId;
	private String webtoonId;
	private int fav;
	private Integer rating;
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
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}	
}
