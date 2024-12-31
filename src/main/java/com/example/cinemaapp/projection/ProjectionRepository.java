package com.example.cinemaapp.projection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectionRepository extends JpaRepository<Projection, Integer> {
    List<Projection> findByFilmId(Integer filmId);
}

