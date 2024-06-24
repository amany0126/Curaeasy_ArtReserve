package com.kh.curaeasy.member.model.vo;

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
    private int memberNo;            // 회원번호
    private String memberId;         // 회원아이디
    private String memberPwd;        // 회원비밀번호
    private String memberName;       // 회원이름
    private String memberPhone;      // 전화번호
    private String memberEmail;      // 이메일
    private String memberAddress;    // 회원주소
    private Date memberBirthday;     // 생일
    private Date memberEnrollDate;   // 회원가입일
    private String artistOngoing;      // 현재 작가여부
    private String memberStatus;       // 회원상태
}