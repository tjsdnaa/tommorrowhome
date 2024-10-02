package com.kh.app.shopping;

import java.sql.Date;
import java.util.Calendar;

import com.kh.app.shopping.dao.Review2DTO;
import com.kh.app.shopping.dao.ReviewDTO;
import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShoppingDAO sdao = new ShoppingDAO();
		/* ReviewDTO review = new ReviewDTO(); */
		Review2DTO review = new Review2DTO();


		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		String REVIEW_CONTENTS = request.getParameter("REVIEW_CONTENTS");
		String RATING = request.getParameter("RATING");
		
		// REVIEW_DATE를 현재 날짜로 설정
        Date currentDate = new Date(Calendar.getInstance().getTimeInMillis());
        review.setREVIEW_DATE(currentDate); // 현재 날짜 설정
        
		
		review.setREVIEW_CONTENTS(REVIEW_CONTENTS);
		review.setPROD_NUM(prod_num);
		if (RATING != null && !RATING.isEmpty()) {
	        review.setRATING(Double.parseDouble(RATING));
	    }
		
		if(sdao.addReview(review)) {
			forward.setRedirect(true);
			//System.out.println(prod_num);
			forward.setPath("/app/shopping/shopping_detailview.jsp?prod_num="+prod_num);
		}
		
		
		return forward;
	}

}
