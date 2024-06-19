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
public class Reply {
    private int replyNo;
    private String replyContent;
    private Date replyEnrollDate;
    private String replyStatus;
    private int reviewNo;
    private int memberNo;
}
