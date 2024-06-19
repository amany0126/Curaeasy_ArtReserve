package com.kh.curaeasy.reserve.model.vo;

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
public class Reserve {
	private int reserveNo;
	private int reserveCount;
	private String paymentCode;
	private String paymentDate;
	private String entranceDate;
	private int paymentPrice;
	private String reserveStatus;
	private String memberNo;
	private String displayNo;
}