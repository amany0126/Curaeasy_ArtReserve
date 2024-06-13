package com.kh.curaeasy.gallery.model.vo;

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
public class Gallery {
	private String galleryNo;
	private String galleryName;
	private String galleryPlace;
	private String galleryInfo;
	private String galleryType;
}
