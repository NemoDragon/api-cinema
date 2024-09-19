package com.example.cinemaapp.seatType;

import com.example.cinemaapp.cinema.Cinema;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/seatTypes")
public class SeatTypeController {
    @Autowired
    private SeatTypeService seatTypeService;

    @GetMapping()
    public ResponseEntity<SeatTypeResponse> getSeatTypes() {
        List<SeatType> seatTypes = seatTypeService.getAllSeatTypes();
        return ResponseEntity.ok(new SeatTypeResponse(seatTypes));
    }

    @GetMapping("/{id}")
    public ResponseEntity<SeatType> getSeatTypeById(@PathVariable Integer id) {
        Optional<SeatType> seatType = seatTypeService.getSeatTypeById(id);
        return seatType.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> addSeatType(@RequestBody SeatTypeRequest seatTypeRequest) {
        Integer id = seatTypeService.addSeatType(seatTypeRequest.getSeatType());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<SeatType> updateSeatType(@PathVariable Integer id, @RequestBody SeatTypeRequest seatTypeRequest) {
        try {
            SeatType updatedSeatType = seatTypeService.updateSeatType(id, seatTypeRequest.getSeatType());
            return ResponseEntity.ok(updatedSeatType);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping ("/{id}")
    public ResponseEntity<SeatType> partiallyUpdateSeatType(@PathVariable Integer id, @RequestBody SeatTypeRequest seatTypeRequest) {
        try {
            SeatType updatedSeatType = seatTypeService.partiallyUpdateSeatType(id, seatTypeRequest.getSeatType());
            return ResponseEntity.ok(updatedSeatType);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSeatType(@PathVariable Integer id) {
        try {
            seatTypeService.deleteSeatType(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
