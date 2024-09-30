package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.cart.dto.CartProdDTO; // 경로 확인
import com.kh.mybatis.SqlMapConfig;

import java.util.List;

public class CartProdDAO {
    private SqlSessionFactory sqlSessionFactory;

    public CartProdDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public void addProductToCart(int cartNum, int prodNum, int prodCnt, int prodPrice) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
            CartProdDTO cartProd = new CartProdDTO();
            cartProd.setCartNum(cartNum);
            cartProd.setProdNum(prodNum);
            cartProd.setProdCnt(prodCnt);
            cartProd.setProdPrice(prodPrice);
            sqlSession.insert("CartProdMapper.addProductToCart", cartProd);
        }
    }

    public List<CartProdDTO> getCartProducts(int cartNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("CartProdMapper.getCartProducts", cartNum);
        }
    }

    public void removeProductFromCart(int cartNum, int prodNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) { // true for auto-commit
            CartProdDTO cartProd = new CartProdDTO(cartNum, prodNum, 0, 0, null); // 수량과 가격은 0으로 설정
            sqlSession.delete("CartProdMapper.removeProductFromCart", cartProd);
        }
    }
}