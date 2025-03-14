package br.com.jc.streamusic.dao;

import java.util.ArrayList;
import java.util.List;

import br.com.jc.streamusic.model.Music;
import br.com.jc.streamusic.model.Playlist;
import br.com.jc.streamusic.model.User;

public class UserDAO implements GenericDAO {
	
	@Override
	public void create(Object obj) {

	}

	@Override
	public List<Object> read(Object obj) {
		User user = new User();
		user.setId("1");
		user.setEmail("jcdev@gmail.com");
		user.setName("joao");
		user.setPassword("admin");
		
		ArrayList<Playlist> playlists = new ArrayList<>();
		Playlist list1 = new Playlist();
		list1.setId("1");
		list1.setTitle("ROCK");
		ArrayList<Music> musics = new ArrayList<>();
		Music m1 = new Music();
		m1.setId(1);
		m1.setArtist("ACDC");
		m1.setTitle("Wasted Years");
		m1.setAlbum("TNT");
		m1.setLinkMP3("api/musics/ACDC/Wasted Years.mp3");
		musics.add(m1);
		list1.setMusics(musics);
		playlists.add(list1);
		
		ArrayList<Object> result = new ArrayList<>();
		result.add(user);
		
		return result;
	}
	
	@Override
	public void update(Object obj) {
		
	}
	
	@Override
	public void delete(Object obj) {

	}
}

