package com.day.one.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	//첫번째 10페이지에 있을때는 prev=false,next=true
	//마지막 10페이지에 있을때는 prev=true,next=false
	//즉, 처음으로 가기, 끝으로 가기 화살표를 표시할지 말지 정함 
	private boolean prev, next;

	private int total;
	private Criteria cri;

	public PageDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		//현재페이지(pageNum)와 한페이당게시물수(amount)가 넘어와서 
		//1~10이 넘어오면 endPage=10, startPage=1
		//11~20이 넘어오면 endPage=20, startPage=11
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		//amount는 10이 디폴트고 127게시물이 있을때 realEnd=13페이지
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		//1보다 크다는 것은 11페이지 이후부터 prev는 계속 true
		this.prev = this.startPage > 1;
		
		//127게시물이 있고 11페이지에 있을 경우 next는 false
		this.next = this.endPage < realEnd;
	}

}
