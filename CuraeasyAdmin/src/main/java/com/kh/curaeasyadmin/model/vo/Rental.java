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
public class Rental {
	
    private int rentalNo;
    private Date rentalApplyDate;
    private Date rentalStartDate;
    private Date rentalEndDate;
    private String rentalContent;
    private String rentalResult;
    private String rentalStatus;
    private int artistNo;
    private int galleryNo;
    private String galleryName;    // 추가
    private String artistNickName; // 추가
}
