package com.example.cinemaapp.projection;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProjectionService {
    private final ProjectionRepository projectionRepository;

    public List<Projection> getAllProjections() {
        return projectionRepository.findAll();
    }

    public Optional<Projection> getProjectionById(Integer id) {
        return projectionRepository.findById(id);
    }

    public Integer addProjection(Projection projection) {
        Projection savedProjection = Projection.builder()
                .id(projection.getId())
                .time(projection.getTime())
                .film(projection.getFilm())
                .room(projection.getRoom())
                .build();
        return projectionRepository.save(savedProjection).getId();
    }

    public Projection updateProjection(Integer id, Projection projection) {
        Projection foundProjection = projectionRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundProjection.setTime(projection.getTime());
        foundProjection.setFilm(projection.getFilm());
        foundProjection.setRoom(projection.getRoom());
        return projectionRepository.save(foundProjection);
    }

    public Projection partiallyUpdateProjection(Integer id, Projection projection) {
        Projection foundProjection = projectionRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (projection.getTime() != null) foundProjection.setTime(projection.getTime());
        if (projection.getFilm() != null) foundProjection.setFilm(projection.getFilm());
        if (projection.getRoom() != null) foundProjection.setRoom(projection.getRoom());
        return projectionRepository.save(foundProjection);
    }

    public void deleteProjection(Integer id) {
        if (!projectionRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        projectionRepository.deleteById(id);
    }

}
