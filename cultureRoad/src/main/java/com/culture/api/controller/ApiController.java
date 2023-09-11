package com.culture.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.api.service.ApiMovieService;
import com.culture.api.vo.ApiMovieVO;
import com.culture.user.login.service.UserService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ApiController {
	
	@Setter(onMethod_ = @Autowired)
	private ApiMovieService apiMovieService;
	
	
	@GetMapping("/")
	public String nowPlayingMovie(Model model) {
		List<ApiMovieVO> movies = apiMovieService.getNowPlayingMovies();
		List<ApiMovieVO> popular = apiMovieService.getPopularMovies();
		List<ApiMovieVO> upcoming = apiMovieService.getUpcomingMovies();
		model.addAttribute("movies",movies);
		model.addAttribute("popular",popular);
		model.addAttribute("upcoming",upcoming);
		return "index";
	}
	
	@PostMapping("/movieDetail/{id}")
	public String getDetail(@PathVariable String id, Model model) {
		ApiMovieVO movie = apiMovieService.getMovieDetail(id);
		String overview = movie.getOverview();
		if(overview=="") {
			overview = "준비중 입니다.";
		}
		movie.setOverview(overview);
		model.addAttribute("movie",movie);
	
		return "client/movie/movieDetail";
	}
	
	@PostMapping("/movieSearch")
	public String getMovieSearch(@RequestParam String title, Model model) {
		log.info("title ", title);
		
		List<ApiMovieVO> searchMovie = apiMovieService.searchMovie(title);
		model.addAttribute("movies",searchMovie);
		return "client/movie/movieSearch";
	}
}
