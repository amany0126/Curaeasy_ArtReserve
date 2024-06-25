package com.kh.curaeasyadmin.model.vo;

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
public class Artist {
	private String artistNo;
	private String artistNickName;
	private String artistOrdinal;
	private Date  artistApplyDate;
	private String  artistApplyTitle;
	private String  artistIntroduce;
	private String  artistImage;
	private String  artistResult;
	private String  artistStatus;
	private int memberNo;
}
