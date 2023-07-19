package com.matjip.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/region/{rs_region_cate}")
	public String reviewByReviewCnt(@PathVariable String rs_region_cate, Model model) {
		List<ReviewBean> reviewList = reviewService.reviewByRegionCate(rs_region_cate);
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/insertReview")
	public String getInsertReview(@ModelAttribute ReviewBean reviewBean, Model model) {
		return "review/insert";
	}
	
	@PostMapping("/insertReview")
	public String postInsertReview(@Valid @ModelAttribute ReviewBean reviewBean, BindingResult result) {
		if(result.hasErrors()) {
			result.getAllErrors().forEach((err)->{
				System.out.println(err);
				System.out.println("-------------");
			});
			return "review/insert";
		}
		reviewService.insertReview(reviewBean);
		return "review/insertSuccess";
	}
	
	@GetMapping("/updateReview")
	public String getUpdateReview(@RequestParam int rev_idx, Model model) {
		ReviewBean reviewBean = reviewService.reviewByRevId(rev_idx);
		model.addAttribute("reviewBean", reviewBean);
		return "review/update";
	}
	
	@PostMapping("/updateReview")
	public String postUpdateReview(@Valid @ModelAttribute ReviewBean reviewBean, BindingResult result) {
		if(result.hasErrors()) {
			return "review/update";
		}
		reviewService.updateReview(reviewBean);
		return "review/updateSuccess";
	}
	
	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam int rev_idx) {
		reviewService.deleteReview(rev_idx);
		return "review/deleteSuccess";
	}
	
	@GetMapping("/invalidUser")
	public String invalidUser() {
		return "review/invalid_user";
	}
}