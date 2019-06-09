package com.day.one.vo;

import lombok.Data;

@Data
public class UserVO {
	
	private int userNumber;
	private String id;
	private String password;
	private String name;
	private int userGrade;
	private String intro;
	private String phoneNumber; 
	private int confirm;
	private String imgPath;
	
	
//	userNumber(pk+nn) / Id(nn) / password(nn) / name(nn) / userGrade(nn default-3) / intro / phoneNumber(nn) / confirm(nn default-0)
//	(userGrade – 0, black / 1, 운영자 / 2, 호스트 / 3, 커스터머)
//	(confirm – 0, 휴대폰 승인x / 1, 휴대폰 승인o)
//	int(11) / varchar(100) / varchar(45) / varchar(45) / int(11) / varchar(45) / varchar(200) / int(11) dd
	
}
