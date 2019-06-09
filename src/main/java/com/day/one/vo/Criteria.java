package com.day.one.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum;
  private int amount;
  private int startNum;

  public Criteria() {
    this(1, 6, 1);
  }

  public Criteria(int pageNum, int amount, int startNum) {
    this.pageNum = pageNum;
    this.amount = amount;
    this.startNum = startNum;
  }
  
}
