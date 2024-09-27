package com.kh.web.cart.dto;

public class CartProdDTO {
    private int cartNum;           // CART_NUM
    private int prodNum;           // PROD_NUM
    private int prodCnt;           // PROD_CNT
    private int prodPrice;         // PROD_PRICE
    private ProductDTO product;

    // 기본 생성자
    public CartProdDTO() {}

    // 매개변수를 받는 생성자
    public CartProdDTO(int cartNum, int prodNum, int prodCnt, int prodPrice, ProductDTO product) {
        this.cartNum = cartNum;
        this.prodNum = prodNum;
        this.prodCnt = prodCnt;
        this.prodPrice = prodPrice;
        this.product = product;
    }

    public ProductDTO getProduct() {
		return product;
	}

	public void setProduct(ProductDTO product) {
		this.product = product;
	}

	// Getters and Setters
    public int getCartNum() {
        return cartNum;
    }

    public void setCartNum(int cartNum) {
        this.cartNum = cartNum;
    }

    public int getProdNum() {
        return prodNum;
    }

    public void setProdNum(int prodNum) {
        this.prodNum = prodNum;
    }

    public int getProdCnt() {
        return prodCnt;
    }

    public void setProdCnt(int prodCnt) {
        this.prodCnt = prodCnt;
    }

    public int getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(int prodPrice) {
        this.prodPrice = prodPrice;
    }
}
