package krushimart;

public class Post {
	
	private int postId;
	private String productName;
	private String productQuantity;
	private String productPrice;
	private String productDescription;
	private byte[] postImage;
	private int farmerId;
	
	public Post() {
		// TODO Auto-generated constructor stub
	}

	public Post(int postId, String productName, String productQuantity, String productPrice, String productDescription,
			byte[] postImage, int farmerId) {
		super();
		this.postId = postId;
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
		this.productDescription = productDescription;
		this.postImage = postImage;
		this.farmerId = farmerId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public byte[] getPostImage() {
		return postImage;
	}

	public void setPostImage(byte[] postImage) {
		this.postImage = postImage;
	}

	public int getFarmerId() {
		return farmerId;
	}

	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}

	

		
	
	
}
