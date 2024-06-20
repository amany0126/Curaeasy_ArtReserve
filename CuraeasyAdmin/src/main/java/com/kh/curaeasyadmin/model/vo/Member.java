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
public class Member {
    private int memberNo;
    private String memberId;       
    private String memberPwd;        
    private String memberName;  
    private String memberPhone; 
    private String memberEmail; 
    private String memberAddress; 
    private Date memberBirthday;    
    private Date memberEnrollDate;   
    private String artistOngoing;   
    private String memberStatus;   
}