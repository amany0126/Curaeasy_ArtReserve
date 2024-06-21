package com.kh.curaeasy.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reply {
	private int replyNo;
	private String replyContent;
	private String replyEnrollDate;
	private String replyStatus;
	private String reviewNo;
	private String memberNo;
}
	