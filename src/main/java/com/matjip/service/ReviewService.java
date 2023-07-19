package com.matjip.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.matjip.bean.ReviewBean;
import com.matjip.dao.ReviewDAO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Value("${uploadPath}")
	private String uploadPath; 
	
	// 파일 업로드
	private String saveUploadFile(MultipartFile uploadFile) {
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		try {
			uploadFile.transferTo(new File(uploadPath+"/"+fileName));
		} catch (IllegalStateException | IOException e) {
		}
		return fileName;
	}
	
	public void insertReview(ReviewBean reviewBean) {
		MultipartFile uploadFile = reviewBean.getUpload_file();
		if(uploadFile.getSize()>0) {
			String rev_file = saveUploadFile(uploadFile);
			reviewBean.setRev_file(rev_file);
		}
		
		// 받아오면 삭제
		reviewBean.setRs_idx("1");
		reviewBean.setRev_id("user41");
		
		reviewDAO.insertReview(reviewBean);
	}
	
	public void updateReview(ReviewBean reviewBean) {
		MultipartFile uploadFile = reviewBean.getUpload_file();
		if(uploadFile.getSize()>0) {
			String rev_file = saveUploadFile(uploadFile);
			reviewBean.setRev_file(rev_file);
		}
		reviewDAO.updateReview(reviewBean);
	}
	
	public void deleteReview(int rev_idx) {
		reviewDAO.deleteReview(rev_idx);
	}
	
	public ReviewBean reviewByRevId(int rev_idx){
		return reviewDAO.reviewByRevId(rev_idx);
	}
	
	public List<ReviewBean> reviewAll(){
		return reviewDAO.reviewAll();
	}
	
	public List<ReviewBean> reviewByResId(int rs_idx){
		return reviewDAO.reviewByResId(rs_idx);
	}
	
	public List<ReviewBean> reviewByRegionCate(String rs_region_cate){
		return reviewDAO.reviewByRegionCate(rs_region_cate);
	}
}
