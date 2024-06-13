package com.kh.curaeasyadmin.notice.model.vo;

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
public class AdminNotice {
	
	private int noticeNo;			// 공지번호
	private Date noticeDate;		// 작성일
	private String noticeTitle;		// 제목
	private String noticeContent;	// 공지내용
	private String noticeAttachment;// 첨부파일
	private String noticeStatus;	// 삭제여부
	
	

}
