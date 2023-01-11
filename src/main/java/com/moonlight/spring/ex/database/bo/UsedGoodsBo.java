package com.moonlight.spring.ex.database.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonlight.spring.ex.database.dao.UsedGoodsDao;
import com.moonlight.spring.ex.database.model.UsedGoods;

@Service
public class UsedGoodsBo {
	
	// 웹서버는 많은 사람들이 접속한다. 클래스 안에 객체 생성하면 너무 많다.
	// 혹은 개발자들이 잘못 생성할 수도 있어서 spring에서는 @Autowired로 직접 객체 관리함
	@Autowired
	private UsedGoodsDao usedGoodsDao;
	
	
	// used_goods 테이블을 전체 데이터 조회 기능
	public List<UsedGoods> getUsedGoodsList() {
		List<UsedGoods> usedGoodsList = usedGoodsDao.selectUsedGoodsList();
		return usedGoodsList;
	}
}
