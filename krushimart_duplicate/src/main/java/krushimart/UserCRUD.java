package krushimart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserCRUD {

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		// load the driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// establish connection
		Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/krushimart?user=root&password=root");
		return connection;
	}

	public int registerUser(User user) throws SQLException, ClassNotFoundException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection
				.prepareStatement("insert into user_table values(?,?,?,?,?,?,?,?)");
		preparedStatement.setString(2, user.getFirst_name());
		preparedStatement.setString(3, user.getLast_name());
		preparedStatement.setLong(4, user.getPhone());
		preparedStatement.setString(5, user.getAddress());
		preparedStatement.setString(6, user.getEmail());
		preparedStatement.setString(7, user.getPassword());
		preparedStatement.setString(8, user.getRole());
		preparedStatement.setInt(1, user.getId());

		int count = preparedStatement.executeUpdate();
		connection.close();
		return count;
	}

	public String[] fetchUser(String userEmail) throws ClassNotFoundException, SQLException {

		Connection connection = getConnection();

		PreparedStatement preparedStatement = connection
				.prepareStatement("SELECT ID,PASSWORD,ROLE FROM USER_TABLE WHERE EMAIL=?");
		preparedStatement.setString(1, userEmail);

		ResultSet resultSet = preparedStatement.executeQuery();

		String dbPass = null;
		String role = null;
		String id = null;
		while (resultSet.next()) {

			dbPass = resultSet.getString("password");
			role = resultSet.getString("role");
			id = resultSet.getString("id");
		}

		connection.close();

		return new String[] { dbPass, role, id };

	}

	public User fetchUserObject(int id) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();

		PreparedStatement preparedStatement = connection
				.prepareStatement("SELECT * FROM USER_TABLE WHERE ID=?");
		preparedStatement.setInt(1, id);

		ResultSet resultSet = preparedStatement.executeQuery();

		User user = new User();
		
		while (resultSet.next()) {
			
			user.setId(resultSet.getInt("id"));
			user.setFirst_name(resultSet.getString("first_name"));
			user.setLast_name(resultSet.getString("last_name"));
			user.setEmail(resultSet.getString("email"));
			user.setAddress(resultSet.getString("address"));
			user.setPhone(resultSet.getLong("phone"));
			user.setPassword(resultSet.getString("password"));
			user.setRole(resultSet.getString("role"));
			
		}

		connection.close();
		
		return user;

	}
	public int updateUser(User user) throws ClassNotFoundException, SQLException {
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE USER_TABLE SET first_name=?,last_name=?,email=?,address=?,phone=?,password=? where id=?");	
		preparedStatement.setString(1, user.getFirst_name());
		preparedStatement.setString(2, user.getLast_name());
		preparedStatement.setLong(5, user.getPhone());
		preparedStatement.setString(4, user.getAddress());
		preparedStatement.setString(3, user.getEmail());
		preparedStatement.setString(6, user.getPassword());
		
		preparedStatement.setInt(7, user.getId());
		
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}
	public int updatePassword(String email,String newPassword) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();

		PreparedStatement preparedStatement = connection
				.prepareStatement("UPDATE USER_TABLE SET PASSWORD=? WHERE EMAIL=?");
		preparedStatement.setString(1, newPassword);
		preparedStatement.setString(2, email);
		
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}
	
	public int getRecordCount() throws ClassNotFoundException, SQLException {
		
		Connection connection = getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) as count FROM USER_TABLE");
		
		ResultSet resultSet=preparedStatement.executeQuery();
		
		int count=0;
		while(resultSet.next()) {
			count=resultSet.getInt("count");
		}
		connection.close();
		return count;
	}
}
