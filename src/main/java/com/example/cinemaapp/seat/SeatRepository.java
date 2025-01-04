package com.example.cinemaapp.seat;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SeatRepository extends JpaRepository<Seat, Integer> {
    @Query("SELECT s FROM Seat s WHERE s.room.id IN (SELECT p.room.id FROM Projection p WHERE p.id = :projectionId)")
    List<Seat> findByRoomProjectionId(@Param("projectionId") Integer projectionId);
}

