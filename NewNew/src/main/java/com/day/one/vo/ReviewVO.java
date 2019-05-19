package com.day.one.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int program_progSeq;
	
	private int user_userNumber;
	
	private Date reviewDate;
	
	private int reviewRate;
	
	private int likeCount;
	
	private String reviewComment;
	
	private String uploadLocation;
	
}
