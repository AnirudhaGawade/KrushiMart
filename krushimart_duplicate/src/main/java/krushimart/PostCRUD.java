package krushimart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class PostCRUD {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		// load the driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// establish connection
		Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/krushimart?user=root&password=root");
		return connection;
	}
	
	public int InsertPost(Post post) throws ClassNotFoundException, SQLException {
		
		Connection connection = getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("insert into post_table values(?,?,?,?,?,?,?)");
		preparedStatement.setInt(1, post.getPostId());
		preparedStatement.setString(2, post.getProductName());
		preparedStatement.setString(3, post.getProductPrice());
		preparedStatement.setString(4, post.getProductQuantity());
		preparedStatement.setString(5, post.getProductDescription());
		preparedStatement.setBytes(6, post.getPostImage());
		preparedStatement.setInt(7, post.getFarmerId());
		
		int result = preparedStatement.executeUpdate();
		
		connection.close();
		
		return result;
		
	}
	
	public List<Post> getAllPosts() throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("select * from post_table");
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		List<Post> postList = new ArrayList<>();
		
		while(resultSet.next()) {
			Post post = new Post();
			post.setPostId(resultSet.getInt("post_id"));
			post.setProductName(resultSet.getString("product_name"));
			post.setProductPrice(resultSet.getString("product_price"));
			post.setProductQuantity(resultSet.getString("product_quantity"));
			post.setProductDescription(resultSet.getString("product_description"));
			post.setPostImage(resultSet.getBytes("product_image"));
			post.setFarmerId(resultSet.getInt("farmer_id"));
			
			postList.add(post);			
		}
		connection.close();
		return postList;
	}
	
	public List<Post> getPostByFarmerId(int id) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("select * from post_table  where farmer_id=?");
		preparedStatement.setInt(1, id);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		List<Post> postList = new ArrayList<>();
		
		while(resultSet.next()) {
			Post post = new Post();
			post.setPostId(resultSet.getInt("post_id"));
			post.setProductName(resultSet.getString("product_name"));
			post.setProductPrice(resultSet.getString("product_price"));
			post.setProductQuantity(resultSet.getString("product_quantity"));
			post.setProductDescription(resultSet.getString("product_description"));
			post.setPostImage(resultSet.getBytes("product_image"));
			post.setFarmerId(resultSet.getInt("farmer_id"));
			postList.add(post);			
		}
		connection.close();
		return postList;
	}
	public int getPostCount() throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT post_id FROM POST_TABLE");
		
		ResultSet resultSet=preparedStatement.executeQuery();
		
		if(!resultSet.next()) {
			return 0;
		}
		ArrayList<Integer> idList = new ArrayList<>();
		
		do {
			idList.add(resultSet.getInt("post_id"));
		}
		while(resultSet.next());
		
		int lastId = Collections.max(idList);
		connection.close();
		return lastId;
	}
	public int deletePost(int id) throws ClassNotFoundException, SQLException {
		Connection connection = getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM POST_TABLE WHERE POST_ID=?");
		preparedStatement.setInt(1, id);
		
		int result = preparedStatement.executeUpdate();
		
		connection.close();
		
		return result;
	}
}
