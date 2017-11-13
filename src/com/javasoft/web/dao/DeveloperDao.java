package com.javasoft.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("developerDao")
public class DeveloperDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	private DeveloperDao(){
		System.out.println("Successfully created Developer Dao");
	}
	@Autowired
	public void setDataSource(DataSource jdbc){
		this.jdbc= new NamedParameterJdbcTemplate(jdbc);
	}
	public List<Developer>getDevelopers(){
		return jdbc.query("select * from developer", new RowMapper<Developer>() {

			public Developer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Developer developer= new Developer();
				developer.setId(rs.getLong("id"));
				developer.setFirstName(rs.getString("firstname"));
				developer.setLastName(rs.getString("lastname"));
				developer.setEmail(rs.getString("email"));
				//developer.setSkills(rs.getString(""));
				return developer;
			}

		});}
		
public boolean create (Developer developer){
	BeanPropertySqlParameterSource paramMap = new BeanPropertySqlParameterSource(developer);
	return jdbc.update("insert into developer (firstname, lastname, email, skill) values (:firstName, :lastName, :email, :skills)", paramMap)==1;
	
	
}
public Developer getDeveloper(int id){
	MapSqlParameterSource params = new MapSqlParameterSource();
	params.addValue("id", id);
	
	return jdbc.queryForObject("select *from developer where id=:id", params, new RowMapper<Developer>(){

		@Override
		public Developer mapRow(ResultSet rs, int rowNum) throws SQLException {
			Developer developer= new Developer();
			developer.setId(rs.getLong("id"));
			developer.setFirstName(rs.getString("firstname"));
			developer.setLastName(rs.getString("lastname"));
			developer.setEmail(rs.getString("email"));
			//developer.setSkills(rs.getString(""));
			return developer;
		}
		
	});
}

}