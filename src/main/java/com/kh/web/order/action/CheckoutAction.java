package com.kh.web.order.action;

import com.kh.web.action.ActionForward;
import com.kh.web.action.Action;
import com.kh.web.order.dao.OrdersDAO;
import com.kh.web.order.dto.OrdersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckoutAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();

        // 주문 정보를 받아오기
        String userId = (String) request.getSession().getAttribute("user_id");
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
        int totalProdCnt = Integer.parseInt(request.getParameter("totalProdCnt"));
        String addrDetail = request.getParameter("addrDetail");
        String zipCode = request.getParameter("zipCode");
        String tel = request.getParameter("tel");
        String reqMessage = request.getParameter("req");

        // OrdersDTO 객체 생성
        OrdersDTO order = new OrdersDTO();
        order.setUserId(userId);
        order.setTotalPrice(totalPrice);
        order.setTotalProdCnt(totalProdCnt);
        order.setAddrDetail(addrDetail);
        order.setZipCode(zipCode);
        order.setTel(tel);
        order.setReq(reqMessage);
        
        // DAO를 통해 DB에 주문 정보 저장
        OrdersDAO ordersDAO = new OrdersDAO();
        ordersDAO.insertOrder(order);

        // OrderProdDTO 객체와 OrderProdDAO를 사용하여 주문 상품 정보를 저장
        // 이 부분은 장바구니에서 상품 정보를 가져와서 반복문으로 저장해야 함

        forward.setPath("/orderConfirmation.jsp"); // 주문 확인 페이지로 리다이렉트
        return forward;
    }
}
