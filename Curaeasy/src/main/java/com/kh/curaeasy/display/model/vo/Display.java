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
public class Display {
	private String displayNo;
	private String displayName;
	private String displayContent;
	private String displayStartDate;
	private String displayEndDate;
	private int displayPrice;
	private String displayStatus;
	private String artistNo;
	private String galleryNo;
	
}
