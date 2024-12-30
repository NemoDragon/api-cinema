package com.example.cinemaapp.cinema;

import com.example.cinemaapp.projection.Projection;
import com.example.cinemaapp.projection.ProjectionRepository;
import com.example.cinemaapp.room.Room;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CinemaService {
    private final CinemaRepository cinemaRepository;
    private final ProjectionRepository projectionRepository;

    public List<Cinema> getAllCinemas() {
        return cinemaRepository.findAll();
    }

    public Optional<Cinema> getCinemaById(Integer id) {
        return cinemaRepository.findById(id);
    }

    public List<Cinema> getCinemasByFilmAndCity(Integer filmId, String city) {
        List<Projection> projections = projectionRepository.findByFilmId(filmId);

        return projections.stream()
                .map(Projection::getRoom)
                .map(Room::getCinema)
                .filter(cinema -> city == null || cinema.getCity().equalsIgnoreCase(city))
                .distinct()
                .collect(Collectors.toList());
    }
    public Integer addCinema(Cinema cinema) {
        Cinema savedCinema = Cinema.builder()
                .id(cinema.getId())
                .name(cinema.getName())
                .city(cinema.getCity())
                .isOpen(cinema.getIsOpen())
                .rating(cinema.getRating())
                .build();
        return cinemaRepository.save(savedCinema).getId();
    }

    public Cinema updateCinema(Integer id, Cinema cinema) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundCinema.setName(cinema.getName());
        foundCinema.setCity(cinema.getCity());
        foundCinema.setIsOpen(cinema.getIsOpen());
        foundCinema.setRating(cinema.getRating());
        return cinemaRepository.save(foundCinema);
    }

    public Cinema partiallyUpdateCinema(Integer id, Cinema cinema) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (cinema.getName() != null) foundCinema.setName(cinema.getName());
        if (cinema.getCity() != null) foundCinema.setCity(cinema.getCity());
        if (cinema.getIsOpen() != null) foundCinema.setIsOpen(cinema.getIsOpen());
        if (cinema.getRating() != null) foundCinema.setRating(cinema.getRating());
        return cinemaRepository.save(foundCinema);
    }

    public void deleteCinema(Integer id) {
        if (!cinemaRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        cinemaRepository.deleteById(id);
    }

    public Cinema openCinema(Integer id) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundCinema.setIsOpen(true);
        return cinemaRepository.save(foundCinema);
    }

    public Cinema closeCinema(Integer id) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundCinema.setIsOpen(false);
        return cinemaRepository.save(foundCinema);
    }

    public Cinema evaluateCinema(Integer id, String rating) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundCinema.setRating(rating);
        return cinemaRepository.save(foundCinema);
    }

    public List<Projection> getProjectionSchedule(Integer id, LocalDate date) {
        Cinema foundCinema = cinemaRepository.findById(id).orElseThrow(EntityNotFoundException::new);

        return foundCinema.getRooms().stream()
                .flatMap(room -> room.getProjections().stream())
                .filter(projection -> projection.getTime()
                        .toInstant()
                        .atZone(ZoneId.systemDefault())
                        .toLocalDate()
                        .equals(date))
                .toList();
    }

}
