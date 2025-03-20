package br.com.jc.streamusic.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import br.com.jc.streamusic.model.Playlist;

public class PlaylistDAO implements GenericDAO {
	private DataSource dataSource;

	public PlaylistDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void create(Object obj) {
		try {
			if (obj instanceof Playlist) {
				Playlist pl = (Playlist) obj;
				String sql = "INSERT INTO tblplaylist VALUES (null, ?, ?);";
				PreparedStatement stmt = dataSource.getConnection().prepareStatement(sql,
						Statement.RETURN_GENERATED_KEYS);
				stmt.setString(1, pl.getTitle());
				stmt.setInt(2, pl.getUser().getId());
				int res = stmt.executeUpdate();

				if (res == 0) {
					throw new RuntimeException("Não foi possivel incluir playlist");
				}

				ResultSet rs = stmt.getGeneratedKeys();

				if (rs.next()) {
					pl.setId(rs.getInt(1));
					System.out.println("Playlist created with success!");
				}
			} else {
				throw new RuntimeException("Error Object Invalid");
			}
		} catch (SQLException e) {
			System.out.println("Error ao cadastrar new playlist: " + e.getMessage());
		}
	}

	@Override
	public List<Object> read(Object obj) {
		try {
			String sql = "SELECT * FROM tblplaylist WHERE idUser = ?;";
			int idUser = (int) obj;
			PreparedStatement stmt = dataSource.getConnection().prepareStatement(sql);
			stmt.setInt(1, idUser);
			ResultSet rs = stmt.executeQuery();
			ArrayList<Object> list = new ArrayList<>();

			while (rs.next()) {
				Playlist pl = new Playlist();
				pl.setId(rs.getInt("idPlaylist"));
				pl.setTitle(rs.getString("title"));
				list.add(pl);
			}

			rs.close();
			stmt.close();

			return list;
		} 
		catch (SQLException e) {
			System.out.println("Erro ao exibir playlists: " + e.getMessage());
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
