package com.example.cinemaapp.room;

import com.example.cinemaapp.seat.Seat;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/rooms")
@RequiredArgsConstructor
public class RoomController {
    @Autowired
    private final RoomService roomService;

    @GetMapping()
    public ResponseEntity<RoomResponse> getRooms() {
        List<Room> rooms = roomService.getAllRooms();
        return ResponseEntity.ok(new RoomResponse(rooms));
    }

    @PostMapping()
    public ResponseEntity<Object> addRoom(@RequestBody RoomRequest roomRequest) {
        Integer id = roomService.addRoom(roomRequest.getRoom());
        URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(id)
                .toUri();
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Room> updateRoom(@PathVariable Integer id, @RequestBody RoomRequest roomRequest) {
        try {
            Room updatedRoom = roomService.updateRoom(id, roomRequest.getRoom());
            return  ResponseEntity.ok(updatedRoom);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/{id}")
    public ResponseEntity<Room> partiallyUpdateRoom(@PathVariable Integer id, @RequestBody RoomRequest roomRequest) {
        try {
            Room updatedRoom = roomService.partiallyUpdateRoom(id, roomRequest.getRoom());
            return  ResponseEntity.ok(updatedRoom);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteRoom(@PathVariable Integer id) {
        try {
            roomService.deleteRoom(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/open/{id}")
    public ResponseEntity<Room> openRoom(@PathVariable Integer id) {
        try {
            Room openedRoom = roomService.openRoom(id);
            return  ResponseEntity.ok(openedRoom);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PatchMapping("/close/{id}")
    public ResponseEntity<Room> closeRoom(@PathVariable Integer id) {
        try {
            Room closedRoom = roomService.closeRoom(id);
            return  ResponseEntity.ok(closedRoom);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/board/{id}")
    public ResponseEntity<List<Seat>> displayBoardRoom(@PathVariable Integer id) {
        try {
            List<Seat> seats = roomService.displayRoomBoard(id);
            return  ResponseEntity.ok(seats);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

}
