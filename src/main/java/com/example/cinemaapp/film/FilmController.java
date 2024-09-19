package com.example.cinemaapp.film;

import com.example.cinemaapp.cinema.Cinema;
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
@RequestMapping("/films")
@RequiredArgsConstructor
@CrossOrigin
public class FilmController {
    @Autowired
    private FilmService filmService;

    @GetMapping()
    public ResponseEntity<FilmResponse> getFilms() {
        List<Film> films = filmService.getAllFilms();
        return ResponseEntity.ok(new FilmResponse(films));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Film> getFilmById(@PathVariable Integer id) {
        Optional<Film> film = filmService.getFilmById(id);
        return film.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addFilm(@RequestBody FilmRequest filmRequest) {
        Integer id = filmService.addFilm(filmRequest.getFilm());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Film> updateFilm(@PathVariable Integer id, @RequestBody FilmRequest filmRequest) {
        try {
            Film updatedFilm = filmService.updateFilm(id, filmRequest.getFilm());
            return ResponseEntity.ok(updatedFilm);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping ("/{id}")
    public ResponseEntity<Film> partiallyUpdateFilm(@PathVariable Integer id, @RequestBody FilmRequest filmRequest) {
        try {
            Film updatedFilm = filmService.partiallyUpdateFilm(id, filmRequest.getFilm());
            return ResponseEntity.ok(updatedFilm);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteFilm(@PathVariable Integer id) {
        try {
            filmService.deleteFilm(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }




}
