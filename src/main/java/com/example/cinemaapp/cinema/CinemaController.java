package com.example.cinemaapp.cinema;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cinemas")
@RequiredArgsConstructor
public class CinemaController {
    @Autowired
    private CinemaService cinemaService;

    @GetMapping()
    public ResponseEntity<CinemaResponse> getCinemas() {
        List<Cinema> cinemas = cinemaService.getAllCinemas();
        return ResponseEntity.ok(new CinemaResponse(cinemas));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cinema> getCinemaById(@PathVariable Integer id) {
        Optional<Cinema> cinema = cinemaService.getCinemaById(id);
        return cinema.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addCinema(@RequestBody CinemaRequest cinemaRequest) {
        Integer id = cinemaService.addCinema(cinemaRequest.getCinema());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cinema> updateCinema(@PathVariable Integer id, @RequestBody CinemaRequest cinemaRequest) {
        try {
            Cinema updatedCinema = cinemaService.updateCinema(id, cinemaRequest.getCinema());
            return ResponseEntity.ok(updatedCinema);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<Cinema> partiallyUpdateCinema(@PathVariable Integer id, @RequestBody CinemaRequest cinemaRequest) {
        try {
            Cinema updatedCinema = cinemaService.partiallyUpdateCinema(id, cinemaRequest.getCinema());
            return ResponseEntity.ok(updatedCinema);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCinema(@PathVariable Integer id) {
        try {
            cinemaService.deleteCinema(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }


}
