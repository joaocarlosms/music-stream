package br.com.jc.streamusic.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
		try {
			String SQL = "SELECT * FROM tblmusic ORDER BY title";
			PreparedStatement stmt = dataSource.getConnection().prepareStatement(SQL);
			ResultSet rs = stmt.executeQuery();
			List<Object> list = new ArrayList<Object>();
			
			while(rs.next()) {
				Music music = new Music();
				music.setId(rs.getInt("idMusic"));
				music.setTitle(rs.getString("title"));
				music.setArtist(rs.getString("artist"));
				music.setAlbum(rs.getString("album"));
				music.setStyle(rs.getInt("style"));
				music.setLinkMP3(rs.getString("linkMP3"));
				list.add(music);
			}
			
			return list;
		}
		catch(SQLException e) {
			System.out.println("Erro ao recuperar musica: "+e.getMessage());
		}
		
		return null;
	}

	@Override
	public void update(Object obj) {
	}

	@Override
	public void delete(Object obj) {
	}
}
