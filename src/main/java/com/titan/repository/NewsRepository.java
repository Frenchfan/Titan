package com.titan.repository;

import com.titan.model.News;
import org.springframework.data.repository.CrudRepository;

public interface NewsRepository extends CrudRepository<News, Integer> {}
