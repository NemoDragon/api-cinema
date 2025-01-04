package com.example.cinemaapp.seat;

import com.example.cinemaapp.seatType.SeatType;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SeatService {
    private final SeatRepository seatRepository;

    public List<Map<String, Object>> getSeatsWithTypes(Integer projectionId) {
        List<Seat> seats = seatRepository.findByRoomProjectionId(projectionId);

        return seats.stream().map(seat -> {
            SeatType seatType = seat.getType();
            Map<String, Object> seatData = new HashMap<>();
            seatData.put("id", seat.getId());
            seatData.put("rowLetter", seat.getRowLetter());
            seatData.put("columnNumber", seat.getColumnNumber());
            seatData.put("isOccupied", seat.getIsOccupied());
            seatData.put("typeName", seatType.getName());
            seatData.put("cost", seatType.getCost());
            return seatData;
        }).collect(Collectors.toList());
    }


    public List<Seat> getAllSeats() {
        return seatRepository.findAll();
    }

    public Optional<Seat> getSeatById(Integer id) {
        return seatRepository.findById(id);
    }

    public Integer addSeat(Seat seat) {
        Seat savedSeat = Seat.builder()
                .id(seat.getId())
                .rowLetter(seat.getRowLetter())
                .columnNumber(seat.getColumnNumber())
                .isOccupied(seat.getIsOccupied())
                .room(seat.getRoom())
                .type(seat.getType())
                .build();
        return seatRepository.save(savedSeat).getId();
    }

    public Seat updateSeat(Integer id, Seat seat) {
        Seat foundSeat = seatRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        foundSeat.setRowLetter(seat.getRowLetter());
        foundSeat.setColumnNumber(seat.getColumnNumber());
        foundSeat.setIsOccupied(seat.getIsOccupied());
        foundSeat.setRoom(seat.getRoom());
        foundSeat.setType(seat.getType());
        return seatRepository.save(foundSeat);
    }

    public Seat partiallyUpdateSeat(Integer id, Seat seat) {
        Seat foundSeat = seatRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        if (seat.getRowLetter() != null) foundSeat.setRowLetter(seat.getRowLetter());
        if (seat.getColumnNumber() != null) foundSeat.setColumnNumber(seat.getColumnNumber());
        if (seat.getIsOccupied() != null) foundSeat.setIsOccupied(seat.getIsOccupied());
        if (seat.getRoom() != null) foundSeat.setRoom(seat.getRoom());
        if (seat.getType() != null) foundSeat.setType(seat.getType());
        return seatRepository.save(foundSeat);
    }

    public void deleteSeat(Integer id) {
        if (!seatRepository.existsById(id)) {
            throw new EntityNotFoundException();
        }
        seatRepository.deleteById(id);
    }
}
