package br.com.jc.streamusic.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import br.com.jc.streamusic.model.Music;

public class MusicDAO implements GenericDAO {
	private DataSource dataSource;
	
	public MusicDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void create(Object obj) {
		try {
			if(obj instanceof Music) {
				Music music = (Music) obj;
				String sql = "INSERT INTO tblmusic VALUES (null, ?, ?, ?, ?, ?);";
				PreparedStatement stmt = dataSource.getConnection().prepareStatement(sql);
				stmt.setString(1, music.getTitle());
				stmt.setString(2, music.getArtist());
				stmt.setString(3, music.getAlbum());
				stmt.setInt(4, music.getStyle());
				stmt.setString(5, music.getLinkMP3());
				stmt.executeUpdate();
				System.out.println("Music created with success!");
				stmt.close();
			}
			else {
				throw new RuntimeException("Erro Object Invalid");
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Object> read(Object obj) {
		return null;
	}

	@Override
	public void update(Object obj) {
	}

	@Override
	public void delete(Object obj) {
	}
}
