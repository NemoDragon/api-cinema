package com.example.cinemaapp.room;

import com.example.cinemaapp.seat.Seat;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoomService {
    private final RoomRepository roomRepository;

    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }

    public Integer addRoom(Room room) {
        Room savedRoom = Room.builder()
                .id(room.getId())
                .roomNumber(room.getRoomNumber())
                .capacity(room.getCapacity())
                .occupied(room.getOccupied())
                .isOpen(room.getIsOpen())
                .cinema(room.getCinema())
                .build();
        return roomRepository.save(savedRoom).getId();
    }

    public Room updateRoom(Integer id, Room room) {
        Room foundRoom = roomRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundRoom.setRoomNumber(room.getRoomNumber());
        foundRoom.setCapacity(room.getCapacity());
        foundRoom.setOccupied(room.getOccupied());
        foundRoom.setIsOpen(room.getIsOpen());
        foundRoom.setCinema(room.getCinema());
        return roomRepository.save(foundRoom);
    }

    public Room partiallyUpdateRoom(Integer id, Room room) {
        Room foundRoom = roomRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if(room.getRoomNumber() != null) foundRoom.setRoomNumber(room.getRoomNumber());
        if(room.getCapacity() != null) foundRoom.setCapacity(room.getCapacity());
        if(room.getOccupied() != null) foundRoom.setOccupied(room.getOccupied());
        if(room.getIsOpen() != null) foundRoom.setIsOpen(room.getIsOpen());
        if(room.getCinema() != null) foundRoom.setCinema(room.getCinema());
        return roomRepository.save(foundRoom);
    }

    public void deleteRoom(Integer id) {
        if (!roomRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        roomRepository.deleteById(id);
    }

    public Room openRoom(Integer id) {
        Room foundRoom = roomRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundRoom.setIsOpen(true);
        return roomRepository.save(foundRoom);
    }


    public Room closeRoom(Integer id) {
        Room foundRoom = roomRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundRoom.setIsOpen(false);
        return roomRepository.save(foundRoom);
    }

    public List<Seat> displayRoomBoard(Integer id) {
        Room foundRoom = roomRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        return foundRoom.getSeats();

    }


}
