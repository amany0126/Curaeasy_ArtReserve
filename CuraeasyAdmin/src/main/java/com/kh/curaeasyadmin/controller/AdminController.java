package com.kh.curaeasyadmin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.common.template.Pagination;
import com.kh.curaeasyadmin.model.service.AdminService;
import com.kh.curaeasyadmin.model.vo.Artist;
import com.kh.curaeasyadmin.model.vo.Display;
import com.kh.curaeasyadmin.model.vo.DisplayAttachment;
import com.kh.curaeasyadmin.model.vo.Gallery;
import com.kh.curaeasyadmin.model.vo.Member;
import com.kh.curaeasyadmin.model.vo.Notice;
import com.kh.curaeasyadmin.model.vo.Rental;
import com.kh.curaeasyadmin.model.vo.Reply;
import com.kh.curaeasyadmin.model.vo.Reserve;
import com.kh.curaeasyadmin.model.vo.Review;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admin.ad")
    public String index(Model model) {
    	
    	int memberCount = adminService.getMemberCount();
    	int sales = adminService.getCurrentYearSales();
    	int exhibitionCount = adminService.getExhibitionCount();
    	int artistsAwaitingApproval = adminService.getArtistsAwaitingApproval();
    	
    	List<Map<String, Object>> monthlyReservations = adminService.getMonthlyReservationCounts();
    	List<Map<String, Object>> top5display = adminService.getTop5Displays();
    	
    	
    	model.addAttribute("memberCount",memberCount);
        model.addAttribute("sales",sales);
        model.addAttribute("exhibitionCount", exhibitionCount);
        model.addAttribute("artistsAwaitingApproval",artistsAwaitingApproval );
        
        model.addAttribute("monthlyReservations",monthlyReservations );
        model.addAttribute("top5display",top5display );
        
        System.out.println(monthlyReservations);
        System.out.println(top5display);
        
        return "adminmain";
    }

    // 전시회 관리
    @RequestMapping("displayList.ad")
    public String displayList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
                              @RequestParam(value="searchKeyword", defaultValue="") String searchKeyword,
                              Model model) {
        int listCount = adminService.getDisplayListCount(searchKeyword);

        int pageLimit = 10;
        int boardLimit = 10;

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Display> displayList = adminService.selectDisplayList(pi, searchKeyword);

        model.addAttribute("displayList", displayList);
        model.addAttribute("pi", pi);
        model.addAttribute("searchKeyword", searchKeyword);

        return "display/adminDisplayListView";
    }

    @RequestMapping("displayDetail.ad")
    public String displayDetail(@RequestParam("displayNo") int displayNo, Model model) {
        Display display = adminService.selectDisplay(displayNo);
        model.addAttribute("display", display);
        return "display/adminDisplayDetailView";
    }

    @GetMapping("/updateDisplay.ad")
    public String showUpdateDisplayForm(@RequestParam("displayNo") int displayNo, Model model) {
        Display display = adminService.selectDisplay(displayNo);
        DisplayAttachment attachment1 = adminService.selectAttachment1(displayNo);
        DisplayAttachment attachment2 = adminService.selectAttachment2(displayNo);
        
        
        
        model.addAttribute("display", display);
        model.addAttribute("attachment1", attachment1);
        model.addAttribute("attachment2", attachment2);
//        System.out.println(display);
        return "display/adminDisplayUpdateForm";
    }

    @PostMapping("/displayUpdate.ad")
    public String displayUpdate(@ModelAttribute Display display,  MultipartFile attachment1,  MultipartFile attachment2, HttpSession session) {
       
    	
    	// System.out.println(attachment1);
    	// System.out.println(attachment2);
    	// System.out.println(display);
    	
    	String displayNo = display.getDisplayNo();
    	
    	// 원본 파일 정보    	
    	DisplayAttachment originalAttachment1 = adminService.selectAttachment1(Integer.parseInt(displayNo));
        DisplayAttachment originalAttachment2 = adminService.selectAttachment2(Integer.parseInt(displayNo));
    	
        // 원본 파일 체인지 명
        String originalfileNameAttachment1 = originalAttachment1.getChangeName();
        String originalfileNameAttachment2 = originalAttachment2.getChangeName();
        
        DisplayAttachment reAttachment1 = new DisplayAttachment();
        DisplayAttachment reAttachment2 = new DisplayAttachment();
    	
        // 섬네일
        if(attachment1.getSize() == 0) {
			// 파일번호, 바뀐이름, 파일레벨
        	reAttachment1.setChangeName(originalAttachment1.getChangeName());
        	reAttachment1.setAttachmentNo(originalAttachment1.getAttachmentNo());
        	reAttachment1.setImageLevel(originalAttachment1.getImageLevel());
        	reAttachment1.setDisplayNo(displayNo);
		}else {
			String changImgName = saveFileDisplay(attachment1, session);	
			reAttachment1.setChangeName(changImgName);
			
			String realPath= "C:\\Curaeasy_ArtReserve\\Curaeasy\\src\\main\\webapp\\resources\\display\\"+originalfileNameAttachment1;
			new File(realPath).delete();
			
			reAttachment1.setAttachmentNo(originalAttachment1.getAttachmentNo());
        	reAttachment1.setImageLevel(originalAttachment1.getImageLevel());
        	reAttachment1.setDisplayNo(displayNo);
		}
        
        // 상세이미지
        if(attachment2.getSize() == 0) {
			// 파일번호, 바뀐이름, 파일레벨
        	reAttachment2.setChangeName(originalAttachment2.getChangeName());
        	reAttachment2.setAttachmentNo(originalAttachment2.getAttachmentNo());
        	reAttachment2.setImageLevel(originalAttachment2.getImageLevel());
        	reAttachment2.setDisplayNo(displayNo);
		}else {
			String changImgName = saveFileDisplay(attachment2, session);	
			reAttachment2.setChangeName(changImgName);
			
			String realPath= "C:\\Curaeasy_ArtReserve\\Curaeasy\\src\\main\\webapp\\resources\\display\\"+originalfileNameAttachment2;
			new File(realPath).delete();
			
			reAttachment2.setAttachmentNo(originalAttachment2.getAttachmentNo());
			reAttachment2.setImageLevel(originalAttachment2.getImageLevel());
			reAttachment2.setDisplayNo(displayNo);
		}
        
        int result = adminService.displayUpdate(display,reAttachment1, reAttachment2);
        
		
		if (result > 0) { // 성공
			// 일회성 알람문구를 담아 메인 페이지로 url 재요청
			// 첨부파일 업데이트
			session.setAttribute("alertMsg", "정보 변경에 성공 하였습니다.");
		} else { // 실패
			
			// 에러문구 담아서 에러페이지로 포워딩
		session.setAttribute("alertMsg", "정보 변경에 실패하셨습니다");
			// /WEB-INF/views/common/errorPage.jsp
		}
	
        return "redirect:/displayList.ad";
    }
    private String savePath(MultipartFile reUpfile, HttpSession session) {
		return null;
	}

	@RequestMapping("/deleteDisplay.ad")
    public String deleteDisplay(@RequestParam("displayNo") int displayNo, RedirectAttributes redirectAttributes) {
        Display display = adminService.getDisplayById(displayNo);
        if ("종료".equals(display.getDisplayStatus())) {
            redirectAttributes.addFlashAttribute("errorMessage", "이미 삭제처리된 전시회입니다.");
        } else {
            adminService.updateDisplayStatusToEnd(displayNo);
        }
        return "redirect:/displayList.ad";
    }

    @GetMapping("/addDisplay.ad")
    public String showAddDisplayForm() {
        return "display/adminDisplayEnrollForm";
    }

    @PostMapping("/addDisplay.ad")
    public String addDisplay(Display display, @RequestParam("attachments") MultipartFile[] attachments, HttpSession session) {
        ArrayList<DisplayAttachment> attachmentList = new ArrayList<>();
        for (MultipartFile file : attachments) {
            if (!file.isEmpty()) {
                String changeName = saveFileDisplay(file, session);
                DisplayAttachment attachment = new DisplayAttachment();
                attachment.setOriginName(file.getOriginalFilename());
                attachment.setChangeName(changeName);
                attachment.setImageLevel(file.equals(attachments[0]) ? 1 : 2);
                attachment.setStatus("Y");
                attachmentList.add(attachment);
            }
        }
        adminService.addDisplay(display, attachmentList);
        return "redirect:/displayList.ad";
    }

    private String saveFileDisplay(MultipartFile file, HttpSession session) {
        String originName = file.getOriginalFilename();
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int ranNum = (int) (Math.random() * 90000 + 10000);
        String ext = originName.substring(originName.lastIndexOf("."));
        String changeName = currentTime + ranNum + ext;
        String savePath = "C:\\Curaeasy_ArtReserve\\Curaeasy\\src\\main\\webapp\\resources\\display\\";
        System.out.println(savePath);
        try {
            file.transferTo(new File(savePath + changeName));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changeName;
    }

    // 전시관 관리
    @RequestMapping("galleryList.ad")
    public String galleryList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
                              @RequestParam(value="searchKeyword", defaultValue="") String searchKeyword, 
                              Model model) {
        int listCount = adminService.getGalleryListCount(searchKeyword); // 전시관 리스트 총 개수

        int pageLimit = 10; // 페이지 하단에 보여질 페이지 최대 개수
        int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 개수

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Gallery> galleryList = adminService.selectGalleryList(pi, searchKeyword);

        model.addAttribute("galleryList", galleryList);
        model.addAttribute("pi", pi);

        return "gallery/adminGalleryListView";
    }

    @RequestMapping("galleryDetail.ad")
    public String galleryDetail(@RequestParam("galleryNo") int galleryNo, Model model) {
        Gallery gallery = adminService.selectGallery(galleryNo);
        model.addAttribute("gallery", gallery);

        return "gallery/adminGalleryDetailView";
    }

    @GetMapping("/updateGallery.ad")
    public String showUpdateGalleryForm(@RequestParam("galleryNo") int galleryNo, Model model) {
        Gallery gallery = adminService.selectGallery(galleryNo);
        model.addAttribute("gallery", gallery);
        return "gallery/adminGalleryUpdateForm";
    }

    @PostMapping("/updateGallery.ad")
    public String updateGallery(Gallery gallery) {
        adminService.updateGallery(gallery);
        return "redirect:/galleryList.ad";
    }

    @RequestMapping("/deleteGallery.ad")
    public String deleteGallery(@RequestParam("galleryNo") int galleryNo) {
        adminService.deleteGallery(galleryNo);
        return "redirect:/galleryList.ad";
    }

    @GetMapping("/addGallery.ad")
    public String showAddGalleryForm() {
        return "gallery/adminGalleryEnrollForm";
    }

    @PostMapping("/addGallery.ad")
    public String addGallery(Gallery gallery) {
        adminService.addGallery(gallery);
        return "redirect:/galleryList.ad";
    }

    // 대관신청 관리
    @RequestMapping("rentalList.ad")
    public String rentalList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
                             @RequestParam(value="searchCategory", required=false) String searchCategory,
                             @RequestParam(value="searchKeyword", required=false) String searchKeyword,
                             Model model) {
        int listCount = adminService.getRentalListCount(searchCategory, searchKeyword);
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Rental> rentalList = adminService.selectRentalList(pi, searchCategory, searchKeyword);

        model.addAttribute("rentalList", rentalList);
        model.addAttribute("pi", pi);
        model.addAttribute("searchCategory", searchCategory);
        model.addAttribute("searchKeyword", searchKeyword);

        return "rental/adminRentalListView";
    }
    
    @GetMapping("/updateRental.ad")
    public String updateRental(@RequestParam("rentalNo") int rentalNo, Model model) {
        Rental rental = adminService.getRentalByNo(rentalNo);
        model.addAttribute("rental", rental);
        System.out.println(rental);
        return "rental/adminRentalUpdateForm";
    }

    @PostMapping("/updateRental.ad")
    public String updateRental(Rental rental) {
        adminService.updateRental(rental);
        return "redirect:/rentalList.ad";
    }

    @RequestMapping("/updateRentalStatus.ad")
    public String updateRentalStatus(@RequestParam("rentalNo") int rentalNo, RedirectAttributes redirectAttributes) {
        Rental rental = adminService.getRentalByNo(rentalNo);
        if ("N".equals(rental.getRentalStatus())) {
            redirectAttributes.addFlashAttribute("errorMessage", "이미 취소된 대관입니다.");
        } else {
            adminService.updateRentalStatus(rentalNo);
        }
        return "redirect:/rentalList.ad";
    }

    // 예매 관리
    @RequestMapping("reserveList.ad")
    public String reserveList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
                              @RequestParam(value="searchCategory", required=false) String searchCategory,
                              @RequestParam(value="searchValue", required=false) String searchValue,
                              Model model) {
        HashMap<String, String> map = new HashMap<>();
        map.put("searchCategory", searchCategory);
        map.put("searchValue", searchValue);

        int listCount = adminService.getReserveListCount(map); // 예매 리스트 총 개수

        int pageLimit = 10; // 페이지 하단에 보여질 페이지 최대 개수
        int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 개수

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Reserve> reserveList = adminService.selectReserveList(pi, map);

        model.addAttribute("reserveList", reserveList);
        model.addAttribute("pi", pi);
        return "reserve/adminReserveListView";
    }

    // 공지사항 관리
    @RequestMapping("noticeList.ad")
    public String noticeList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getNoticeListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Notice> noticeList = adminService.selectNoticeList(pi);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pi", pi);
        return "notice/adminNoticeListView";
    }

    // 후기 관리
    @RequestMapping("reviewList.ad")
    public String reviewList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getReviewListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Review> reviewList = adminService.selectReviewList(pi);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("pi", pi);
        return "review/adminReviewListView";
    }
    
    // 멤버 관리

    @RequestMapping("memberList.ad")
    public String memberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getMemberListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Member> memberList = adminService.selectMemberList(pi);

        model.addAttribute("memberList", memberList);
        model.addAttribute("pi", pi);

        return "member/adminMemberListView";
    }

    @GetMapping("/updateMember.ad")
    public String showUpdateMemberForm(@RequestParam("memberNo") int memberNo, Model model) {
        Member member = adminService.getMemberById(memberNo);
        model.addAttribute("member", member);
        return "member/adminMemberUpdateForm";
    }

    @PostMapping("/updateMember.ad")
    public String updateMember(Member member) {
        adminService.updateMember(member);
        return "redirect:/memberList.ad";
    }

    @RequestMapping("/updateMemberStatus.ad")
    public String updateMemberStatus(@RequestParam("memberNo") int memberNo) {
        adminService.updateMemberStatus(memberNo);
        return "redirect:/memberList.ad";
    }
    
    

    // 작가 관리
    @RequestMapping("artistList.ad")
    public String artistList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getArtistListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Artist> artistList = adminService.selectArtistList(pi);
        model.addAttribute("artistList", artistList);
        model.addAttribute("pi", pi);
        return "artist/adminArtistListView";
    }
    
    @RequestMapping("/approveArtist.ad")
    public String approveArtist(@RequestParam("artistNo") int artistNo, @RequestParam("status") String status, RedirectAttributes redirectAttributes) {
        if ("approve".equals(status)) {
            adminService.approveArtist(artistNo);
        } else if ("reject".equals(status)) {
            adminService.rejectArtist(artistNo);
        }
        redirectAttributes.addFlashAttribute("message", "작가 승인이 완료되었습니다.");
        return "redirect:/artistList.ad";
    }
    
    @PostMapping("/updateArtist.ad")
    public String updateArtist(@ModelAttribute Artist artist, @RequestParam("artistImage") MultipartFile file, HttpServletRequest request) {
        if (!file.isEmpty()) {
            String renameFileName = saveFile(file, request);
            if (renameFileName != null) {
                artist.setArtistImage(renameFileName);
            }
        }
        adminService.updateArtist(artist);
        return "redirect:/artistList.ad";
    }

    private String saveFile(MultipartFile file, HttpServletRequest request) {
        String root = request.getSession().getServletContext().getRealPath("resources");
        String savePath = root + "/artist_images";
        File folder = new File(savePath);

        if (!folder.exists()) {
            folder.mkdirs();
        }

        String originalFileName = file.getOriginalFilename();
        String renameFileName = UUID.randomUUID().toString() + "_" + originalFileName;

        String renamePath = folder + "/" + renameFileName;

        try {
            file.transferTo(new File(renamePath));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        return renameFileName;
    }

    // 댓글 관리
    @RequestMapping("replyList.ad")
    public String replyList(Model model) {
        ArrayList<Reply> replyList = adminService.selectReplyList();
        model.addAttribute("replyList", replyList);
        return "reply/adminReplyListView";
    }
    @GetMapping("addNotice.ad")
    public String addNotice() {
   
    	return "notice/adminNoticeEnrollForm";
    }
    
    @GetMapping("updateNotice.ad")
    public String updateNotice(Model model, int noticeNo) {
    	Notice noticeList = adminService.selectNoticeDetail(noticeNo);
    	
    	model.addAttribute("noticeList", noticeList);
    	return "notice/adminNoticeUpdateForm";
    }
    
    
    
    
    @PostMapping(value = "insertNotice.ad")
    public String insertNotice( @RequestParam MultipartFile reUpfile,Notice notice, Model model, HttpSession session) {
    	
    	
    
    	
    	notice.setNoticeContent(notice.getNoticeContent().replace("\\r\\n", "<br>"));
    	
    	String changImgName = saveFileNotice(reUpfile, session);	
    	notice.setNoticeAttachment (changImgName);
    	

    	int result = adminService.insertNotice(notice);
    	
    	if (result > 0) { // 성공
    		// 일회성 알람문구를 담아 메인 페이지로 url 재요청
    		// 첨부파일 업데이트
    		session.setAttribute("alertMsg", "게시글 작성에 성공 하였습니다.");
    	} else { // 실패
    		
    		// 에러문구 담아서 에러페이지로 포워딩
    		session.setAttribute("alertMsg", "게시글 작성에 실패하셨습니다");
    		// /WEB-INF/views/common/errorPage.jsp
    	}
    	
    	return "redirect:/noticeList.ad";
    	
    }
    
    @PostMapping(value = "noticeUpdate.ad")
    public String noticeUpdate( @RequestParam MultipartFile reUpfile,Notice notice, Model model, HttpSession session) {
    	
    	
    	// int noticeNo = notice.getNoticeNo();
    	
    	notice.setNoticeContent(notice.getNoticeContent().replace("\\r\\n", "<br>"));
    	
    	// 원본 파일 정보    	
    	// Notice noticeList = adminService.selectNoticeDetail(noticeNo);
    	
        // 원본 파일 체인지 명
        String originalfileNameNotice = notice.getNoticeAttachment();
        
        // 섬네일
        if(reUpfile.getSize() == 0) {
			// 파일번호, 바뀐이름, 파일레벨
	        notice.setNoticeAttachment(originalfileNameNotice);
		}else {
			String changImgName = saveFileNotice(reUpfile, session);	
			notice.setNoticeAttachment (changImgName);
			
			String realPath= "C:\\Curaeasy_ArtReserve\\Curaeasy\\src\\main\\webapp\\resources\\notice\\"+originalfileNameNotice;
			new File(realPath).delete();
			
		}
        System.out.println(notice);
        int result = adminService.noticeUpdate(notice);
		
		if (result > 0) { // 성공
			// 일회성 알람문구를 담아 메인 페이지로 url 재요청
			// 첨부파일 업데이트
			session.setAttribute("alertMsg", "정보 변경에 성공 하였습니다.");
		} else { // 실패
			
			// 에러문구 담아서 에러페이지로 포워딩
		session.setAttribute("alertMsg", "정보 변경에 실패하셨습니다");
			// /WEB-INF/views/common/errorPage.jsp
		}

        return "redirect:/noticeList.ad";
    	
    }
    
    private String saveFileNotice(MultipartFile file, HttpSession session) {
        String originName = file.getOriginalFilename();
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int ranNum = (int) (Math.random() * 90000 + 10000);
        String ext = originName.substring(originName.lastIndexOf("."));
        String changeName = currentTime + ranNum + ext;
        String savePath = "C:\\Curaeasy_ArtReserve\\Curaeasy\\src\\main\\webapp\\resources\\notice\\";
        try {
            file.transferTo(new File(savePath + changeName));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changeName;
    }

}
