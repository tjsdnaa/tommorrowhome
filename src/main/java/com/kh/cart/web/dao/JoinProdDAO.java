package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.cart.dto.CartProdDTO; // 경로 확인
import com.kh.web.cart.dto.JoinProdDTO;


import com.kh.mybatis.SqlMapConfig;

import java.util.ArrayList;
import java.util.List;

public class JoinProdDAO {
    private SqlSessionFactory sqlSessionFactory;

    public JoinProdDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public List<JoinProdDTO> getCartProducts(int cartNum){
    	System.out.println("cartNum : " + cartNum);
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		List<JoinProdDTO> joinprod = new ArrayList<>();
    		List<JoinProdDTO> joinprod2 = new ArrayList<>();
    		
    		joinprod = sqlSession.selectList("Join.getJoinProd",cartNum);
    		System.out.println("joinprod ; " + joinprod);
    		
    		joinprod2 = sqlSession.selectList("Join.getJoinProd2");
    		System.out.println("joinprod2 ; " + joinprod2);
    		return joinprod;
        }
    }
}
