package com.example.cinemaapp.seat;

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
@RequestMapping("/seats")
@RequiredArgsConstructor
public class SeatController {
    @Autowired
    private SeatService seatService;

    @GetMapping()
    public ResponseEntity<SeatResponse> getSeats() {
        List<Seat> seats = seatService.getAllSeats();
        return ResponseEntity.ok(new SeatResponse(seats));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Seat> getSeatById(@PathVariable Integer id) {
        Optional<Seat> seat = seatService.getSeatById(id);
        return seat.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addSeat(@RequestBody SeatRequest seatRequest) {
        Integer id = seatService.addSeat(seatRequest.getSeat());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Seat> updateSeat(@PathVariable Integer id, @RequestBody SeatRequest seatRequest) {
        try {
            Seat updatedSeat = seatService.updateSeat(id, seatRequest.getSeat());
            return ResponseEntity.ok(updatedSeat);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<Seat> partiallyUpdateSeat(@PathVariable Integer id, @RequestBody SeatRequest seatRequest) {
        try {
            Seat updatedSeat = seatService.partiallyUpdateSeat(id, seatRequest.getSeat());
            return ResponseEntity.ok(updatedSeat);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSeat(@PathVariable Integer id) {
        try {
            seatService.deleteSeat(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

}