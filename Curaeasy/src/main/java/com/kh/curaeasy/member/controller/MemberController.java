package com.kh.curaeasy.member.controller;

import java.sql.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.curaeasy.member.model.service.MemberService;
import com.kh.curaeasy.member.model.vo.Cert;
import com.kh.curaeasy.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	  @Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	  
	  @Autowired private MemberService memberService;
		
	@Autowired
	private JavaMailSender mailSender;
	  @PostMapping(value = "login.me",  produces = "text/html; charset=UTF-8")
		public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
			if(saveId !=null && saveId.equals("y")) {
				Cookie cookie = new Cookie("saveId", m.getMemberId());
				// 유효기간 1일
				cookie.setMaxAge(1 * 24 * 60 * 60);// 초 단위로
				// 만들어진 Cookie 객체를  request 에 담기
				response.addCookie(cookie);
			}else {
				// 로그인 요청 시 아이디를 저장하지 않겠다.
				// 아이디를 저장한 쿠키를 삭제
				// > 삭제 구문이 따로 없으므로 동일한 키값으로 덮어씌우되,
				//	 유효시간을 0 초로 지정하면됨 
				Cookie cookie = new Cookie("saveId", m.getMemberId());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
//			System.out.println(bcryptPasswordEncoder.encode("1q2w3e4r@"));
			// 암호화 기능을 적용한 로그인 로직으로 변경
			// System.out.println(m); 
			// > 로그인 요청 시 사용자가 입력한 아이디, 비번
			// m 의 userId 필드 : 아이디 "평문 " 형식
			// m 의 userPwd 필드 : 비밀번호"평문 " 형식
			// System.out.println(m);
			Member loginUser = memberService.loginMember(m);
			// 기존 loginUser : 아이디와 비번이 모두 일치해야 단일행 조회
			// 새로운 loginUser : 오로지 아이디만을 가지고 일치해야 단일행 조회 
			// System.out.println(loginUser);
			// > 이 때, 아이디값이 일치하면 해당 회원의 정보가 잘 조회된 것 확인
			//	 비밀번호는 DB 에 실제 저장된 형태인 "암호문" 형식임
			//   (loginUser 의 userPwd 필드는 암호화된 비밀번호임)
			// > 반대로, 아이디값이 일치하지 않는다면 null 이 나옴
			
			// 로그인 : 아이디, 비번 모두가 일치해야 통과
			// 이 시점 기준으로 아이디까지만 일치 여부가 검사된것임!!
			// 비밀번호 일치 여부 확인 방법
			// BcryptPasswordEncoder 객체의 matches 메소드
			// [ 표현법 ]
			//bcryptPasswordEncoder.matches(평문,암호문);
			// > 내부적으로 두 구문이 일치하는지 비교 후
			// 	  일치하다면 true 리턴 / 일치하지 않으면 false 리턴
			if(loginUser  != null && bcryptPasswordEncoder
									 .matches(m.getMemberPwd(),loginUser.getMemberPwd())) { // 로그인 성공
				// 조회된 해당 회원의 정보를 sessionScope 에 담고
				// 메인 페이지로 url 재요청
				session.setAttribute("loginUser", loginUser);
				
				// 로그인 성공 시 "일회성 알람 문구" 도 같이 담기
				// (sessionScope 에 담았었음)
				session.setAttribute("alertTitle", "로그인 성공!");
				session.setAttribute("alertMsg", loginUser.getMemberName()+"님 환영합니다.");
				// redirect:/
				mv.setViewName("redirect:/");
			} else { //로그인 실패
				// 에러 문구를 requestScope 에 담아서
				// 에러 페이지로 포워딩
				mv.addObject("errorMsg", "로그인에 실패하셨습니다");
				// /WEB-INF/views/common/errorPage.jsp
				mv.setViewName("/common/errorPage");
				// > ModelAndView 방식 또한
				// View Resolver 가 주소를 자동 완성 해줌!!
			}
			// System.out.println(loginUser);
			return mv;
	  }
	  
	  @GetMapping("enrollForm.me")
	public String enrollForm() {
		// 단순히 회원가입 페이지만 포워딩
		// /WEB-INF/views/member/memberEnrollForm.jsp
		return "member/memberEnrollForm";
	}
	
	@PostMapping(value = "insert.me",  produces = "text/html; charset=UTF-8")
	public String insertMember(Member m,String address1, String address2 ,Model model, HttpSession session) {
		
		String address = address1+'/'+address2;
		m.setMemberAddress(address);
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		m.setMemberPwd(encPwd);
		int result = memberService.insertMember(m);
		
		if (result > 0) { // 성공
			// 일회성 알람문구를 담아 메인 페이지로 url 재요청
			session.setAttribute("alertTitle", "회원가입 성공");
			session.setAttribute("alertMsg", "환영합니다. 회원가입에 성공하셨습니다");
			
			return "redirect:/";
		} else { // 실패
			
			// 에러문구 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원가입에 실패하셨습니다");
			// /WEB-INF/views/common/errorPage.jsp
			return "/common/errorPage";

		}
	}
	
	@ResponseBody
	@GetMapping(value="idCheck.me", produces = "text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return (count>0)? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@PostMapping(value = "cert.do",produces = "text/html; charset=UTF-8")
	public String getCertNo(String email) {
		// System.out.println(email);
		// 6자리의 랜덤 1회성 인증번호 발급
		// (1회성 인증번호 : One Time Password - OTP)
		// > 100000 ~ 999999
		int randem = (int)(Math.random()*900000+100000);
		String certNo = ""+randem+"";
		/*
		java.util.Date certTime = new java.util.Date();
		/* SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); */
		// System.out.println(dateFormat.format(certTime));
		//certTime.setMinutes(certTime.getMinutes()+ 1);
		// System.out.println(dateFormat.format(certTime));
		/*
		 long milliSeconds= certTime.getTime();
	    java.sql.Date sqlDate = new java.sql.Date(milliSeconds);
		*/
		Date date = new java.sql.Date(System.currentTimeMillis()); 

		
		Cert c = new Cert(email, certNo,date);
		int delectEmailcheck = memberService.delectEmailcheck(c);
		
		// System.out.println(date);
		
		int result = memberService.getCertNo(c);
		if(result>0) {
			MimeMessage  mimeMessage  = mailSender.createMimeMessage();
			try {
				MimeMessageHelper messageHelper =new MimeMessageHelper(mimeMessage , true ,"UTF-8");
				messageHelper.setSubject("[크레이지] 이메일 인증번호 입니다"); 
				String str = new EmailController().EmailAuthentication(randem);
				messageHelper.setText(str,true);
				messageHelper.setTo(email);
				mailSender.send(mimeMessage );
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 내용 설정
		
		
			return "인증번호 발급 완료";
		}else {
			return "인증번호 발급 실패";
		}
		
	}
	
	@ResponseBody
	@PostMapping(value = "reCert.do",produces = "text/html; charset=UTF-8")
	public String getCertReNo(String email) {
		// System.out.println(email);
		// 6자리의 랜덤 1회성 인증번호 발급
		// (1회성 인증번호 : One Time Password - OTP)
		// > 100000 ~ 999999
		int randem = (int)(Math.random()*900000+100000);
		String certNo = ""+randem+"";
		
		Date date = new java.sql.Date(System.currentTimeMillis()); 

		
		Cert c = new Cert(email, certNo,date);
		
		int result = memberService.reCert(c);
		if(result>0) {
			MimeMessage  mimeMessage  = mailSender.createMimeMessage();
			try {
				MimeMessageHelper messageHelper =new MimeMessageHelper(mimeMessage , true ,"UTF-8");
				messageHelper.setSubject("[크레이지] 이메일 재 인증번호 입니다"); 
				String str = new EmailController().EmailAuthentication(randem);
				messageHelper.setText(str,true);
				messageHelper.setTo(email);
				mailSender.send(mimeMessage );
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 내용 설정
		
		
			return "인증번호 재발급 완료";
		}else {
			return "인증번호 재발급 실패";
		}
		
	}
	
	@ResponseBody
	@PostMapping(value = "validate.do",produces = "text/html; charset=UTF-8")
	public String validate(String email, String certNo) {
		// System.out.println(email);
		// System.out.println(checkNo);
		Date date = new java.sql.Date(System.currentTimeMillis()); 
		Cert c = new Cert(email, certNo,date);
		String result ="";
		
		int delectResult = memberService.validate(c);
		// System.out.println(delectResult);

		if(delectResult>0) {
			result = "인증성공";
		}else {
			result = "인증실패";
		}
		// 인증이 성공되든 실패되든 간에
		// 아까 발급받았던 인증번호는 무조건 삭제해야함!! (일회성이므로)
		// System.out.println(certNoList);
		return result;
	}
	@GetMapping("logout.me")
	public ModelAndView logoutMember(ModelAndView mv,HttpSession session) {
		// System.out.println("잘 호출되나??");
		
		// session 객체를 만료시키거나
		// session 으로 부터  loginUser 만 지우기
		// > session.invalidate();
		//   무효화 하는 방식은 사용 불가
		
		session.removeAttribute("loginUser");
		
		// 일회성 알람문구를 담아서 메인페이지로 url 재요청
		session.setAttribute("alertTitle", "로그아웃 성공!");
		session.setAttribute("alertMsg", "이용해 주셔서 감사합니다.");
		
		// redirect:/
		mv.setViewName("redirect:/");
		
		return mv;
	}
	@GetMapping("loginPage.me")
	public String loginPage() {
		return "member/login";
		
	}
	@GetMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@PostMapping(value = "update.me",produces = "text/html; charset=UTF-8")
	public String updateMember(Member m, Model model, HttpSession session, String ckPassword) {
		
		int result = memberService.updateMember(m);
		
		if (result > 0) { // 성공
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			
			/*session.setAttribute("alertTitle", "개인정보 변경성공");
			session.setAttribute("alertMsg", "개인정보 변경이 성공적으로 진행되셨습니다.");
			*/
			return "redirect:/myPage.me";
		} else { // 실패
			
			// 에러문구 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "개인정보 변경에 실패하셨습니다");
			// /WEB-INF/views/common/errorPage.jsp
			return "/common/errorPage";

		}
	}
	@PostMapping(value = "delete.me", produces = "text/html; charset=UTF-8")
	public String deldteMember(Member m, Model model, HttpSession session) {
		String encPwd= ((Member)session.getAttribute("loginUser")).getMemberPwd();
				
		if( bcryptPasswordEncoder.matches(m.getMemberPwd(),encPwd)){ // 비밀번호가 맞을경우
			int result = memberService.deleteMember(m.getMemberId());
				
			if (result > 0) { // 탈퇴 처리 성공
				/*
				 * session.setAttribute("alertTitle", "회원탈퇴 성공");
				 * session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
				 */
				session.removeAttribute("loginUser");
				return "redirect:/";
			} else { // 탈퇴 처리 실패
				model.addAttribute("errorMsg", "회원탈퇴에 실패하셨습니다.");
				return "/common/errorPage";
			}
		}else { // 비밀번호가 틀릴경우
			/*
			 * session.setAttribute("alertTitle", "회원탈퇴 실패");
			 * session.setAttribute("alertMsg", "입력하신 비밀번호가 일치하지 않습니다. 재입력 부탁드립니다");
			 */
			return "redirect:/myPage.me";
		}
	}
	@PostMapping(value = "changePwd.me", produces = "text/html; charset=UTF-8")
	public String changePwd(Member m, Model model, HttpSession session,String NewPwd) {
		String encPwd= ((Member)session.getAttribute("loginUser")).getMemberPwd();
				
		if( bcryptPasswordEncoder.matches(m.getMemberPwd(),encPwd)){ // 비밀번호가 맞을경우
			encPwd = bcryptPasswordEncoder.encode(NewPwd);
			m.setMemberPwd(encPwd);
			int result = memberService.changePwd(m);
				
			if (result > 0) { // 탈퇴 처리 성공
				Member updateMem = memberService.loginMember(m);
				session.setAttribute("loginUser", updateMem);
				
				return "redirect:/myPage.me";
			} else { // 탈퇴 처리 실패
				model.addAttribute("errorMsg", "회원정보 변경에 실패하셨습니다.");
				return "/common/errorPage";
			}
		}else { // 비밀번호가 틀릴경우
			/*
			 * session.setAttribute("alertTitle", "회원탈퇴 실패");
			 * session.setAttribute("alertMsg", "입력하신 비밀번호가 일치하지 않습니다. 재입력 부탁드립니다");
			 */
			return "redirect:/myPage.me";
		}
	}
	@GetMapping("IdFind.me")
	public String idFind() {
		return "member/idFind";
	}
	@GetMapping("PwdFind.me")
	public String pwdFind() {
		return "member/pwdFind";
	}
	@PostMapping(value = "findId.me", produces = "text/html; charset=UTF-8")
	public String findId(Member m, Model model, HttpSession session) {
		
		String userId = memberService.findId(m);
		
		if (userId != null) {
			MimeMessage  mimeMessage  = mailSender.createMimeMessage();
			//message.setText("<html><body><h1>아이디 : " +userId+"</h1></body></html>"); // 내용 설정
			try {
				MimeMessageHelper messageHelper =new MimeMessageHelper(mimeMessage , true ,"UTF-8");
				messageHelper.setSubject("[크레이지] 조회하신 아이디 입니다"); // 제목 설정
				String str = new EmailController().IdSearch(userId);
				messageHelper.setText(str,true);
				messageHelper.setTo(m.getMemberEmail());
				mailSender.send(mimeMessage );
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 내용 설정
			
			model.addAttribute("eventMsg", "요청하신 정보를 이메일로 발송하였습니다.");
			return "/common/eventPage";
		}else {
			
			model.addAttribute("errorMsg", "아이디 조회에 실패하셨습니다.");
			return "/common/errorPage";
		}
		
	}
	@PostMapping(value = "findPwd.me", produces = "text/html; charset=UTF-8")
	public String findPwd(Member m, Model model, HttpSession session) {
		
		Random random =new Random();
		String newPwd="";
		for(int i=0 ;i<8;i++) {
			newPwd += ((char)((int)(random.nextInt(26))+65));
		}
		
		System.out.println(newPwd);
		
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		m.setMemberPwd(encPwd);

		int rePwd = memberService.findPwd(m);
		
		if (rePwd > 0) {
			
			MimeMessage  mimeMessage  = mailSender.createMimeMessage();
			// message.setSubject("[크레이지] 조회하신 아이디 입니다"); // 제목 설정
			//message.setText("<html><body><h1>아이디 : " +userId+"</h1></body></html>"); // 내용 설정
			try {
				MimeMessageHelper messageHelper =new MimeMessageHelper(mimeMessage , true ,"UTF-8");
				messageHelper.setSubject("[크레이지] 요청하신 임시비밀번호 입니다");
				String str = new EmailController().reissuancePwd(newPwd);
				messageHelper.setText(str,true);
			
				messageHelper.setTo(m.getMemberEmail());
				mailSender.send(mimeMessage );
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("eventMsg", "요청하신 정보를 이메일로 발송하였습니다.");
			return "/common/eventPage";
		}else {
			
			model.addAttribute("errorMsg", "임시비밀번호 발급에 실패하셨습니다.");
			return "/common/errorPage";
		}
	}
	@ResponseBody
	@PostMapping(value="emailDl.me", produces = "text/html; charset=UTF-8")
	public String checkEmail(String email) {
		int count = memberService.checkEmail(email);
		return (count>0)? "NNNNN" : "NNNNY";
	}
}
	

