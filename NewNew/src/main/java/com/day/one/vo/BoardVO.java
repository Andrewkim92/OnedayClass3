package com.day.one.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

//	*****info 테이블*****
	
	private int seq_class;
	
	private int userNumber;
	
	private String i_title;
	
	private String sub_title;
	
	private int price;
	
	private char approval;
	
	private char zip_code;
	
	private String address;
	
	private String address_detail;
	
	private String class_date;

	private String class_time_start;
	
	private int class_time_during_time;
	
	private String file_path;
	
	private String inclusion;
	
	private String exclusion;
	
	private String details;
	
	private String preparation;
	
	private String i_content;
	
	private Date reg_date;
	
	private Date mod_date;

//	*****applicant 테이블******
	
	private char deposit_check;
	
	private Date deposit_date;
	
	private char attendance_check;
	
	private Date a_reg_date;
	
//	*****review 테이블*****

	private int seq_review;
	
	private String r_title;
	
	private int score;
	
	private String r_content;
	
	private Date r_reg_date;
}
