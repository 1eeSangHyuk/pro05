package com.matjip.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.matjip.bean.ReviewBean;
import com.matjip.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping
	public String reviewMain() {
		return "review/main";
	}
	
	@GetMapping("/all")
	public String reviewAll(Model model) {
		List<ReviewBean> reviewList = reviewService.reviewAll();
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	
	 @GetMapping("/rs_idx/{rs_idx}") 
	 public String reviewByResId(@PathVariable int rs_idx, Model model) { 
		 List<ReviewBean> reviewList = reviewService.reviewByResId(rs_idx); 
		 model.addAttribute("reviewList",
		 reviewList); return "review/template"; 
	 }
	 
	
	@GetMapping("/region/{rs_region_cate}")
	public String reviewByReviewCnt(@PathVariable String rs_region_cate, Model model) {
		List<ReviewBean> reviewList = reviewService.reviewByRegionCate(rs_region_cate);
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/myReview/{sid}")
	public String reviewByRevId(@PathVariable int rev_idx, Model model) {
		List<ReviewBean> reviewList = reviewService.reviewByRevId(rev_idx);
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/insertReview")
	public String getInsertReview(@ModelAttribute ReviewBean reviewBean,
																@RequestParam int rs_idx,
			 													@RequestParam int page,
			 													Model model) {
		model.addAttribute("rs_idx", rs_idx);
		model.addAttribute("page", page);
		return "review/insert";
	}
	
	@PostMapping("/insertReview")
	public String postInsertReview(@Valid @ModelAttribute ReviewBean reviewBean,
																 @RequestParam int page,
																 BindingResult result, Model model) {
		model.addAttribute("rs_idx", reviewBean.getRs_idx());
		model.addAttribute("page", page);
		if(result.hasErrors()) {
			result.getAllErrors().forEach((err)->{
				System.out.println(err);
				System.out.println("-------------");
			});
			return "review/insert";
		}
		reviewService.insertReview(reviewBean);
		return "review/insert_success";
	}
	
	@GetMapping("/updateReview")
	public String getUpdateReview(@RequestParam int rev_idx,
																@RequestParam int page,
																@RequestParam int revPage,
																Model model) {
		ReviewBean reviewBean = reviewService.reviewByRevId(rev_idx);
		model.addAttribute("reviewBean", reviewBean);
		model.addAttribute("page", page);
		model.addAttribute("revPage", revPage);
		return "review/update";
	}
	
	@PostMapping("/updateReview")
	public String postUpdateReview(@Valid @ModelAttribute ReviewBean reviewBean, BindingResult result,
																 @RequestParam int page, @RequestParam int revPage, Model model) {
		model.addAttribute("rs_idx", reviewBean.getRs_idx());
		model.addAttribute("page", page);
		model.addAttribute("revPage", revPage);
		if(result.hasErrors()) {
			return "review/update";
		}
		reviewService.updateReview(reviewBean);
		return "review/update_success";
	}
	
	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam int rev_idx,
														 @RequestParam int rs_idx,
														 @RequestParam int page,
														 @RequestParam int revPage,
														 Model model) {
		model.addAttribute("rs_idx", rs_idx);
		model.addAttribute("page", page);
		model.addAttribute("revPage", revPage);
		reviewService.deleteReview(rev_idx);
		return "review/delete_success";
	}
	
	@GetMapping("/invalidUser")
	public String invalidUser() {
		return "review/invalid_user";
	}
}