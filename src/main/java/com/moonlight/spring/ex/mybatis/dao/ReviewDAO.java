package com.moonlight.spring.ex.mybatis.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.moonlight.spring.ex.mybatis.model.Review;

@Repository
public interface ReviewDAO {

	// id가 3인 데이터 조회
	public Review selectReview(@Param("id") int id);
	
	// insert기능
	// 실행된 행의 갯수를 리턴 받음. > 리턴타입 int
	public int insertReview(
			@Param("storeId") int storeId
			, @Param("menu") String menu
			, @Param("userName") String userName
			, @Param("point") double point
			, @Param("review") String review
			);
	
	// 모든 parameter 존재하는 객체 호출을 통해 입력하는 경우
	public int insertReviewByObject(Review review);
}
