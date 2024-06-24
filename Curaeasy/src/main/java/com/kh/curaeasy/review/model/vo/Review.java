package com.kh.curaeasy.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Review {
	private String reviewTitle;
	private String reviewStatus;
	private int reviewNo;
	private String reviewImage;
	private Date reviewEnrollDate;
	private int reviewCount;
	private String reviewContent;
	private String memberNo;
}
