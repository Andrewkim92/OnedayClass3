package com.day.one.common;

import lombok.Data;

@Data
public class ReviewPager {
	// 페이지당 게시물 수
	public static final int PAGE_SCALE = 5;
	// 화면당 페이지 수
	public static final int BLOCK_SCALE = 4;
	
	// 현재 페이지
	private int curPage;
	
	//이전 페이지
	private int prevPage;
	
	//다음 페이지
	private int nextPage;
	
	// 총 페이지 수
	private int pageCnt;
	
	// 총 블럭 수
	private int totBlock;
	
	// 현재 블럭
	private int curBlock;
	
	//이전 블럭
	private int prevBlock;
	
	//다음 블럭
	private int nextBlock;
	
	// 총 리뷰 개수
	private int reviewCnt;
	
	// 시작 페이지
	private int startPage;
	
	// 끝 페이지
	private int endPage;
	
	//시작 인덱스
	private int startIndex = 0;
	
	//블럭 시작번호
	private int blockBegin;
	
	//블럭 끝번호
	private int blockEnd;

	
	public ReviewPager(int reviewCnt, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setPageCnt(reviewCnt);
		setPageRange();
		setTotBlock();
		setBlockRange();
		setReviewCnt(reviewCnt);
		
	}
	
	public void setBlockRange() {
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		blockEnd = blockBegin+BLOCK_SCALE-1;
		if(blockEnd > pageCnt) blockEnd = pageCnt;
		prevPage = (curPage == 1)? 1:curPage-1;
		nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : curPage+1;
		if(nextPage >= pageCnt) nextPage = pageCnt;
	}
	
	public void setPageRange() {
		startPage = (curPage-1)*PAGE_SCALE;
		endPage = startPage+PAGE_SCALE-1;
	}
	
	public void setPageCnt(int count) {
		pageCnt = (int) Math.ceil(count*1.0 / PAGE_SCALE);
	}
	
	public void setTotBlock() {
		totBlock = (int)Math.ceil(pageCnt / BLOCK_SCALE)+1;
	}
	
	
}
