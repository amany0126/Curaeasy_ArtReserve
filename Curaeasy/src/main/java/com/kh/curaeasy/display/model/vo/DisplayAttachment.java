package com.kh.curaeasy.display.model.vo;

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
public class DisplayAttachment {
	private int AttachmentNo;
	private String originName;
	private String changeName;
	private int imageLevel;
	private String status;
	private String displayNo;
	
}
