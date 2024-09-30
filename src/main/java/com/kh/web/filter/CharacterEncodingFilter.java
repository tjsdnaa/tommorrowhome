package com.kh.web.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, 
			ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
//		System.out.println("before filter");
		// filterchanin으로 다음 작업 진행 여부를 정한다
		arg0.setCharacterEncoding("UTF-8");
		arg2.doFilter(arg0, arg1);
		arg1.setCharacterEncoding("UTF-8");
		arg1.setContentType("text/html; charset=UTF-8");
//		System.out.println("after filter");
		
	}

}









