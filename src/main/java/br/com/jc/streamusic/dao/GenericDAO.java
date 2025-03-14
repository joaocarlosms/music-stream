package br.com.jc.streamusic.dao;

import java.util.List;

public interface GenericDAO {
	
	public void create(Object obj);
	
	public List<Object> read(Object obj);
	
	public void update(Object obj);
	
	public void delete(Object obj);
}
