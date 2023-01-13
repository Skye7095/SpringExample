package com.moonlight.spring.ex.mybatis.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonlight.spring.ex.mybatis.dao.ReviewDAO;
import com.moonlight.spring.ex.mybatis.model.Review;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	// id가 3인 데이터 조회
	public Review getReview(int id) {
		Review review = reviewDAO.selectReview(id);
		return review;
	}
	
	
	// insert기능
	// 실행된 행의 갯수를 리턴 받음. > 리턴타입 int
	// 직접 모든 parameter를 입력하는 경우
	public int addReview(int storeId, String menu, String userName, double point, String review) {
		return reviewDAO.insertReview(storeId, menu, userName, point, review);
	}
	
	// 모든 parameter 존재하는 객체 호출을 통해 입력하는 경우
	public int addReviewByObject(Review review) {
		return reviewDAO.insertReviewByObject(review);
	}
}
