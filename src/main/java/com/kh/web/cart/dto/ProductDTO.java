package com.kh.web.cart.dto;

public class ProductDTO {
	 private int prodNum;           // PROD_NUM
	    private String prodCategory;   // PROD_CATEGORY
	    private String prodName;       // PROD_NAME
	    private int prodPrice;         // PROD_PRICE
	    private String prodImage;  
	    
	    public String getImageUrl(){
	    	return prodImage;// PROD_IMAGE
	    }
		public int getProdNum() {
			return prodNum;
		}
		public void setProdNum(int prodNum) {
			this.prodNum = prodNum;
		}
		public String getProdCategory() {
			return prodCategory;
		}
		public void setProdCategory(String prodCategory) {
			this.prodCategory = prodCategory;
		}
		public String getProdName() {
			return prodName;
		}
		public void setProdName(String prodName) {
			this.prodName = prodName;
		}
		public int getProdPrice() {
			return prodPrice;
		}
		public void setProdPrice(int prodPrice) {
			this.prodPrice = prodPrice;
		}
		public String getProdImage() {
			return prodImage;
		}
		public void setProdImage(String prodImage) {
			this.prodImage = prodImage;
		}
}
