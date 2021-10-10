package io.github.phuocnguyenhuu.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import io.github.phuocnguyenhuu.DBConnection.MySqlConnection;
import io.github.phuocnguyenhuu.vo.tweet_vo;

public class Tweet {
	public String content, id, code;
	

	String table = "tweets";
	MySqlConnection db;

	public Tweet() {
		this.content = this.id = this.code = "";
		db = new MySqlConnection();
		
	}

	public Tweet(String airlineId) {
		db = new MySqlConnection();
		String sql = "SELECT * FROM " + this.table + " WHERE id='" + airlineId + "'";
		try {
			ResultSet result = this.db.statement.executeQuery(sql);
			while (result.next()) {
				this.content = result.getString("content");
				this.id = result.getString("id");				
				this.code = result.getString("code");
				
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<tweet_vo> getAll() {
		ArrayList<tweet_vo> tweets = new ArrayList<tweet_vo>();
		String sqlQuery = "SELECT * FROM " + this.table;
		try {
			ResultSet result = db.statement.executeQuery(sqlQuery);
			while (result.next()) {
				tweet_vo a = new tweet_vo();
				a.setId(result.getString("id"));
				a.setContent(result.getString("content"));
				a.setCode(result.getString("code"));				
				tweets.add(a);				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tweets;
	}

	public void Save() {
		if (this.id.equals("")) {
			this.CreateNew();
		} else {
			this.CreateNew();
		}

	}

	public void Delete(String trnId) {
		String sql = "DELETE FROM " + this.table + " WHERE id = '" + trnId + "'";
		try {
			this.db.statement.executeUpdate(sql);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}
	
	public void ReTweet(String userName,  String content) {
		String sql = "INSERT INTO " + this.table + "(content,code)" + " VALUES('" + content + "','"
				+ userName  + "')";
		try {
			this.db.statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private int CreateNew() {
		String sqlQquery = "";
		sqlQquery = "INSERT INTO " + this.table + "(content,code)" + " VALUES('" + this.content + "','"
				+ this.code  + "')";

		try {
			return this.db.statement.executeUpdate(sqlQquery, Statement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return 0;
	}
}