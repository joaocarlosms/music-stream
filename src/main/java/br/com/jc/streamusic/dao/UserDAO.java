package br.com.jc.streamusic.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import br.com.jc.streamusic.model.Music;
import br.com.jc.streamusic.model.Playlist;
import br.com.jc.streamusic.model.User;

public class UserDAO implements GenericDAO {
	private DataSource dataSource;
	
	public UserDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void create(Object obj) {
		try {
			if(obj instanceof User) {
				User user = (User) obj;
				String sql = "INSERT INTO tbluser VALUES (null, ?, ?, ?);";
				PreparedStatement stmt = dataSource.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				stmt.setString(1, user.getName());
				stmt.setString(2, user.getEmail());
				stmt.setString(3, user.getPassword());
				
				int res = stmt.executeUpdate();
				
				if(res != 0) {
					ResultSet rs = stmt.getGeneratedKeys();
					
					if(rs.next()) {
						user.setId(rs.getInt(1));
					}
					rs.close();
				}
				stmt.close();
			}
			else {
				throw new RuntimeException("Invalid User Model Object");
			}
		}
		catch(SQLException e) {
			System.out.println("Erro ao inserir user"+e.getMessage());
		}
	}

	@Override
	public List<Object> read(Object obj) {
		try {
			if(obj instanceof User) {
				User usr = (User) obj;
				String sql = "SELECT * FROM tbluser WHERE email = ? AND password = ?;";
				PreparedStatement stmt = dataSource.getConnection().prepareStatement(sql);
				stmt.setString(1, usr.getEmail());
				stmt.setString(2, usr.getPassword());
				ResultSet rs = stmt.executeQuery();
				
				ArrayList<Object> result = new ArrayList<Object>();
				
				if(rs.next()) {
					User user = new User();
					user.setId(rs.getInt("idUser"));
					user.setName(rs.getString("nome"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					
					result.add(user);
				}
				stmt.close();
				rs.close();
				return result;
			}	
			else {
				throw new RuntimeException("Invalid Object");
			}
		}
		catch(SQLException e) {
			System.out.println("Error ao recuperar user: "+e.getMessage());
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

