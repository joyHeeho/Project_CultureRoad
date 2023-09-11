package com.culture.user.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.user.login.service.UserService;
import com.culture.user.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("userLogin")
@RequestMapping("/user/*")
@Slf4j
public class UserController {
	@Setter(onMethod_ = @Autowired)
	public UserService userService;
	
	@GetMapping("/loginUser")
	public String login() {
		log.info("로그인 페이지 성공");
		return "user/loginUser";
	}

	@ResponseBody
	@PostMapping("/login")
	public String loginForm(UserVO uvo, String model) {
		log.info("정상 or 탈퇴 or 틀렸는지 가려보자고");
		UserVO userLogin = userService.userLogin(uvo);	//로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login 
		log.info("확인" +userLogin);
		
		if(userLogin == null) {//세션에 안담김
			model = "1";
		} else if(userLogin.getUserDelete() == 1) {	//탈퇴회원
			model = "2";
		} else {//정상접근
			model = "3";
		}	
		return model;
	}

	  @PostMapping("/loginProcess") 
	  public String loginProcess(UserVO uvo, Model model,RedirectAttributes ras) { 
		  log.info("이게 진짜 로그인이야 "); 
		  UserVO userLogin = userService.userLogin(uvo); // 로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login
		  log.info("userLogin" + userLogin); 
		  String url;
		  if(userLogin != null) {
			  model.addAttribute("userLogin", userLogin);
			  log.info("로그인 성공");
			  url = "redirect:/";
		  } else {
			  log.info("알 수 없는 오류발생,, 모가 문제지?");
			  url = "/user/login";
		  }
		  return url;
	  }


	@RequestMapping("/logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("user 로그아웃 처리");
	      sessionStatus.setComplete();
	      return "redirect:/";
	   }
	
	@GetMapping("/signUpForm")
	public String signUpForm() {
		log.info("성공");
		return "user/signUpForm";
	}
	
	@ResponseBody
	@PostMapping("/idChk")
	public String idChk(String model, UserVO uvo) {
		log.info("idChk 실행");
		int idChk = userService.idChk(uvo);
		
		if(idChk==0) {
			model = "사용가능";
		} else {
			model = "불가능";
		}
		log.info(model.toString());
		return model;
	}
	
	@PostMapping("/signUp")
	public String signUp(UserVO uvo) {
		log.info("회원가입폼전달완료");
		int result = userService.signUp(uvo);
		
		String url=null;
		
		if(result == 1) {
			url="user/loginUser";
		} else {
			url="user/signUpForm";
		}
		return url;
	}

	@GetMapping("/findIdSelect")
	public String findIdSelect() {
		log.info("성공");
		return "user/findIdSelect";
	}
	
	@GetMapping("/findIdEmailForm")
	public String findIdEmailForm() {
		log.info("성공");
		return "user/findIdEmailForm";
	}
	
	@GetMapping("/findIdPhoneForm")
	public String findIdPhoneForm() {
		log.info("성공");
		return "user/findIdPhoneForm";
	}
	

	@GetMapping("/findPwSelect")
	public String findPwSelect() {
		log.info("성공");
		return "user/findPwSelect";
	}
	
	@GetMapping("/findPwEmailForm")
	public String findPwEmailForm() {
		log.info("성공");
		return "user/findPwEmailForm";
	}
	
	@GetMapping("/findPwPhoneForm")
	public String findPwPhoneForm() {
		log.info("성공");
		return "user/findPwPhoneForm";
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		log.info("마이페이지 진입성공");		
		return "user/myPage";	
	}
	
	
	
	@GetMapping("/main")
	public String main() {
		log.info("메인페이지로 갈거야");
		return "redirect:/";
	}

	@GetMapping("/enterPw")
	public String enterPw() {
		log.info("정보수정을 위한 비밀번호 입력");
		return "user/enterPw";
	}

	@ResponseBody
	@PostMapping("/pwChk")
	public String pwdConfirm(String model, UserVO uvo) {
		log.info("pwChk 실행");
		int pwChk = userService.pwChk(uvo);
		log.info("id = " + uvo.getUserId());
		if(pwChk == 1) {
			model = "같다";
		} else {
			model = "다르다";
		}
		log.info(model.toString());
		return model;
		
	}
	

	@PostMapping("/updateMyPageForm")
	public String updateMyPageForm(UserVO uvo) {
		log.info("마이페이지 수정폼이다");
		log.info("userId = " + uvo.getUserId());

		return "user/updateMyPage";
	}

/* 세션이 바뀌지않지만 실행은 되는,,,
	@PostMapping("updateMyPage") 
	public String updateMyPage(UserVO uvo, String model) { 
		log.info("마이페이지 수정폼을 넘기고 있다." + uvo.getUserId()); 
		int result = userService.updateMyPage(uvo);
		log.info("마이페이지 수정폼을 넘겼다 result : " + result);
		if(result == 1) {
			UserVO userLogin = userService.myPage(uvo);
			log.info("새로운 정보를 가져올 수 있을까 없을까? " + userLogin.toString());
			return "redirect:/user/myPage";
			//model = 1;
		}else {
			model = "2";
		}
		return model; 
	}
*/
	@PostMapping("/updateMyPage") 
	public String updateMyPage(UserVO uvo, Model model, SessionStatus sessionStatus) { 
		log.info("마이페이지 수정폼을 넘기고 있다." + uvo.getUserId()); 
		int result = userService.updateMyPage(uvo);
		log.info("마이페이지 수정폼을 넘겼다 result : " + result);
		String url=null;
		if(result == 1) {
			/*log.info("세션종료한다?");
			sessionStatus.setComplete();
			log.info("세션종료됐다!!");
			log.info("새 세션에 담는다?");
			UserVO newSession = userService.myPage(uvo);
			model.addAttribute("newSession", newSession);
			log.info("새로운 세션을 가져올 수 있을까 없을까? " + newSession.toString());
			url =  "redirect:/user/myPage";
			//url = "client/user/newMyPage";
			//model = 1;*/
			
			UserVO newSession = userService.myPage(uvo);
			
			log.info(newSession.toString());
			model.addAttribute("userLogin", newSession);
			url =  "redirect:/user/myPage";
		}
		return url;
	}

/*	새로운 세션에 담을 수 이씅ㄹ까없을까,, 여기 가지도 못해ㅠㅠㅠ
	@GetMapping("newSession")
	public String newSession(UserVO uvo, Model model) {
		log.info("수정된 마이페이지 진입성공");	
		UserVO newSession = userService.userLogin(uvo);	//로그인 정보 세션에 담기, 로그인 메서드 + 쿼리 id = login 
		log.info("확인" +newSession);
		String url = null;
		if(newSession != null) {
			model.addAttribute("newSession", newSession);
			url = "redirect:/mypage";
		}
		return url;
	}

	*/
	
	@GetMapping("/enterPw2")
	public String enterPw2() {
		log.info("정보수정을 위한 비밀번호 입력");
		return "user/enterPw2";
	}
	
	@PostMapping("/deleteAccount")
	public String deleteAccount(UserVO uvo, SessionStatus sessionStatus) {
		log.info("탈퇴쿼리문직전");
		int result = userService.deleteAccount(uvo);
		log.info("result : " + result);
		//log.info(uvo.getUserDelete());
		String url = null;
		if(result==1) {
			log.info("user 탈퇴성공");
			sessionStatus.setComplete();
		    url = "redirect:/";
		} else {
			log.info("user 탈퇴 실패");
			url = "user/enterPw2";
		}
		return url;
	}
	
	
	
	@GetMapping("myOrderList")
	public String myOrderList(UserVO uvo) {
		log.info("나의 예매내역 진입");
		return "user/myOrderList";
	}
}
