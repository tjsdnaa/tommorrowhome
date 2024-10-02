package com.kh.web.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.kh.web.order.dto.OrdersDTO;
import com.kh.mybatis.SqlMapConfig;

public class OrdersDAO {
    private SqlSessionFactory sqlSessionFactory;

    public OrdersDAO() {
        sqlSessionFactory = SqlMapConfig.getFactory();
    }

    // 주문 추가
    public void addOrder(OrdersDTO order) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.insert("Orders.addOrder", order);
            sqlSession.commit(); // 커밋
        }
    }

    // 주문 조회
    public OrdersDTO getOrder(int orderNum) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("Orders.getOrder", orderNum);
        }
    }

	public void insertOrder(OrdersDTO order) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.insert("Orders.insertOrder", order);
        }
		
	}
}
