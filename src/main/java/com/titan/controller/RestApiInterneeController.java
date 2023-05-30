package com.titan.controller;

import com.titan.model.Internee;
import com.titan.repository.InterneeRepository;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/internee")
public class RestApiInterneeController {
    private final InterneeRepository interneeRepository;

    public RestApiInterneeController(InterneeRepository interneeRepository, ApplicationContext context) {
        this.interneeRepository = interneeRepository;
        this.context = context;
    }

    @GetMapping
    Iterable<Internee> getInternee() {
        return interneeRepository.findAll();
    }

    @GetMapping("/{id}")
    Optional<Internee> getInterneeById(@PathVariable Integer id) {
        return interneeRepository.findById(id);
    }

    @PostMapping
    Internee postInternee(@RequestBody Internee internee) {
        return interneeRepository.save(internee);
    }

    @PutMapping("/{id}")
    ResponseEntity<Internee> putInternee(@PathVariable Integer id,
                                         @RequestBody Internee internee) {

        return (interneeRepository.existsById(id))
                ? new ResponseEntity<>(interneeRepository.save(internee), HttpStatus.OK)
                : new ResponseEntity<>(interneeRepository.save(internee), HttpStatus.CREATED);
    }

    @DeleteMapping("/{id}")
    void deleteInternee(@PathVariable Integer id) {
        interneeRepository.deleteById(id);
    }

    private final ApplicationContext context;
}
