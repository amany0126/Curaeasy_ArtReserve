package com.kh.curaeasy.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {

    @RequestMapping("intro.do")
    public String intro() {
        return "intro/intro";
    }

    @RequestMapping("location.do")
    public String location() {
        return "intro/location";
    }

    @RequestMapping("about.do")
    public String about() {
        return "intro/about";
    }

    @RequestMapping("gallery.do")
    public String gallery() {
        return "intro/gallery";
    }

    @RequestMapping("organization.do")
    public String organization() {
        return "intro/organization";
    }
}