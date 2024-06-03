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
public class Cert {
    private String email;            // 인증할 이메일
    private String certNo;           // 인증번호
    private Date certTime;           // 인증 신청 시각
}