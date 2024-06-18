package com.kh.curaeasyadmin.model.vo;

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
public class Notice {
	
	private int noticeNo;
	private String noticeDate;
	private String noticeTitle;
	private String noticeContent;
	private String noticeAttachment;
	private String noticeStatus;
}
