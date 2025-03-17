package br.com.jc.streamusic.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	}

	@Override
	public List<Object> read(Object obj) {
		try {
			if(obj instanceof User) {
				
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

