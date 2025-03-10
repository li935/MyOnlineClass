package net.developia.online.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.services.InstructorService;
import net.developia.online.services.LectureService;
import net.developia.online.services.MemberService;
import net.developia.online.util.DateFormatClass;

@Slf4j
@Controller
@RequestMapping("/memberlecture")
public class MemberLectureController {
	@Autowired
	private LectureService lectureService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private InstructorService instructorService;
	private static Logger logger = LoggerFactory.getLogger(LectureDetailController.class);

	// 수강신청 컨트롤러!
	// URL 예시 : http://localhost/online/memberlecture/{no}
	@GetMapping("/{no}")
	@Transactional
	public ModelAndView memberLecture(@PathVariable(required = true) long no, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("result");

		HashMap<String, Object> checkmap = new HashMap<String, Object>();
		checkmap.put("ID", session.getAttribute("id"));
		List<LectureDTO> data = memberService.checkMemberLecture(checkmap);

		String url = "/online/vodStreaming?no=" + no;
		try {
			// 수강생인 경우
			for (LectureDTO dto : data) {
				long lecture_id = dto.getId();
				if (lecture_id == no) {
					mav.addObject("url", url);
					return mav;
				}
			}
			LectureDTO lectureDTO = lectureService.getLecture(no);
			InstructorDTO instructorDTO = instructorService.getInstructor(no);
			if (instructorDTO.getMember_id().equals(session.getAttribute("id"))) {
				throw new RuntimeException("나의 강의는 수강할 수 없습니다!");
			}
			session.setAttribute("lecture_duration", lectureDTO.getDuration());
			mav.addObject("lectureDTO", lectureDTO);
			mav.addObject("url", "/online/memberlecture");
			mav.setViewName("memberLecture");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}

	// URL 예시 : http://localhost/online/memberlecture/action/{no}
	@GetMapping("/action/{no}")
	@Transactional
	public ModelAndView memberLectureAction(@PathVariable(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String member_id = (String) session.getAttribute("id");
		System.out.println("action");
		try {
			LectureDTO lectureDTO = lectureService.getLecture(no);
			String now = DateFormatClass.strDateNow();
			String end = DateFormatClass.strDateEnd(lectureDTO.getDuration());
			map.put("lecture_id", no);
			map.put("member_id", member_id);
			map.put("start_date", now);
			map.put("end_date", end);
			lectureService.MemberLectureRegister(map);
			mav.addObject("msg", "수강신청이 완료되었습니다.");
			mav.addObject("url", "/online/mylecture");
			mav.addObject("type", "success");
			mav.addObject("title", "성공");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;
		}

	}

	// URL 예시 : http://localhost/online/memberlecture/cancle/{no}
	@GetMapping("/cancle/{no}")
	@Transactional
	public ModelAndView memberLectureCancle(@PathVariable(required = true) long no, HttpSession session) {
		ModelAndView mav = new ModelAndView("result");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String member_id = (String) session.getAttribute("id");
		try {
			map.put("lecture_id", no);
			map.put("member_id", member_id);
			lectureService.MemberLectureCancle(map);
			System.out.println(no + "" + member_id);
			mav.addObject("type", "success");
			mav.addObject("title", "성공");
			mav.addObject("msg", "수강중인 과정을 취소했습니다.");
			mav.addObject("url", "/online/classdetail/" + no);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
			mav.addObject("type", "warning");
			mav.addObject("title", "실패");
			return mav;
		}

	}
}
