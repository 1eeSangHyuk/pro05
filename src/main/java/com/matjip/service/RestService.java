package com.matjip.service;


import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.matjip.bean.PageBean;
import com.matjip.bean.RestBean;
import com.matjip.bean.UserBean;
import com.matjip.dao.RestDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class RestService {

	@Autowired
	private RestDAO restDAO;
	
//Session Scope 에 있는 UserBean 객체 주입받아야함
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	// 파일 업로드 경로
	@Value("${path.upload}")
	private String pathUpload;
	
	// 페이징 관련 변수 : 페이지당 게시글의 개수
	@Value("${page.listcnt}")
	private int pageListcnt;
	
	// 페이징 관련 변수 : 페이지 버튼 개수
	@Value("${page.paginationcnt}")
	private int pagePaginationcnt;
	
	//파일을 저장하는 메소드
	private String saveUploadFile(MultipartFile uploadFile) {
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		
		try {
			uploadFile.transferTo(new File(pathUpload + "/" + fileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		return fileName;
		
	}
		
	public void addRestInfo(RestBean writeRestBean) {
		
		/*
		 * System.out.println(writeContentBean.getContent_subject());
		 * System.out.println(writeContentBean.getContent_text());
		 * System.out.println(writeContentBean.getUpload_file());
		 * System.out.println(writeContentBean.getUpload_file().getSize());
		 */
		
		MultipartFile uploadFile = writeRestBean.getUpload_file();
		
		if(uploadFile.getSize() > 0) {
			
		// 파일이름
		String fileName = saveUploadFile(uploadFile);
		System.out.println("fileName : " + fileName);
		writeRestBean.setRs_file(fileName);
	}
		
		//현재 로그인 상태인 사람이 작성자가 됨
		// 작성자 인덱스번호(content_writer_idx) 에
		// 현재 로그인 상태인 사람(UserBean("loginUserBean")) 의
			
			// Service 에서 DAO(Repository) 에 있는 addRestInfo() 호출하기
			restDAO.addRestInfo(writeRestBean);
				
		}

	//게시글 리스트 가져오기
	public List<RestBean> getRestList(int page){

//		page	pagination number
//		1	->	0	(start)	<- (page - 1) * pageListcnt(10)
//		2	->	10
//		3	->	20
		
		int start = (page - 1) * pageListcnt;
		
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		
		// System.out.println(noticeDAO.getNotiList(rowBounds));	
		//System.out.println("restList 서비스 :" + restDAO.getRestList());
		return restDAO.getRestList(rowBounds);
	}
	
	//상세페이지에 출력할 데이터 가져오기
	public RestBean getRestDetail(int rs_idx) {
		
		return restDAO.getRestDetail(rs_idx);
	}
	
	//수정페이지에서 게시글 수정하기
	public void modifyRestInfo(RestBean modifyRestBean) {
				
	MultipartFile upload_file = modifyRestBean.getUpload_file();
		
	if(upload_file.getSize() > 0) {
			
	//파일이름
  String file_name = saveUploadFile(upload_file);
  System.out.println("fileName : " + file_name);
  modifyRestBean.setRs_file(file_name);
}
	
	restDAO.modifyRestInfo(modifyRestBean);
}
	// 게시글 전체 개수 가져오기
	// Controller 로부터 int content_board_idx, int currentP 값을 받아옴
	// pageListcnt : 페이지당 게시글의 개수
	// pagePaginationcnt : 페이지 버튼 개수	
	public PageBean getRestCnt(int currentP) {
		
		int restCnt = restDAO.getRestCnt();
		
		PageBean pageBean = new PageBean(restCnt, currentP, pageListcnt, pagePaginationcnt);
		
		// System.out.println(pageListcnt);
		return pageBean;
	}
	
		//게시글 삭제하기
		public void deleteRestInfo(int rs_idx) {
		
			restDAO.deleteRestInfo(rs_idx);
	}
	
}