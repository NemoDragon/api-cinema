package com.example.cinemaapp.cinema;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CinemaService {
    private final CinemaRepository cinemaRepository;

    public List<Cinema> getAllCinemas() {
        return cinemaRepository.findAll();
    }

    public Optional<Cinema> getCinemaById(Integer id) {
        return cinemaRepository.findById(id);
    }

    public Integer addCinema(Cinema cinema) {
        Cinema savedCinema = Cinema.builder()
                .id(cinema.getId())
                .name(cinema.getName())
                .city(cinema.getCity())
                .isOpen(cinema.getIsOpen())
                .build();
        return cinemaRepository.save(savedCinema).getId();
    }

    public Cinema updateCinema(Integer id, Cinema cinema) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundCinema.setName(cinema.getName());
        foundCinema.setCity(cinema.getCity());
        foundCinema.setIsOpen(cinema.getIsOpen());
        return cinemaRepository.save(foundCinema);
    }

    public Cinema partiallyUpdateCinema(Integer id, Cinema cinema) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (cinema.getName() != null) foundCinema.setName(cinema.getName());
        if (cinema.getCity() != null) foundCinema.setCity(cinema.getCity());
        if (cinema.getIsOpen() != null) foundCinema.setIsOpen(cinema.getIsOpen());
        return cinemaRepository.save(foundCinema);
    }

    public void deleteCinema(Integer id) {
        if (!cinemaRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        cinemaRepository.deleteById(id);
    }
}
