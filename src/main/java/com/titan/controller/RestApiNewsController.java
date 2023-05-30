package com.titan.controller;

import com.titan.model.News;
import com.titan.repository.NewsRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/news")
public class RestApiNewsController {
	private final NewsRepository newsRepository;

	public RestApiNewsController(NewsRepository newsRepository, ApplicationContext context) {
		this.newsRepository = newsRepository;
		this.context = context;
	}

	@GetMapping
	Iterable<News> getNews() {
		return newsRepository.findAll();
	}

	@GetMapping("/{id}")
	Optional<News> getNewsById(@PathVariable Integer id) {
		return newsRepository.findById(id);
	}

	@PostMapping
	News postNews(@RequestBody News news) {
		return newsRepository.save(news);
	}

	@PutMapping("/{id}")
	ResponseEntity<News> putNews(@PathVariable Integer id,
									 @RequestBody News coffee) {

		return (newsRepository.existsById(id))
				? new ResponseEntity<>(newsRepository.save(coffee), HttpStatus.OK)
				: new ResponseEntity<>(newsRepository.save(coffee), HttpStatus.CREATED);
	}

	@DeleteMapping("/{id}")
	void deleteNews(@PathVariable Integer id) {
		newsRepository.deleteById(id);
	}

	private final ApplicationContext context;
	@GetMapping("/shutdown")
	public void shutdownApp() {

		int exitCode = SpringApplication.exit(context, () -> 0);
		System.exit(exitCode);
	}
}