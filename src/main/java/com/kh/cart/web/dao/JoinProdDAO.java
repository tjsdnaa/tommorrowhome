package com.kh.cart.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.web.cart.dto.CartChangeDTO;
import com.kh.web.cart.dto.CartProdDTO; // 경로 확인
import com.kh.web.cart.dto.JoinProdDTO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.mybatis.SqlMapConfig;

import java.util.ArrayList;
import java.util.List;

public class JoinProdDAO {
    private SqlSessionFactory sqlSessionFactory;

    public JoinProdDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    public List<JoinProdDTO> getCartProducts(int cartNum){
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		List<JoinProdDTO> joinprod = new ArrayList<>();
    		List<JoinProdDTO> joinprod2 = new ArrayList<>();
    		
    		joinprod = sqlSession.selectList("Join.getJoinProd",cartNum);
    		
    		joinprod2 = sqlSession.selectList("Join.getJoinProd2");
    		return joinprod;
        }
    }
    
    
    
    public void setJoinProd(CartChangeDTO cartnum){
    	try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
    		System.out.println("cartNum1 : " +cartnum.getProdcnt());
    		sqlSession.update("Join.setJoinProd", cartnum);
    		sqlSession.commit();
        }
    }
}
