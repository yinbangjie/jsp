package com.lol.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lol.model.Hero;

public class HeroManager {

	private Hero hero;// ��������ݿ��ڻ�ȡ��һ��Ӣ������ private List<Hero>
						// heroes;//��������ݿ��ڻ�ȡ�Ķ��Ӣ������

	private Connection conn; // ���ݿ���ر��� private Statement stmt;
	private ResultSet rs;
	private PreparedStatement ps;

	/*
	 * * ���ݴ��ݹ�����id����һ��Ӣ��
	 * 
	 */

	public Hero findOne(int id) {

		conn = getConnetion();

		try {

			stmt = conn.createStatement();

			// ִ�в�ѯ

			rs = stmt.executeQuery("select * from hero where id = " + id);

			hero = new Hero(id);

			// ����ȡ���Ľ����(rs)���ŵ�hero�����װ�á�

			while (rs.next()) {

				hero.setName(rs.getString("name"));
				hero.setNickName(rs.getString("nick_name"));
				hero.setImage(rs.getString("image"));
				hero.setAvatar(rs.getString("avatar"));
				hero.setDesc(rs.getString("description"));

			}

			rs.close();
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		// ���ط�װ�õ�hero��

		return hero;

	}

	/*
	 * 
	 * ��������Ӣ��
	 * 
	 */

	public List<Hero> findAll() {
		conn = getConnetion();
		try {
			stmt = conn.createStatement();
			// ִ�в�ѯ

			rs = stmt.executeQuery("select * from hero");
			// ����һ���б����heroes�������е�hero

			heroes = new ArrayList<Hero>();

			while (rs.next()) {

				// ÿ��һ�����ݾ�������һ��hero
				hero = new Hero();

				// ��ÿһ�����ݵ�ֵȡ��������ղ�������hero��

				hero.setId(rs.getInt("id"));
				hero.setName(rs.getString("name"));
				hero.setNickName(rs.getString("nick_name"));
				hero.setImage(rs.getString("image"));
				hero.setAvatar(rs.getString("avatar"));
				hero.setDesc(rs.getString("description"));

				// ��װ�õ�hero�ŵ�֮ǰ������heroes�б��С�

				heroes.add(hero);

			}

			rs.close();
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		// �������е�Ӣ��

		return heroes;

	}

	/*
	 * * ����һ��Ӣ��
	 * 
	 */

	public void add(Hero hero) {

		String sql = "insert into hero (name, nick_name, avatar, image, description) values(?,?,?,?,?)";

		conn = getConnetion();

		try {

			// Ԥ����׼�������ݿ�����µ�Ӣ��
			ps = conn.prepareStatement(sql);

			// �Ӵ��ݹ�����hero��ȡ��Ӣ�۵����ԣ����뽫Ҫ��ѯ��sql�С�

			ps.setString(1, hero.getName());
			ps.setString(2, hero.getNickName());
			ps.setString(3, hero.getAvatar());
			ps.setString(4, hero.getName());
			ps.setString(5, hero.getDesc());
			// ִ�в�ѯ��

			ps.executeUpdate();

			ps.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/*
	 * * �޸�һ��Ӣ��
	 * 
	 */

	public void modify(Hero hero) {

		String sql = "update hero set name = ?, nick_name = ?, avatoar = ?" + "image = ?, description = ? where id = ?";

		conn = getConnetion();
		try {

			// Ԥ����׼�������ݿ���µ�Ӣ��
			ps = conn.prepareStatement(sql);

			// �Ӵ��ݹ�����hero��ȡ��Ӣ�۵����ԣ����뽫Ҫ��ѯ��sql�С�

			ps.setString(1, hero.getName());
			ps.setString(2, hero.getNickName());
			ps.setString(3, hero.getAvatar());
			ps.setString(4, hero.getName());
			ps.setString(5, hero.getDesc());
			ps.setInt(6, hero.getId());

			// ִ�в�ѯ��

			ps.executeUpdate();

			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/*
	 * * ��ȡ���ݿ�����
	 * 
	 */

	public Connection getConnetion() {

		String driverName = "com.mysql.jdbc.Driver";

		String url = "jdbc:mysql://localhost:3306/lol";

		String user = "root";

		String password = "";

		try {

			Class.forName(driverName);

			return DriverManager.getConnection(url, user, password);// �����ӺõĶ���connection���أ������á�
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;

		}

	}

	public HeroManager() {

	}

}