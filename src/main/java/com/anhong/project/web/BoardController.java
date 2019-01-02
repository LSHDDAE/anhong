package com.anhong.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.anhong.project.service.BoardService;
import com.anhong.project.vo.Board;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String write() {
		return "board/write";
	}

	@RequestMapping(value = "/boardInsert")
	public String insert(@ModelAttribute Board board, HttpSession session) throws Exception {
		boardService.loginInsert(board);
		return "redirect:boardList";
	}

	@RequestMapping(value = "/boardUpdate")
	public String update(@ModelAttribute Board board) throws Exception {

		boardService.update(board);
		return "redirect:boardList";
	}

	@RequestMapping(value = "/boardDelete")
	public String delete(@RequestParam int bno) throws Exception {

		boardService.delete(bno);
		return "redirect:boardList";
	}

	@RequestMapping(value = "/boardUpdateView")
	public ModelAndView updateView(@RequestParam int bno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("updateView", boardService.read(bno));
		mav.setViewName("board/updateView");
		return mav;
	}

	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public ModelAndView read(@RequestParam int bno) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.addObject("boardView", boardService.read(bno));
		mav.setViewName("board/view");
		return mav;
	}

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage) throws Exception {
		// 전체리스트 개수
		int count = boardService.boardCount();

		List<Board> list = boardService.listAll();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count); // 리스트 개수

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("board/list");

		return mav;
	}

}
