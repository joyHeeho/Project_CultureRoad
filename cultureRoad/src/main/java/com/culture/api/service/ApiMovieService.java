package com.culture.api.service;

import java.util.List;

import com.culture.api.vo.ApiMovieVO;

public interface ApiMovieService {
	List<ApiMovieVO> getNowPlayingMovies();
	ApiMovieVO getMovieDetail(String id);
	List<ApiMovieVO> searchMovie(String searchTitle);
	List<ApiMovieVO> getPopularMovies();
	List<ApiMovieVO> getUpcomingMovies();
}
