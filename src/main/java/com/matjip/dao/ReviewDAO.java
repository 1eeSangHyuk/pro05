package com.matjip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.ReviewBean;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReview(ReviewBean reviewBean) {
		sqlSessionTemplate.insert("review.insertReview", reviewBean);
	}

	public void updateReview(ReviewBean reviewBean) {
		sqlSessionTemplate.update("review.updateReview", reviewBean);
	}
	
	public void deleteReview(int rev_idx) {
		sqlSessionTemplate.delete("review.deleteReview", rev_idx);
	}
		
	public ReviewBean reviewByRevId(int rev_idx){
		return sqlSessionTemplate.selectOne("review.reviewByRevId", rev_idx);
	}
	
	public List<ReviewBean> reviewAll(){
		return sqlSessionTemplate.selectList("review.reviewAll");
	}
	
	public List<ReviewBean> reviewByResId(int rs_idx){
		return sqlSessionTemplate.selectList("review.reviewByResId", rs_idx);
	}
	
	public List<ReviewBean> reviewByRegionCate(String rs_region_cate){
		return sqlSessionTemplate.selectList("review.reviewByRegionCate", rs_region_cate);
	}
}
