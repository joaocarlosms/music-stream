package br.com.jc.streamusic.model;

import java.util.Objects;

public class Music implements java.io.Serializable {
	private int id;
	private String title;
	private String artist;
	private String album;
	private int style;
	private String linkMP3;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getArtist() {
		return artist;
	}
	
	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	public String getAlbum() {
		return album;
	}
	
	public void setAlbum(String album) {
		this.album = album;
	}
	
	public int getStyle() {
		return style;
	}
	
	public void setStyle(int style) {
		this.style = style;
	}
	
	public String getLinkMP3() {
		return linkMP3;
	}
	
	public void setLinkMP3(String linkMP3) {
		this.linkMP3 = linkMP3;
	}

	@Override
	public String toString() {
		return "Music [id=" + id + ", title=" + title + ", artist=" + artist + ", album=" + album + ", style=" + style
				+ ", linkMP3=" + linkMP3 + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(album, artist, id, linkMP3, style, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Music other = (Music) obj;
		return Objects.equals(album, other.album) && Objects.equals(artist, other.artist) && id == other.id
				&& Objects.equals(linkMP3, other.linkMP3) && style == other.style && Objects.equals(title, other.title);
	}
}
