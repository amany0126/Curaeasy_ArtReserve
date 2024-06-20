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
public class Reserve {
    private int reserveNo;
    private int reserveCount;
    private String paymentCode;
    private Date paymentDate;
    private Date entranceDate;
    private int paymentPrice;
    private String reserveStatus;
    private int memberNo;
    private int displayNo;
}
