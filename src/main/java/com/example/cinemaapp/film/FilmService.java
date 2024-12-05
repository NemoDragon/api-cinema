package com.example.cinemaapp.film;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

@Service
@RequiredArgsConstructor
public class FilmService {
    private final FilmRepository filmRepository;

    public List<Film> getAllFilms() {
        return filmRepository.findAll();
    }

    public Optional<Film> getFilmById(Integer id) {
        return filmRepository.findById(id);
    }

    public Integer addFilm(Film film) {
        Film savedFilm = Film.builder()
                .id(film.getId())
                .title(film.getTitle())
                .year(film.getYear())
                .releaseDate(film.getReleaseDate())
                .duration(film.getDuration())
                .ageCategory(film.getAgeCategory())
                .genre(film.getGenre())
                .description(film.getDescription())
                .director(film.getDirector())
                .actors(film.getActors())
                .imageUrl(film.getImageUrl())
                .build();
        return filmRepository.save(savedFilm).getId();
    }

    public Film updateFilm(Integer id, Film film) {
        Film foundFilm = filmRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundFilm.setTitle(film.getTitle());
        foundFilm.setYear(film.getYear());
        foundFilm.setReleaseDate(film.getReleaseDate());
        foundFilm.setDuration(film.getDuration());
        foundFilm.setAgeCategory(film.getAgeCategory());
        foundFilm.setGenre(film.getGenre());
        foundFilm.setDescription(film.getDescription());
        foundFilm.setDirector(film.getDirector());
        foundFilm.setActors(film.getActors());
        foundFilm.setImageUrl(film.getImageUrl());
        return filmRepository.save(foundFilm);
    }

    public Film partiallyUpdateFilm(Integer id, Film film) {
        Film foundFilm = filmRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (film.getTitle() != null) foundFilm.setTitle(film.getTitle());
        if (film.getYear() != null) foundFilm.setYear(film.getYear());
        if (film.getReleaseDate() != null) foundFilm.setReleaseDate(film.getReleaseDate());
        if (film.getDuration() != null) foundFilm.setDuration(film.getDuration());
        if (film.getAgeCategory() != null) foundFilm.setAgeCategory(film.getAgeCategory());
        if (film.getGenre() != null) foundFilm.setGenre(film.getGenre());
        if (film.getDescription() != null) foundFilm.setDescription(film.getDescription());
        if (film.getDirector() != null) foundFilm.setDirector(film.getDirector());
        if (film.getActors() != null) foundFilm.setActors(film.getActors());
        if (film.getImageUrl() != null) foundFilm.setImageUrl(film.getImageUrl());
        return filmRepository.save(foundFilm);
    }

    public void deleteFilm(Integer id) {
        if (!filmRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        filmRepository.deleteById(id);
    }



    public List<Film> sortFilms(String key, String query) {
        List<Film> films = searchFilms(query);
        return sortFilms(key, films);
    }

    private List<Film> sortFilms(String key, List<Film> films) {
        return switch (key) {
            case "title" -> films.stream().sorted(Comparator.comparing(Film::getTitle)).toList();
            case "year" -> films.stream().sorted(Comparator.comparing(Film::getYear)).toList();
            case "release_date" -> films.stream().sorted(Comparator.comparing(Film::getReleaseDate)).toList();
            case "duration" -> films.stream().sorted(Comparator.comparing(Film::getDuration)).toList();
            default -> films.stream().sorted(Comparator.comparing(Film::getId)).toList();
        };
    }

    public List<Film> searchFilms(String query) {
        return filmRepository.findAll().stream().filter(c -> c.getTitle().contains(query)).toList();
    }
}
