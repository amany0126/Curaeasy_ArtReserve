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
public class Review {
    private int reviewNo;
    private String reviewTitle;
    private String reviewContent;
    private Date reviewEnrollDate;
    private int reviewCount;
    private String reviewImage;
    private String reviewStatus;
    private int memberNo;
}
