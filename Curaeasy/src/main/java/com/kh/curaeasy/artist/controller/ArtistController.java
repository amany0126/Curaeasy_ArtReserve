package com.kh.curaeasy.artist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArtistController {

    @RequestMapping("introduce.do")
    public String artistIntroduction() {
        return "artist/artistIntroduceView";
    }
}




