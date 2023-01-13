package com.moonlight.spring.ex.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moonlight.spring.ex.mybatis.bo.ReviewBO;
import com.moonlight.spring.ex.mybatis.model.Review;

@Controller
@RequestMapping("/mybatis/")
public class ReviewController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	// id가 3인 데이트 조회
	@ResponseBody
	@RequestMapping("ex01")
	public Review review(
			@RequestParam("id") int id		// 필수다. 가장 많이 사용함. 사용자가 id를 요청하지 않으면 400 bad gate나옴
//			@RequestParam(value="id" required=false) int id		// required=false > 필수는 아니다. 이런 경우 500로 나옴
//			@RequestParam(value="id" defaultValue="3") int id	// id가 전달되면 id로 처리됨. 전달되지 않을 때는 3의 결과로 나옴
			) {
		
		
		Review review = reviewBO.getReview(id);
		
		return review;
	}
	
	// insert기능
	@ResponseBody
	@RequestMapping("ex02")
	public String addReview() {
		
//		int count = reviewBO.addReview(4, "콤비네이선피자", "황혜원", 4.0, "할인도 많고 맛이 괜찮습니다.");
//		return "실행결과: " + count;
		
		Review review = new Review();
		review.setStoreId(2);
		review.setMenu("뿌링클");
		review.setUserName("왕가네");
		review.setPoint(5.0);
		review.setReview("열라 맛있어!!");
		
		int count = reviewBO.addReviewByObject(review);
		
		return "실행결과: " + count;
 	}
	
}
